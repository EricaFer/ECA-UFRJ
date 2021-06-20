from time import sleep
from os import system, name
from scipy.integrate import odeint

import math
import numpy as np
import matplotlib.pyplot as plt

#https://nm.mathforcollege.com/mws/gen/08ode/mws_gen_ode_phy_problem.pdf

'''O código faz o cálculo em Kelvin pois é a medida do SI'''

def celsius2kelvin(a):#transforma de Celsius para Kelvin 
    return a + 273.15

def kelvin2celsius(a):#transforma de Kelvin para Celsius
    return a - 273.15

def far2kelvin(a):#transforma de Farenheit para Kelvin
    return ((a - 32)*(5/9))+273.15

def kelvin2far(a):#transforma de Kelvin para Farenheit
    return ((a - 273.15)*(9/5))+ 32

def transforma(t1,direction,escala):#transforma temperaturas baseada na escala escolhida

    if direction == 'k2': #direção kelvin to, isto é, kelvin para outra escala
        if escala in {'K','k','Kelvin','kelvin'}:
            t1 = t1
        elif escala in {'C','c','Celsius','celsius'}:
            t1 = kelvin2celsius(t1)
        elif escala in {'F','f','Farenheit','farenheit'}:
            t1 = kelvin2far(t1)
    
    elif direction == '2k': # direção 2 kelvin, isto é, de outra escala para kelvin
        if escala in {'K','k','Kelvin','kelvin'}:
            t1 = t1
        elif escala in {'C','c','Celsius','celsius'}:
            t1 = celsius2kelvin(t1)
        elif escala in {'F','f','Farenheit','farenheit'}:
            t1 = far2kelvin(t1)
    
    return t1 #retorna a temperatura já transformada

def clear(): 
        if name == 'nt': 
            _ = system('cls')

def cleanse(tempo):#tempo é os segundos até apagar o que foi escrito no prompt
        sleep(tempo)
        clear()

def radiation(A,e,teta,teta_a):#calcula a perda por radiação
    ''' 
    A = surface area of the ball, m^2
    e = emittance
    sb = Stefan-Boltzmann cte = 5.67x10^-8, J/s.m^2.K^4
    teta = temperature of the ball at a given time, K
    teta_a = temperature of the ambient, K

    heat lost due to radiation = - A*e*sb*(teta^4 - teta_a^4)
    '''

    return -A*e*sb*(teta**4 - teta_a**4)

def convection(teta, teta_a,A):#calcula a perda por convecção
    '''
    h = convective cooling coeficient, [W/m^2-K]
    A = surface area of the ball, m^2
    teta = temperature of the ball at a given time, K
    teta_a = temperature of the ambient, K

    heat lost due to convection = - h*A*(teta - teta_a)

    I'll be using h = 350 J/(s - m^2 - K)
    '''
    h = 350

    return -h*A*(teta - teta_a)

def radius(densidade):#calcula o raio da esfera segundo o p'eso da esfera e do material

    #m = 0.3 #massa constante de 300 g ( está em kg)
    volume = m/densidade
    #volume da esfera = 4/3 * pi *r^3 (coloquei em função do raio)

    return ((volume*3)/(4*math.pi))**(1./3)

def diff(teta,t):#calcula a derivada
    ''' - radiantion - convection = m.C.(dteta/dt)

        dteta/dt = -radiantion - convection / m.C'''

    return (radiation(A,e,teta,teta_a) + convection(teta, teta_a,A))/(m*C)

def user_input():
    print('\n\nSuponha que você tem uma esfera metálica de {:.2f} kg que foi aquecida\n\nImaginou?\n\n'.format(m))
    cleanse(2)
    print('Agora você precisa saber em quanto tempo essa esfera vai chegar até determinada temperatura\n\n')
    print("\n\nÉ esse o cálculo que o código se propõe a fazer")
    cleanse(3)

    valid = False #user input validator

    while not valid:#pergunta material
        #Reference: http://easypythondocs.com/validation.html
        try:
            print('\n\nEscolha o material da esfera escrevendo o seu respectivo número\n\n')
            material = int(input('1.Ferro \n2.Alumínio \n3.Cobre\n4.Bronze\n\n'))
            cleanse(1)

            if material in {1,2,3,4} :
                valid = True

        except:
            print('Sua resposta é inválida, por favor tente de novo\n')
            cleanse(1)

    valid = False

    while not valid:#pergunta escala
        try:
            escala = str(input("Qual escala termométrica gostaria de usar (Celsius, Kelvin, Farenheit)?\n\n"))

            if escala in {'K','k','C','c','F','f','Celsius','celsius','Kelvin','kelvin','Farenheit','farenheit'}:
                valid = True
                cleanse(1)
           
        except:
            print('Sua resposta é inválida, por favor tente de novo\n')
            cleanse(1)

    valid = False

    while not valid:#pergunta temperatura inicial
        try:
            temperatura_inicial = float(input("Diga a temperatura inicial da esfera\n\n"))
            valid = True
            cleanse(1)

        except:
            print('Sua resposta é inválida, por favor tente de novo\n')
            cleanse(1)

    valid = False

    while not valid:#pergunta temperatura final
        try:
            temperatura_final = float(input('Diga a temperatura que você quer que seja atingida pela esfera\n\nOBS: tem que ser inferior à temperatura inicial e superior à temperatura ambiente\n\n'))
            cleanse(2)

            teta_a = 300.0 #temperatura ambiente em Kelvin
            temp_amb = transforma(teta_a,'k2',escala)#transforma temp ambiente na escala termométrica escolhida para depois comparar
            
            if temperatura_inicial >= temperatura_final and temperatura_final >= temp_amb:
                valid = True

        except:
            print('Sua resposta é inválida, por favor tente de novo\n')
            cleanse(1)

    return material,escala,temperatura_inicial,temperatura_final,teta_a

