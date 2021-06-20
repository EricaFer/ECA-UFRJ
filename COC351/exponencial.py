import math

def exponencial(x): 
  return math.e**x

def maclaurin_exp(x,truncamento):
  exp = 0
  s=0
  for i in range(0,truncamento): #truncamento qual potencia será calculada
    s = (x**i)/math.factorial(i) #x^n/n!
    exp = exponencial(x) + s #e^x + serie segundo i
    return exp

if __name__ == "__main__":
  x = input("Insira o valor de x:")
  print(x)
  x = float(x)
  if not x > 0 and x<1:
    print("X deve estar entre 0 e 1")
    x = input("Insira o valor de x:")
    x = float(x)
  
  truncamento = 9 
  #erro verdadeiro =  valor exato - valor estimado ( pela serie de MacLaurin)
  error_exp = exponencial(x) - maclaurin_exp(x,truncamento) 
  if error_exp <0: #fazendo o erro ser absoluto
    error_exp = error_exp*(-1)
  
  print("O valor estimado de e^{:.2f} é {:.16f}".format(x,maclaurin_exp(x,truncamento)))
  print("O erro absoluto é {:.16f}".format(error_exp))
