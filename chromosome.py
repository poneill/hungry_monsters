import stochpy,random
class Chromosome(object):
    serial_no = 0
    mrna_cost = 1
    protein_cost = 2
    sugar_benefit = 10
    num_params = 94
    
    def __init__(self,genotype=None):
        if genotype is None:
            self.genotype = [random.random() for i in range(Chromosome.num_params)]
        else:
            self.genotype = genotype
        self.cached_fitness = None
        self.serial_no = Chromosome.serial_no
        Chromosome.serial_no += 1
        
    def fitness(self):
        timesteps = 10000
        if not self.cached_fitness is None:
            return self.cached_fitness
        with open("template.psc") as f:
            template = "".join(f.readlines())
            model = (template % tuple(self.genotype))\
                .replace("alpha",str(Chromosome.mrna_cost))\
                .replace("beta",str(Chromosome.protein_cost))\
                .replace("gamma",str(Chromosome.sugar_benefit))
            filename = "model%s.psc" % self.serial_no
            with open(filename,'w') as f:
                f.write(model)
        mod = stochpy.SSA(Method="TauLeaping", File=filename,dir='.')
        mod.DoStochSim(epsilon=.05,end=timesteps,trajectories=1)
        atp_label = mod.data_stochsim.species_labels.index('ATP')
        self.cached_fitness = mod.data_stochsim.species[-1][atp_label]
        return self.cached_fitness
        
    def recombine(self,other):
        crossover_point = random.randrange(Chromosome.num_params)
        return Chromosome(self.genotype[:crossover_point] +
                          other.genotype[crossover_point:])

    def mutate(self,points=1):
        genotype = self.genotype
        for point in range(points):
            r = random.random()
            genotype[random.randrange(Chromosome.num_params)] = r
        return Chromosome(genotype)

print "loaded chromosome"

