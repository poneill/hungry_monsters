
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
