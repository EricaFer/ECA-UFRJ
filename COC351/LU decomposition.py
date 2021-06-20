#Feito por Erica da Cunha Ferreira

def LU_decomp(A):
    P = []#Vetor Permutações
    #Criando matrizes U e L iguais a A (mesma estrutura)
    l = len(A)
    U = [[0]*l]*l
    L = [[0]*l]*l

    #Checando se é quadrada
    for i in range(0,l):
        if len(A) != len(A[i]):
            print("Essa matriz não é quadrada")
    
    #Tranformando L em matriz identidade
    for i in range(0, l):
        for j in range(0,l):
            if i == j:
                L[i][j] = 1
            else:
                L[i][j] = 0
    for k in range(0, l-1):
        for i in range(1,l):
            if (k+i) <= l-1:
                m = (U[k+i][k]/U[k][k])
                L[k+i][k] = round(m,2)
                P.append(L[k+i][k])
                for j in range(0, l):
                    U[k+i][j] = round((U[k+i][j] - m*U[k][j]),2)
                    P.append(U[k+i][j])
    
    return P,L,U






