#!/usr/bin/python3  
print('Welcome to Shape Tester! lets find some Volume and Surface areas of shapes.')
print (' ')

from Box import Box
from Sphere import Sphere
from Pyramid import Pyramid
myShape = input('Select a shape to find the calculations for: Box = 1 Sphere = 2  Pyramid = 3. Your selection: ')
print(' ')

myShape = str(myShape)
if myShape == '1':
  b1 = Box()
  b1.l = input('Enter value for box length:')
  b1.w = input('Enter value for box width:')
  b1.h = input('Enter value for box height:')
  print('Box Volume:', b1.calcVol())
  print('Box Surface Area:', b1.calcSA())
  print(' ')

elif myShape == '2':
  s1 = Sphere()
  s1.r = input ('Enter value for radius:')
  print('Sphere Volume:', s1.calcVol())
  print('Sphere Surface Area:', s1.calcSA())
  print(' ')

elif myShape == '3':
  p1 = Pyramid()
  p1.a = input('Enter value for Pyramid Base edge:')
  p1.h = input('Enter value for Pyramid height:')
  print('Pyramid Volume:', p1.calcVol())
  print('Pyramid Surface Area:',p1.calcSA())
  print(' ')

else:
  print('Invalid Number, Restart the program.')