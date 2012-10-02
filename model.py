def write_reaction(self,label,reactants,products,rate):
        #TODO: currently does not handle stoichiometry of reactions
        #such as A + A -> B
        reaction_label = self.name + "_" + label + ":"
        reactant_string = " + ".join(map(str,reactants)) if reactants else "$pool"
        product_string = " + ".join(map(str,products)) if products else "$pool"
        reaction_eq = "\t" + reactant_string + " > " + product_string
        reaction_rate_string = "\t" + str(rate) + \
            ((" * " + " * ".join(map(str,reactants))) if reactants else "")
        return "\n".join([reaction_label,
                          reaction_eq,
                          reaction_rate_string]) + "\n"


class Network(object):
    def __init__(self,interactions):
        gene_names = set(sum([(regulator,regulated)
                          for (regulator,regulated,_,_)
                              in interactions],()))
        def relevant_interactions(reg):
            return [(regulator,regulated,rate,mode)
                    for (regulator,regulated,rate,mode) in interactions
                    if regulator == reg]
        self.genes = [Gene(name, interactions=interactions)
                      for name in gene_names]
        self.sugar = Sugar(genes[0],genes[-1])
    def write(self):
        return "\n".join([g.write() for g in self.genes]) + self.sugar.write()

    def write_to_file(self,filename):
        with open(filename,'w') as f:
            f.write(self.write())

class Sugar(object):
    def __init__(self,sensor,catalyst):
        self.sensor = sensor.name
        self.catalyst = catalyst.name
        self.phosphorylation_rate = 100
        self.catalysis_rate = 1
        self.production_rate = 1
        self.degradation_rate = 1
    def write(self):
        phosphorylation = write_reaction("phosphorylation",
                                         ["s",self.sensor],
                                         ["s",self.sensor + "star"],
                                         self.phosphorylation_rate)
        catalysis = write_reaction("catalyis",
                                   ["sugar",self.catalyst],
                                   [self.catalyst, "sugar_eaten"],
                                   self.catalysis_rate)
        production = write_reaction("production",
                                   [],
                                   ["sugar"],
                                   self.production_rate)
        degradation = write_reaction("degradation",
                                   ["sugar"],
                                   [],
                                   self.degradation_rate)
        return "\n".join([phosphorylation,catalysis,production,degradation])
    
class Gene(object):
    @staticmethod
    def equals(a,b):
        return "%s=%s\n" % (a,b)

    def __init__(self,name,interactions,translation_rate=1,
                 mRNA_degradation_rate=1, protein_degradation_rate=0.1,
                 basal_transcription_rate=1,active_transcription_rate=10):
        self.name = name
        self.translation_rate = translation_rate
        self.mRNA_degradation_rate = mRNA_degradation_rate
        self.protein_degradation_rate = protein_degradation_rate
        self.basal_transcription_rate = basal_transcription_rate
        self.active_transcription_rate = active_transcription_rate
        self.unbinding_rate = 1
        self.interactions = filter(lambda (reg,x,y,z):reg == name,interactions)
        self.promoter = self.name + "_promoter"
        self.activated_promoter = self.name + "_activated_promoter"
        self.repressed_promoter = self.name + "_repressed_promoter"
        self.mRNA = self.name + "_mRNA"
        self.protein = self.name + "_protein"
        self.init_promoter = 1
        self.init_activated_promoter = 0
        self.init_repressed_promoter = 0
        self.init_mRNA = 0
        self.init_protein = 0
        
    def init_params(self):
        return "\n".join([Gene.equals(self.promoter,self.init_promoter),
                          Gene.equals(self.activated_promoter,
                                      self.init_activated_promoter),
                          Gene.equals(self.repressed_promoter,
                                      self.init_repressed_promoter),
                          Gene.equals(self.mRNA,self.init_mRNA),
                          Gene.equals(self.protein,self.init_protein)])

    def translation_string(self):
        return write_reaction(self.name + "_translation",
                                                 [self.mRNA],
                                                 [self.mRNA,self.protein],
                                                 self.translation_rate)
    
    def mRNA_deg_string(self):
        return write_reaction(self.name + "_mRNA_degradation",
                              [self.mRNA],
                              [],
                              self.mRNA_degradation_rate)
    
    def translation_string(self):
        return write_reaction(self.name + "_translation",
                                                 [self.mRNA],
                                                 [self.mRNA,self.protein],
                                                 self.translation_rate)

    def mRNA_deg_string(self):
        return write_reaction(self.name + "_mRNA_degradation",
                                              [self.mRNA],
                                              [],
                                              self.mRNA_degradation_rate)
    
    def protein_deg_string(self):
        return write_reaction(self.name + "_protein_degradation",
                                              [self.protein],
                                              [],
                                              self.protein_degradation_rate)
    
    def basal_transcription_string(self):
        return write_reaction(self.name + "_basal_transcription",
                                              [self.promoter],
                                              [self.promoter,self.mRNA],
                                              self.basal_transcription_rate)
    
    def active_transcription_string(self):
        return write_reaction(self.name + "_active_transcription",
                              [self.activated_promoter],
                              [self.activated_promoter,self.mRNA],
                              self.active_transcription_rate)
    def write(self):
        """return a string describing all of gene's interactions'"""
        regulations = "\n".join(map(self.write_reaction_from_interaction,
                                    self.interactions))
        return "\n".join([self.init_params(),self.translation_string(),
                          self.mRNA_deg_string(),self. protein_deg_string(),
                          self. basal_transcription_string(),
                          self. active_transcription_string(),self. regulations])

    def write_reaction_from_interaction(self,interaction):
        regulator, regulated,rate,mode = interaction
        if regulator == self.name:
            def describe(mode):
                return "_activates_" if mode == 1 else "represses_"
            def product(mode):
                return (regulated + "_activated_promoter" if mode == 1
                        else regulated + "_repressed_promoter")
            return (write_reaction(self.name + describe(mode) + regulated,
                                       [self.protein,regulated + "_promoter"],
                                       [product(mode)],
                                       rate) +
                    self.write_reaction(self.name + "_un" + describe(mode) + regulated,
                                       [product(mode)],
                                       [self.protein,regulated + "_promoter"],
                                       self.unbinding_rate))
        else:
            return ""

