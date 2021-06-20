'''
1. Um sistema dinâmico é descrito pelas seguintes equações diferenciais:

dP/dt = a*P + c*P*Q
dQ/dT = b*Q + d*P*Q

com P(0) = P0 e Q(0) = Q0.

Escreva uma "function" que compute P(t) e Q(t) entre 0 e t = tmax, com passo temporal h, usando o método de Euler, 
que é um método de Runge-Kutta de primeira ordem, ou de série de Taylor de primeira ordem. 
A function deve receber tmax e h, e devolver duas listas de tuplas, uma delas contendo tuplas (t,P(t)) e a outra contendo tuplas (t,Q(t)).

Teste com a = 2.0, b = -1.0, c = -1.0, d = 3.0, P0 = 2.0, Q0 = 6.0, tmax = 20.0 e h = 0.01.

3. Faça o mesmo que no exercício anterior, porém utilizando o método de Runge-Kutta padrão de 4a ordem.
'''

def Runge_Kutta_4th(tmax,h):
    
    def dif_P(P,Q):
        a = 2.0
        c = -1.0
        return (a*P+c*P*Q)

    def dif_Q(P,Q):
        b = -1.0
        d = 3.0
        return(b*Q + d*P*Q)

    def diffs(dif_P,dif_Q):
        return(dif_P,dif_Q)
    
    P0 = 2.0
    Q0 = 6.0
    Q = P = t = 0

    while t < tmax:
        t = round((t+h),2)
        K1_P = dif_P(P0,Q0)
        K1_Q = dif_Q(P0,Q0)
        K2_P = dif_P(P0 + (K1_P*h*0.5),Q0 + h*0.5)
        K2_Q = dif_Q(P0 + (h*0.5),Q0 + (K1_Q*h*0.5))
        K3_P = dif_P(P0 + (0.5*K2_P*h), Q0 + (0.5*h))
        K3_Q = dif_P(P0 + (0.5*h), Q0 + (0.5*K2_Q*h))
        K4_P = dif_P(P0 + (K3_P*h),Q0 + h)
        K4_Q = dif_Q(P0 + h, Q0 + (K3_P*h))
        P = P0 + (h/6)*( K1_P + 2*K2_P + 2*K3_P + K4_P)
        Q = Q0 + (h/6)*( K1_Q + 2*K2_Q + 2*K3_Q + K4_Q)
        Q0 = Q
        P0 = P

    return ((t,round(P,2)),(t,round(Q,2)))

print(Runge_Kutta_4th(20.0,0.01))
