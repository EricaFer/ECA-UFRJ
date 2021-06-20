def exponential(y,s):
      e=i=fat=potX=1
      for i in range (1,s+1):
            fat = fat*i
            potX=potX*y
            e = e + potX/fat
      return round(e,8)

def g(y,s,z): #para achar a inversa de e^y
      return exponential(y,s) - z
  

def LN_BIS(x,s):
      N = 50
      i = root = 0
      a = a0 = 0.0
      b = b0 = 0.7

      if abs(a-b)> 1E-8:
          for i in range(i,N):
            if g(a,s,x)*g(b,s,x) < 0:
                 if g((a+b)/2,s,x) > 0:
                       b = (a+b)/2
                 else:
                        a = (a+b)/2
            elif g(a,s,x)*g(b,s,x) > 0:
                 a = (a+b)/2
            elif g(a,s,x)*g(b,s,x) == 0:
                  #serve para saber qual que é a função
                  if g(a,s,x) == 0:
                        root = a
                  elif g(b,s,x) == 0:
                        root = b
                  break
      return round(root,8)

def LN_NR(x,s):
      N = 50
      p = p1 = 0.7
      i = 0
      e = 1
      for i in range(i,N):
            if abs(e) > 1E-8:
                  p2 = p1 - ((g(p1,s,x))/(exponential(p1,s)))
                  e = ((p2 - p1)/p2)*100
                  p1 = p2
            print(i,p2,e)
      return round(p2,8)
                  
print(LN_BIS(1.0,9))

#Erica da Cunha Ferreira
