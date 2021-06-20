import math

def seno(x):
  return math.sin(x)

def coseno(x):
  return math.cos(x)

def maclaurin_seno(x,truncamento):
  s = 0
  sinal = 0
  sin = 0
  #A f(x) = sen(x) na serie de MacLaurin segue um padrão
  #Quando n é par, é seno
  #Quando n é ímpar, coseno
  #Quando n ou (n-1) é divisivel por 4, o sinal é +
  #Quando não é, é negativo

  for i in range(0,truncamento):
    s = (x**i)/(math.factorial(i))
    if i % 2 == 0: #Vendo se n é par
      if i % 4 == 0:
        sinal = 1 #divisivel por 4, sinal = +
      elif (i-2) % 4 == 0:
        sinal = -1
      sin = (seno(x) + s)*sinal
    else:
      if (i-1) % 4 == 0: #(n-1) divisivel por 4, sinal = +
        sinal = 1
      elif (i - 3) % 4 == 0:
        sinal = -1
      sin = (coseno(x) + s)*sinal
  return sin

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
  error_seno = seno(x) - maclaurin_seno(x,truncamento) 
  if error_seno <0: #fazendo o erro ser absoluto
    error_seno = error_seno*(-1)
  
  print("O valor estimado de sen({:.1f}) é {:.16f}".format(x,maclaurin_seno(x,truncamento)))
  print("O erro absoluto é {:.16f}".format(error_seno))