class PhosphorylatingGene(Gene):
    def __init__(self,args):
        Gene.__init__(self,args)
        self.protein_star = self.protein + "star"
        self.init_protein_star = 0
        self.protein_star_degradation_rate = self.protein_degradation_rate

    def init_params(self):
        return (super.init_params() +
                "\n" +
                Gene.equals(self.protein_star, self.init_protein_star))
    
    def protein_deg_string(self):
        return (super.protein_deg_string(self) +
                "\n" +
                write_reaction(self.protein_star + "_degradation",
                               [self.protein_star],
                               [],
                               self.protein_star_degradation_rate))

    def write_reaction_from_interaction(self,interaction):
        regulator, regulated,rate,mode = interaction
        return super.write_reaction_from_interaction([s])

               
class Model(object):
    def __init__(self,genes,interactions):
        self.genes = genes
        self.interactions = interactions
        
    def write(self,filename):
        with open(filename,'w') as f:
            f.write("# Reactions\n")
            for gene in self.genes:
                translation_rate = 10
                mRNA_degradation_rate = 1
                protein_degradation_rate = 0.1
                basal_transcription_rate = 0.1
                init_promoter = 1
                init_activated_promoter = 0
                init_mRNA = 0
                init_protein = 1
                promoter = gene + "_promoter"
                activated_promoter = gene + "_activated_promoter"
                mRNA = gene + "_mRNA"
                protein = gene + "_protein"
                f.write("%s = %s\n" % (promoter,init_promoter))
                f.write("%s = %s\n" % (activated_promoter,init_activated_promoter))
                f.write("%s = %s\n" % (mRNA,init_mRNA))
                f.write("%s = %s\n" % (protein,init_protein))
                f.write(gene + "_translation:\n")
                f.write("\t%s > %s + %s\n" % (mRNA, mRNA,protein))
                f.write("\t%s*%s\n" % (translation_rate,mRNA))
                f.write(mRNA + "_degradation:\n")
                f.write("\t%s> $pool\n" % mRNA)
                f.write("\t%s*%s\n" % (mRNA_degradation_rate,mRNA))
                f.write(gene + "_degradation:\n")
                f.write("\t%s> $pool\n" % protein)
                f.write("\t%s*%s\n" % (protein_degradation_rate,protein))
                f.write(gene + "_basal_transcription:\n")
                f.write("\t %s> %s + %s\n" % (promoter,promoter,mRNA))
                f.write("\t%s*%s\n" % (basal_transcription_rate,promoter))
            for i,interaction in enumerate(self.interactions):
                activation = 1 #for comparison to mode
                reaction_name = "R" + str(i)
                regulator, regulated, binding_rate, mode = interaction
                regulator_protein = regulator + "_protein"
                regulated_promoter = regulated + "_promoter"
                regulated_mRNA = regulated + "_mRNA"
                unbinding_rate = 1
                transcription_rate = 100
                activated_complex =  regulated + "_activated_promoter"
                f.write(reaction_name + "_complex_formation:\n")
                f.write("\t%s + %s > %s\n" % (regulator_protein, regulated_promoter,
                                              activated_complex))
                f.write("\t%s*%s*%s\n" % (binding_rate,regulator_protein,
                                          regulated_promoter))
                f.write(reaction_name + "_complex_dissociation:\n")
                f.write("\t%s > %s + %s\n" % (activated_complex,regulator_protein,
                                              regulated_promoter))
                f.write("\t%s*%s\n" % (unbinding_rate,activated_complex))
                if mode == activation:
                    f.write(reaction_name + "_transcription:\n")
                    f.write("\t%s > %s + %s\n" % (activated_complex,activated_complex,
                                                  regulated_mRNA))
                    f.write("\t%s*%s\n" % (transcription_rate,activated_complex))
                        
def main():
    m = Model(["X","Y","Z"],[["X","Y",100,-1],["Y","Z",100,-1],["Z","X",100,-1]])
    m.write("foo.psc")
    mod = stochpy.SSA(File="foo.psc",dir='.')
    mod.DoStochSim(end=100000)
    mod.PlotTimeSim(species2plot=['X_protein','Y_protein','Z_protein'])

def main2():
    trans_interactions = [
        ["x","y",10,1],
        ["y","z",20,-1],
        ["x","z",10,1]
        ]
    n = Network(trans_interactions)
    n.write_to_file("bar.psc")
    mod = stochpy.SSA(File="bar.psc",dir='.')
    mod.DoStochSim(end=10000,trajectories=1)
    #mod.PlotInterpolatedData()
    mod.PlotTimeSim(species2plot=['x_protein','y_protein','z_protein'])

print "loaded"
