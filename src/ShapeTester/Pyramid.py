import math 
class Pyramid: 
  a = 0
  h = 0
  def __init__(self):
    
    self.a = 0
    self.h = 0

  def calcVol(self):
    
    vol = float(self.a) * float(self.h) * (1/3)
    return vol

  def calcSA(self): 
    sa = (float(self.a)*float(self.a))+ (2 * float(self.a)) * math.sqrt ((float(self.a) * float(self.a) / 4) + float(self.h) * float(self.h))
    return sa



