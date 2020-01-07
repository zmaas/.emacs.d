#!/bin/python

import sys
from sympy import *
x, y, z, t = symbols('x y z t')
k, m, n = symbols('k m n', integer=True)
f, g, h = symbols('f g h', cls=Function)
init_printing()
sys.stdout.write(eval('latex(' + str(sys.argv[1]).replace('\\', '') \
    .replace('^', '**') \
    .replace('{', '(') \
    .replace('}', ')') + ')'))
