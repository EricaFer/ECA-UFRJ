P0 = 1.0
Q0 = t = 0.0
def dif_P(P,Q):
        return Q

def dif_Q(P,Q):
    return -P

def diffs(dif_x,dif_y):
    return(dif_x,dif_y)

def Euler_Method(tmax,h,P0,Q0,t):

    while t < tmax:
        t = round((t+h),2)
        P = P0 + dif_P(P0,Q0)*h
        Q = Q0 + dif_Q(P0,Q0)*h
        Q0 = Q
        P0 = P

    return ((t,round(P,2)),(t,round(Q,2)))

def Heun_Method(tmax,h,P0,Q0,t):
    while t < tmax:
        t = round((t+h),2)
        K1_P = dif_P(P0,Q0)
        K1_Q = dif_Q(P0,Q0)
        K2_P = dif_P(P0 + (K1_P*h),Q0 + h)
        K2_Q = dif_Q(P0 + h,Q0 + (K1_Q*h))
        P = P0 + (0.5*K1_P + K2_P)*h
        Q = Q0 + (0.5*K1_Q + K2_Q)*h
        Q0 = Q
        P0 = P

    return ((t,round(P,2)),(t,round(Q,2)))

def Runge_Kutta_4th(tmax,h,P0,Q0,t):

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


print(Euler_Method(20,0.01,1.0,0.0,0))
print(Heun_Method(20,0.4,1.0,0.0,0))
print(Runge_Kutta_4th(20,0.1,1.0,0.0,0))

'''
Resultado: ((20.0, 0.45), (20.0, -1.01))
           ((20.0, -309.89), (20.0, -2805.2))
           ((20.0, -52.74), (20.0, 5.95))

Ao mudar os passos, podemos evidenciar as diferenças, entretando não mudei o tmax,
uma vez que isso daria resultados diferentes porém não devido ao método'''
