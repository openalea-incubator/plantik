from math import exp

class GrowthFunction(object):
    
    def __init__(self, inf_bound, sup_bound, maturation, 
                 growth_function='linear', growth_rate=0.5):
        
        assert sup_bound>inf_bound
        assert growth_rate>=0 and growth_rate<=1
        assert growth_function in ['linear', 'sigmoid']
        
        self._inf_bound = inf_bound
        self._sup_bound = sup_bound
        self._maturation = maturation
        self._growth_rate = growth_rate
        self._growth_function = growth_function
        
    def _getMaturation(self):
        return self._maturation
    maturation = property(_getMaturation, None, None, "")
    
    def _getGrowthFunction(self):
        return self._growth_function
    growth_function = property(_getGrowthFunction, None, None, "")
    
    def _getGrowthRate(self):
        return self._growth_rate
    growth_rate = property(_getGrowthRate, None, None, "")
    
    def _getInfBound(self):
        return self._inf_bound
    inf_bound = property(_getInfBound, None, None, "")
    
    def _getSupBound(self):
        return self._sup_bound
    sup_bound = property(_getSupBound, None, None, "")
    
    def getValue(self, age):
        """returns value of the element given its age
        
        :param age:
        
        """
        if age > self.maturation:
            return self.sup_bound
        
        if self.growth_function == 'linear':
            return self.inf_bound  + (self.sup_bound-self.inf_bound) * \
                float(age)/self.maturation    
        elif self.growth_function == 'sigmoid':
            return self.inf_bound  + (self.sup_bound-self.inf_bound) \
                /(1.+exp(self.growth_rate*(-age+self.maturation/2.)))
    
        
        
    