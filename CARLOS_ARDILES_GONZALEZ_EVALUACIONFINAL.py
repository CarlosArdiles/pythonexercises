# CARLOS FRANCO ARDILES GONZALEZ


#listando abecedarios
#variables
abecedario = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ"
aberot = "NÑOPQRSTUVWXYZABCDEFGHIJKLM"
listaabecedario = list(abecedario)
listaabeinv = list(aberot)


#MENU
print(" ENCRIPTADOR v1.0 ".center(70,"="))
print("Carlos Ardiles Gonzalez".center(70,"."))
print(".".center(70,"."))
print("Comenzaremos a encriptar:".upper().ljust(70,"_"))
print("_".center(70,"_"))
textoprueba = input("Mensaje:")
#textoprueba = "Guaca Mole!"
tpruebalista = list(textoprueba)
print(".".center(70,"."))


busqueda=[]
listaencriptada=[]
sincodigo=[]

#DESARROLLO FUNCION: devuelve una lista con las posiciones del abecedario:
def EnlaceAbecedario(palabra):
    listapalabra=list(palabra)
    i=0
    while i < len(listapalabra):
        
        if str(listapalabra[i]).isalpha():
        
            a = (str(listapalabra[i])).upper()
            b = abecedario.index(a)
            busqueda.append(b)
            
        elif str(listapalabra[i]).isnumeric():
            a=float(listapalabra[i])
            
            busqueda.append(a)
       
        else:
            busqueda.append(listapalabra[i])
        i+=1
            
    return(busqueda)


listaposiciones= EnlaceAbecedario(textoprueba)


def FormatoTexto(listatexto):
    i=0
    formato=[]
    while i < len(listatexto):
        
        if str(tpruebalista[i]).isupper():
            a=str(listatexto[i]).upper()
            formato.append(a)
            
        else:
            b=str(listatexto[i]).lower()
            formato.append(b)
        i+=1
        ajunto="".join(formato)
              
    return(ajunto)


def Encriptandoando(listauno):
    i = 0
    listaencriptada=[]
    
    while i < len(listauno):
        if str(listauno[i]).isalnum() :
            
            a = int(listauno[i])
            b = aberot[a]
            listaencriptada.append(b)
        elif type(listauno[i]) is float:
            a=int(listauno[i])
            listaencriptada.append(a)
            
        else:
            listaencriptada.append(listauno[i])
        i+=1
    txtencrip= FormatoTexto(listaencriptada)

    return(txtencrip)


textoencriptado= Encriptandoando(listaposiciones)

def FueraCodigo(lista2):
    i=0

    sincodigo=[]
    while i < len(lista2):
        if str(lista2[i]).isalpha():
            
            a= str(lista2[i]).upper()
            b= aberot.index(a)
            c= abecedario[b]
            sincodigo.append(c)
            
        elif str(lista2[i]).isnumeric():
            
            a=float(lista2[i])
            sincodigo.append(a)
            
        else:
            sincodigo.append(lista2[i])
        i+=1

    ttt = FormatoTexto(sincodigo)      
    print(ttt) 
    return(sincodigo)

listasincodigo = FueraCodigo(textoencriptado)
FormatoTexto(listasincodigo)

        
   



print("Texto encriptado: "+ Encriptandoando(listaposiciones))
print("Texto desenncriptado: "+ FormatoTexto(listasincodigo))
print(".".center(70,"."))
print("_".center(70,"_"))
print(" GRACIAS ".center(70,"="))

        



        




