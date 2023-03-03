# credit Youtube at "Wrt Tech" 
def piglatin():
  words = input("input sentance: ").split()
  for word in words:
    print(word[1:] + word[:1] + 'ay', end = ' ')

piglatin()