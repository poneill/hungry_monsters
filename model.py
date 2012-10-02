class Gene(object):
    @staticmethod
    def equals(a,b):
        return "%s=%s\n" % (a,b)

    def __init__(self,name,translation_rate,mRNA_degradation_rate,
                 protein_degradation_rate,basal_transcription_rate,
                 upstream_interactions):
        self.name = name
        self.translation_rate = translation_rate
        self.mRNA_degradation_rate = mRNA_degradation_rate
        self.protein_degradation_rate = protein_degradation_rate
        self.basal_transcription_rate = basal_transcription_rate
        self.upstream_interactions = upstream_interactions
        self.promoter = self.name + "_promoter"
        self.bound_promoter = self.name + "_bound_promoter"
        self.mRNA = self.name + "_mRNA"
        self.protein = self.name + "_protein"
        self.init_promoter = 1
        self.init_bound_promoter = 0
        self.init_mRNA = 0
        self.init_protein = 0

        
    def write_reaction(self,label,reactants,products,rate_factors):
        #TODO: infer reaction rate from reactants
        reaction_label = self.name + "_" + label + ":"
        reactant_string = "+".join(map(str,reactants)) if reactants else "$pool"
        product_string = "+".join(map(str,products)) if products else "$pool"
        reaction_eq = "\t" + reactant_string + " > " + product_string
        reaction_rate = "\t" + "*".join(map(str,rate_factors))
        return "\n".join([reaction_label,
                         reaction_eq,
                         reaction_rate])    

    def init_params(self):
        return "\n".join([Gene.equals(self.promoter,self.init_promoter),
                          Gene.equals(self.bound_promoter,self.init_bound_promoter),
                          Gene.equals(self.mRNA,self.init_mRNA),
                          Gene.equals(self.protein,self.init_protein)])
        
    def write(self):
        """return a string describing all of gene's interactions'"""
        param_string = self.init_params()
        translation_string = self.write_reaction("translation",
                                                 [self.mRNA],
                                                 [self.mRNA,self.protein],
                                                 [self.translation_rate,self.mRNA])
        mRNA_deg_string = self.write_reaction("mRNA_degradation",
                                              [self.mRNA],
                                              [],
                                              [self.mRNA_degradation_rate,self.mRNA])
        protein_deg_string = self.write_reaction("protein_degradation",
                                              [self.protein],
                                              [],
                                              [self.protein_degradation_rate,
                                               self.protein])
        basal_transcription_string = self.write_reaction("basal_transcription",
                                              [self.promoter],
                                              [self.promoter,self.mRNA],
                                              [self.basal_transcription_rate,
                                               self.promoter])
        return "\n".join([param_string,translation_string,mRNA_deg_string,
                         protein_deg_string, basal_transcription_string])
        
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
                init_bound_promoter = 0
                init_mRNA = 0
                init_protein = 1
                promoter = gene + "_promoter"
                bound_promoter = gene + "_bound_promoter"
                mRNA = gene + "_mRNA"
                protein = gene + "_protein"
                f.write("%s = %s\n" % (promoter,init_promoter))
                f.write("%s = %s\n" % (bound_promoter,init_bound_promoter))
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
                bound_complex =  regulated + "_bound_promoter"
                f.write(reaction_name + "_complex_formation:\n")
                f.write("\t%s + %s > %s\n" % (regulator_protein, regulated_promoter,
                                              bound_complex))
                f.write("\t%s*%s*%s\n" % (binding_rate,regulator_protein,
                                          regulated_promoter))
                f.write(reaction_name + "_complex_dissociation:\n")
                f.write("\t%s > %s + %s\n" % (bound_complex,regulator_protein,
                                              regulated_promoter))
                f.write("\t%s*%s\n" % (unbinding_rate,bound_complex))
                if mode == activation:
                    f.write(reaction_name + "_transcription:\n")
                    f.write("\t%s > %s + %s\n" % (bound_complex,bound_complex,
                                                  regulated_mRNA))
                    f.write("\t%s*%s\n" % (transcription_rate,bound_complex))
                        
def main():
    m = Model(["X","Y","Z"],[["X","Y",100,-1],["Y","Z",100,-1],["Z","X",100,-1]])
    m.write("foo.psc")
    mod = stochpy.SSA(File="foo.psc",dir='.')
    mod.DoStochSim(end=100000)
    mod.PlotTimeSim(species2plot=['X_protein','Y_protein','Z_protein'])

print "loaded"
