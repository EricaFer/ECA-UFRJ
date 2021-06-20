#Feito por Erica da Cunha Ferreira

def Seideil(A,B,n):
    i = 0
    #Verifica se a matriz é adequada
    def matrix_verifier(A):
        answer =  0
        for i in range(0,len(A)):
            '''Professor, apesar do slide n explicitar, esse código só funciona para matrizes quadradas,
               existem métodos para a solução de não quadradas mas esse não é o caso'''
            if A[i][i] != 0 and len(A) == len(A[i]): 
                answer = 1
            else:
                answer = 0
        return answer
    
    answer = matrix_verifier(A)
    
    x = [0]*len(A[i])#Inicializando os valores suspeitos de x

    if answer == 1:
        for l in range(0,n):
            for i in range(0,len(A)):
                x_temp = 0
                for j in range(0,len(A)):
                    if i != j:
                        x_temp += (A[i][j])*(x[j])
                        x[i] = (B[i]- x_temp)/A[i][i]
                        x[i] = round(x[i],2)
    else:
        return ("A matriz inserida não é adequada\nNão foi possível realizar a operação")


    return x
