# -*- coding: utf-8 -*-

import math
from aa02ex1 import exponencial,maclaurin_exp
from aa02ex2 import seno,coseno,maclaurin_seno

#Função de propagação de erro para multiplicação ( sendo os dois positivos)
def error_propag(x1,x2,errorx1,errorx2):
    return (x1 * errorx2)+(x2*errorx1)

if __name__ == "__main__":
    x = 1
    truncamento = 9
    error_exp = exponencial(x) - maclaurin_exp(x,truncamento)
    error_seno = seno(x) - maclaurin_seno(x,truncamento)
    #Esperado é a aproximação feita pela série de MacLaurin
    esperado = maclaurin_exp(x,truncamento)*maclaurin_seno(x,truncamento)
    error_esperado = error_propag(maclaurin_exp(x,truncamento),maclaurin_seno(x,truncamento),error_exp,error_seno)
    #Estimado é a aproximação feita pela biblioteca .math e o IDLE do PYTHON 3
    estimado = exponencial(x)*seno(x)
    error_estimado = estimado - esperado # Erro estimado é a diferença entre por .math  e o cálculo por MacLaurin
    if error_estimado < 0: #Fazendo o erro ser absoluto
        error_estimado = error_estimado*(-1)
    if error_esperado < 0:
        error_esperado = error_esperado*(-1)
        
    print("O valor estimado de sen({:.1f})*e^({:.1f}) é {:.16f} com o erro absoluto estimado de {:.16f} ".format(x,x,estimado,error_estimado))
    print("O valor esperado de sen({:.1f})*e^({:.1f}) é {:.16f} com o erro absoluto esperado de {:.16f}".format(x,x,esperado,error_esperado))
   
