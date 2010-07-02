class Context(object):
    """Simple structure to store topological information

    """
    def __init__(self, rank=None, order=None, path=None, alpha=1., beta=1.):
        self.rank = rank
        self.path = path
        self.order = order

    def __str__(self):
        res =  '\nContext\n'
        res += '=======\n'
        res += ' - rank=%s\n' % self.rank
        res += ' - path=%s\n' % self.path
        res += ' - order=%s\n' % self.order
        return res
    