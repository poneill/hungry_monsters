
def mean(xs):
    return sum(xs)/float(len(xs))

def median(xs):
    mp = int(len(xs)/2)
    if len(xs) % 2 == 1:
        return sorted(xs)[mp]
    else:
        return mean(sorted(xs)[mp-1:mp+1])
    
def variance(xs):
    return mean([x**2 for x in xs]) - mean(xs) ** 2

def zipWith(f,xs,ys):
    return map(lambda(x,y):f(x,y),zip(xs,ys))

def transpose(xxs):
    return zip(*xxs)

print "loaded utils"