def calculus(temperatura_final):
    #C = specific heat, J/(kg.K)
    #densidade = kg/m^3

    #como cada material tem uma densidade e calor específico diferentes, estão sendo denominados aqui
    if material == 1:#Ferro
        C = 460.548
        densidade = 7900

    elif material == 2:#Alumínio
        C = 921.096
        densidade = 2600

    elif material == 3:#Cobre
        C = 393.5592
        densidade = 8900

    elif material == 4:#Aço
        C = 486
        densidade = 7800

    #Como a temp inicial foi colocada na escala escolhida, agr precisa converter p Kelvin
    teta = transforma(temperatura_inicial,'2k',escala)
    temperatura_final = transforma(temperatura_final,'2k',escala)
    
    #Raio está em metros
    r = radius(densidade)
    A = 4.0*math.pi*(r**2.0) #surface area = 4.pi.r^2
    e = 0.85 #emittance

    return  r,A,e,C,teta,temperatura_final

def Runge_Kutta(teta_rk):
    k1 = diff(teta_rk,t)
    k2 = diff(teta_rk + 0.5*k1*s,t)
    k3 = diff(teta_rk + 0.5*k2*s,t)
    k4 = diff(teta_rk + k3*s,t)
    teta_rk += (1.0/6.0)*s*(k1+2.0*k2+2.0*k3+k4)

    return teta_rk

def Euler(teta_euler):
    teta_euler += diff(teta_euler,t)*s
    return teta_euler

def fix_print(material,escala):#ajeita as variáveis para printar

    if material == 1:#Ferro
        material = 'Ferro'
    elif material == 2:#Alumínio
        material = 'Alumínio'
    elif material == 3:#Cobre
        material = 'Cobre'
    elif material == 4:#Aço
        material = 'Aço'

    if escala in {'K','k','Kelvin','kelvin'}:
        escala = 'K'
    elif escala in {'C','c','Celsius','celsius'}:
        escala =   'C'
    elif escala in {'F','f','Farenheit','farenheit'}:
        escala = 'F'

    return(material,escala)
    
def erro_relativo(estimado):

    erro_absoluto = val_exp_final[i] - estimado

    return erro_absoluto/abs(val_exp_final[i])

if __name__ == "__main__":
    t = 0.0
    i = 0
    sb = 5.67e-8
    s = 2 #step
    m = 10 #massa da esfera 

    material,escala,temperatura_inicial,temperatura_final,teta_a = user_input()
    r,A,e,C,teta,temperatura_final = calculus(temperatura_final)

    time = [t]
    relativo_rk = []
    val_exp_final = []
    relativo_euler = []

    teta_rk_vector = [temperatura_inicial]
    teta_euler_vector = [temperatura_inicial]
    value = [temperatura_inicial]

    teta_rk = teta_euler = teta

    while teta_rk  > temperatura_final:#loop se baseia no Runge-Kutta 4a ordem
       
        teta_rk = Runge_Kutta(teta_rk)
        teta_euler = Euler(teta_euler)

        t = t + s

        #Tranforma para plotar na escala termométrica escolhida
        teta_rk_temp = transforma(teta_rk,'k2',escala)
        teta_euler_temp = transforma(teta_euler,'k2',escala)

        #Joga transformado nas listas 
        teta_rk_vector.append(teta_rk_temp)
        teta_euler_vector.append(teta_euler_temp)
        time.append(t)
   
    material,escala = fix_print(material,escala)
    temperatura_final = transforma(temperatura_final,'k2',escala)
    valor_esperado = odeint(diff,teta,time)
    val = list(map(float, valor_esperado))

    while i < len(time): #Tranforma para plotar na escala termométrica escolhida

        val_exp_final.append(transforma(val[i],'k2',escala))
        relativo_euler.append(erro_relativo(teta_euler_vector[i]))
        relativo_rk.append(erro_relativo(teta_rk_vector[i]))

        i += 1

    print('\n\nA esfera de {:.2f} kg de {} de {:.2f}° {} chega à {:.2f}° {} em {:.2f} segundos.'.format(m,material,temperatura_inicial,escala,temperatura_final,escala,t))
    print('\nO Erro Relativo de Euler {:.6f} e Erro Relativo de Runge-Kutta de 4a ordem {:.6f}'.format(relativo_euler[-1],relativo_rk[-1]))
    
    ax1,ax2 = plt.subplots()

    x = np.array(time)
    y1 = np.array(teta_rk_vector)   
    y2 = np.array(teta_euler_vector)
    y3 = np.array(val_exp_final)
    y4 = np.array(relativo_euler)
    y5 = np.array(relativo_rk)

    plt.subplot(2, 1, 1)
    plt.plot(x,y3, label = 'Valor Esperado', color = 'blue')#Calculado por LSODA - FORTRAN
    plt.plot(x,y1, label = 'Runge-Kutta 4a ordem', color = 'purple')
    plt.plot(x,y2, label = 'Euler', color = 'red')
    plt.ylabel('Temperatura({}°)'.format(escala))
    plt.grid(True)
    plt.legend()

    plt.subplot(2,1,2)
    plt.plot(x, y4, label = 'Erro Relativo de Euler', color = 'red')
    plt.plot(x, y5, label = 'Erro Relativo de Runge-Kutta 4a ordem', color = 'purple')
    plt.suptitle('Resfriamento de esfera metálica')
    plt.ylabel('Porcentagem (%)')
    plt.xlabel('Tempo(s)')
    plt.grid(True)
    plt.legend()
    
    plt.show()
    

    

