import random
from chromosome import Chromosome
from utils import *
from matplotlib import pyplot as plt

class GA(object):
    def __init__(self,pop_size=100,k=2,init_pop = None):
        self.k = k
        self.recombination_rate = 0.89
        self.mutation_rate = 0.1
        self.copy_rate = 0.01
        self.history = [] 
        if init_pop is None:
            self.population = [Chromosome() for i in range(pop_size)]
            self.pop_size = pop_size
        else:
            self.population = init_pop
            self.pop_size = len(init_pop)
        self.gen = 0
        self.record_history()

    def select_from_population(self,n):
        return [max([random.choice(self.population) for i in range(self.k)],
                   key=lambda chromosome: chromosome.fitness())
                for j in range(n)]
    
    def iterate(self,iterations=1):
        for iteration in range(iterations):
            rates = [self.recombination_rate,self.mutation_rate,self.copy_rate]
            params = map(lambda rate: int(rate*self.pop_size),rates)
            if sum(params) < self.pop_size:
                params[0] +=1
                num_mutants,num_recombinants,num_copies = params
                xs = self.select_from_population(num_recombinants)
                ys = self.select_from_population(num_recombinants)
                recombinants = [x.recombine(y) for (x,y) in zip(xs, ys)]
                mutants = [m.mutate()
                           for m in self.select_from_population(num_mutants)]
                copies = self.select_from_population(num_copies)
                self.population = recombinants + mutants + copies
                self.record_history()
                print[self.generation(),self.best_fitness(),self.mean_fitness()]

    def generation(self):
        return len(self.history)
    
    def fitnesses(self):
        return [c.fitness() for c in self.population]
    
    def mean_fitness(self):
        return mean(self.fitnesses())

    def variance_fitness(self):
        return variance(self.fitnesses())

    def best_fitness(self):
        return max(self.fitnesses())

    def record_history(self):
        self.history.append(self.fitnesses())

    def best_chromosome(self):
        return max([c for c in self.population],key=lambda x:x.fitness())
    
    def plot(self):
        bests,means,medians = map(lambda f:map(f,(self.history)),
                                    [max,mean,median])
        plt.plot(bests,label="best")
        plt.plot(means,label="mean")
        plt.plot(medians,label="median")
        reproduction_cutoff = 1/float(self.k) * self.pop_size
        for gen_num,generation in enumerate(self.history):
            for i,organism in enumerate(sorted(generation,reverse=True)):
                org_color = "green" if i < reproduction_cutoff else "red"
                plt.plot(gen_num,organism,color=org_color ,
                         marker='o',linestyle="")
        plt.xlabel("generation")
        plt.ylabel("fitness (net ATP)")
        plt.legend(loc=0,prop={'size':6})
        
        
print "loaded ga"
