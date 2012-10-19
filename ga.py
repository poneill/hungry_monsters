from chromosome import Chromosome
from utils import *

class GA(object):
    def __init__(self,pop_size=100,k=2,init_pop = None):
        self.pop_size = pop_size
        self.k = k
        if init_pop is None:
            self.population = [Chromosome() for i in range(pop_size)]
        else:
            self.population = init_pop

    def iterate():
        new_pop = [max([random.choice(self.population) for i in range(k)],
                       key=lambda chromosome: chromosome.fitness())
                   for j in range(self.pop_size)]
        self.population = new_pop

    def mean_fitness(self):
        return mean([c.fitness() for c in self.population])

    def variance_fitness(self):
        return var([c.fitness() for c in self.population])
    
print "loaded ga"
