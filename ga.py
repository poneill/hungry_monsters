import random
from chromosome import Chromosome
from utils import *

class GA(object):
    def __init__(self,pop_size=100,k=2,init_pop = None):
        self.pop_size = pop_size
        self.k = k
        self.recombination_rate = 0.89
        self.mutation_rate = 0.1
        self.copy_rate = 0.01
        self.history = [] 
        if init_pop is None:
            self.population = [Chromosome() for i in range(pop_size)]
        else:
            self.population = init_pop

    def select_from_population(self,n):
        return [max([random.choice(self.population) for i in range(self.k)],
                   key=lambda chromosome: chromosome.fitness())
                for j in range(n)]
    def iterate(self):
        self.record_history()
        rates = [self.recombination_rate,self.mutation_rate,self.copy_rate]
        params = map(lambda rate: int(rate*self.pop_size),rates)
        if sum(params) < self.pop_size:
            params[0] +=1
        num_mutants,num_recombinants,num_copies = params
        xs = self.select_from_population(num_recombinants)
        ys = self.select_from_population(num_recombinants)
        recombinants = [x.recombine(y) for (x,y) in zip(xs, ys)]
        mutants = [m.mutate() for m in self.select_from_population(num_mutants)]
        copies = self.select_from_population(num_copies)

        self.population = recombinants + mutants + copies

    def fitnesses(self):
        return [c.fitness() for c in self.population]
    
    def mean_fitness(self):
        return mean(self.fitnesses())

    def variance_fitness(self):
        return variance(self.fitnesses())

    def best_fitness(self):
        return max(self.fitnesses())

    def record_history(self):
        self.history.append([self.best_fitness(),
                             self.mean_fitness(),
                             self.variance_fitness()])
print "loaded ga"
