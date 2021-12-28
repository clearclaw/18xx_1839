#! /usr/bin/env python

value = 10
rate = 1.27947
#fix = 0.0021
fix = -0.0115
old = value

r = rate - fix
for i in range (26):
  print ("#%2d" % i, "Value: %3d" % value, "Gain: %f" % (float (value) / float (old)), "Delta: %d" % (value - old))
  old = value
  r += fix
  value = int ((value * r) + 0.5)
