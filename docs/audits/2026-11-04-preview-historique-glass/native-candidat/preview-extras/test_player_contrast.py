#!/usr/bin/env python3
"""Static contrast check for two worst-opacity background gradient endpoints."""
import unittest

def luminance(rgb):
 c=[x/255 for x in rgb]
 c=[v/12.92 if v<=0.04045 else ((v+0.055)/1.055)**2.4 for v in c]
 return 0.2126*c[0]+0.7152*c[1]+0.0722*c[2]
def ratio(foreground,background):
 x,y=sorted((luminance(foreground),luminance(background)),reverse=True)
 return (x+0.05)/(y+0.05)
def blend(fore,back,alpha):
 return tuple(round(alpha*x+(1-alpha)*y) for x,y in zip(fore,back))
class Contrast(unittest.TestCase):
 def test_reference_colors(self):
  for bg in [blend((123,63,228),(43,20,86),0x73/255),blend((224,72,158),(10,6,20),0x59/255)]:
   self.assertGreaterEqual(ratio((201,192,234),bg),4.5)
   self.assertGreaterEqual(ratio((255,255,255),bg),4.5)
if __name__=='__main__':unittest.main(verbosity=2)
