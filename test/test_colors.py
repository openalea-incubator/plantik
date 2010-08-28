from openalea.plantik.tools.colors import *


class test_colors():

    def __init__(self):
        self.c = Colors()

    def test_color(self):
        self.c.black
        assert self.c.black.transparency == 0

        self.c.red
        self.c.leaf
    
