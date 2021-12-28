#! /usr/bin/env python

value = 40
rate = 1.085
#fix = 0.0021
fix = 0.00305
old = value

r = rate - fix
for i in range (26):
  print ("#%2d" % i, "Value: %3d" % value, "Gain: %f" % (float (value) / float (old)), "Delta: %d" % (value - old))
  old = value
  r += (fix if i <= 15 else - (fix * 1.64))
  value = int ((value * r) + 0.5)
