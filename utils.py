
def mean(xs):
    return sum(xs)/float(len(xs))

def variance(xs):
    return mean([x**2 for x in xs]) - mean(xs) ** 2
