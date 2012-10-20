import stochpy,random,re
import networkx as nx
class Chromosome(object):
    serial_no = 0
    mrna_cost = 1
    protein_cost = 2
    sugar_benefit = 10
    num_params = 73
    
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
        mod = stochpy.SSA(File=filename,dir='.')
        mod.DoStochSim(end=timesteps,trajectories=1)
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
        
    def visualize(self):
        g = nx.DiGraph()
        nodes = ["U","V","X","Y","Z","T","P"]
        node_label_templates = ["%s",
                                 "%s_activated_transcription",
                                 "%s_basal_transcription",
                                 "%s_repressed_transcription"]
        node_labels = [nlt % n for nlt in node_label_templates
                       for n in nodes]
        for node_label in node_labels:
            if "transcription" in node_label:
                rate = self.parse_model_file(node_label + ":")
            else:
                rate = 'blue'
            g.add_node(node_label,color=rate)
        for node in nodes:
            for node_label in node_labels:
                if node in node_label and not node == node_label:
                    g.add_edge(node,node_label)
        pos = nx.spring_layout(g)
        for i,(node_label,data) in enumerate(g.nodes(data=True)):
            nx.draw_networkx_nodes(g,pos,nodelist = [node_label],
                                   node_color=data['color'])
        for node1 in nodes:
            for node2 in nodes:
                activation_rate = self.parse_model_file(node1 + "_activates_" + node2 +":")
                repression_rate = self.parse_model_file(node1 + "_represses_" + node2 +":")
                if activation_rate is None or repression_rate is None:
                    continue
                g.add_edge(node1,node2,color=activation_rate * 1)
                nx.draw_networkx_edges(g,pos,edgelist = [(node1,node2)],
                                       width=activation_rate * 1,
                                       edge_color='green')
                g.add_edge(node1,node2,color=repression_rate * 1)
                nx.draw_networkx_edges(g,pos,edgelist = [(node1,node2)],
                                       width=repression_rate * 1,
                                       edge_color='red')
        #nx.draw_networkx_edges(g,pos,edgelist = g.edges())
        nx.draw_networkx_labels(g,pos,{label:label
                                       for (label,data) in g.nodes(data=True)})

    def parse_model_file(self,reaction_label):
        with open("model%s.psc" % self.serial_no) as f:
            lines = [line.strip() for line in f.readlines()]
        try:
            reaction_line_index = lines.index(reaction_label)
        except:
            return None
        rate_line = lines[reaction_line_index + 2]
        rate = re.search(r"(\d.\d*)",rate_line).group()
        return float(rate)
        
print "loaded chromosome"
