"""
This module implements a parser for PySCeS Model Description
Language files, according to the spec provided [LINK GOES HERE].

Input: A .psc filename Output: A list containing reactions and a
dictionary of initial values.

A reaction is a list of the form:

[[reactants],[products],rate]

A initial value dictionary is a dict of the form:

{'species_name':copy_number}

Example output:

[[['P_protein',' Z_basal_promoter' ,'Z_basal_promoter'],
   ['Z_repressed_promoter '], 0.281893898709],
[['Z_repressed_promoter'],['P_protein','Z_basal_promoter '],1],
[[],['S'],10],
{'X':1}]
"""

import string,re

class Parser(object):
    """Parser class for PSC files"""
    def __init__(self,filename):
        """Initialize a Parser from a PSC filename"""
        with open(filename) as f:
            self.lines = [line.strip() for line in f.readlines()]
        self.reactions = []
        self.init_vals = {}

    def parse_lines_into_sentences(self):
        """Accept a list of lines and return a list of 'sentences'.  A
        sentence is a list of lines which describe a single complete
        assertion about the model: i.e. an individual reaction or
        initial value declarations. """
        sentences = []
        current_reaction = []
        for line in self.lines:
            if self.sees_comment(line) or self.sees_blank_line(line):
                continue #checking for comments needs to happen first.
            elif "=" in line:
                sentences.append([line])
            elif self.sees_reaction_name(line):
                continue
            elif self.sees_reaction_equation(line):
                current_reaction.append(line)
            elif self.sees_reaction_rate(line):
                current_reaction.append(line)
                sentences.append(current_reaction)
                current_reaction = [] # clear the current reaction
                                      # since we've reached the last line
        return sentences

    def parse(self):
        sentences = self.parse_lines_into_sentences()
        for sentence in sentences:
            self.parse_sentence(sentence) #side effects
        return (self.reactions,self.init_vals)
        
    def parse_sentence(self,sentence):
        if len(sentence) == 1: #if an initial value
            return self.parse_init_val(sentence)
        elif len(sentence) == 2:
            return self.parse_reaction(sentence)
        else:
            raise Exception("Sentence could not be parsed:",sentence)

    def parse_init_val(self,sentence):
        line = sentence[0]
        symbol,value = line.split('=')
        self.init_vals[symbol.strip()] = float(value)

    def parse_reaction(self,sentence):
        print sentence
        equation,rate = sentence
        lhs,rhs = equation.split('>')
        reactants,products = map(self.parse_half_equation,[lhs,rhs])
        raw_rate_components = [comp.strip() for comp in rate.split("*")]
        # the Gillespie engine will take care of adjusting the
        # effective rate by the reactant copy numbers, so strip those out.
        rate_components = filter(self.sees_numeric,raw_rate_components)
        rate = reduce(lambda x,y:x*y,rate_components,1)
        self.reactions.append([reactants,products,float(rate)])

    def parse_half_equation(self,half_equation):
        """Take a lhs or rhs and return a list of components"""
        raw_species = [species.strip() for species in half_equation.split('+')
                         if not "$pool" in species] # ignore $pool
        species = self.rectify_coefficients(raw_species)
        return species
        
        
    def rectify_coefficients(self,stoich_vector):
        """Accept a half-reaction vector of the form ['R1','{2}
        R2}',...]  and convert it to a half-reaction vector of the
        form ['R1','R2','R2',...]"""
        if stoich_vector == []:
            return []
        else:
            first_species,rest_species = stoich_vector[0],stoich_vector[1:]
            if "{" in first_species:
                regexp = """\{          #an openstache
                            ([0-9]+)    #any number of digits, which we capture
                            \}          #a closestache
                            \s          #whitespace
                            ([A-Za-z]+) #species name, which we capture"""
                coeff,species = re.search(regexp,
                                          first_species,
                                          re.VERBOSE).groups()
                effective_species = [species] * int(coeff)
                return effective_species + self.rectify_coefficients(rest_species)
            else:
                return [first_species] + self.rectify_coefficients(rest_species)

    def sees_blank_line(self,line):
        return all(char in string.whitespace for char in line)

    def sees_comment(self,line):
        return line.startswith('#')

    def sees_reaction_name(self,line):
        return line.endswith(':')

    def sees_reaction_equation(self,line):
        return ">" in line

    def sees_reaction_rate(self,line):
        return "*" in line or not ">" in line # reaction rate could be
                                              # a single symbol

    def sees_numeric(self,text):
        return re.match("^[0-9.]+$",text)

    def sees_symbol(self,text):
        return re.match("^[A-Za-z]+$",text)
