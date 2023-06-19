import sys
import os
import subprocess
#ruta del fichero v#
#ruta_archivo = sys.argv[1]
ruta_archivo = "D:\Desktop\VMGR_TFG_V2\IDE\Win32\Debug\debug.v#"
print(ruta_archivo)

#se abre el ficheroen modo lectura
with open(ruta_archivo, 'r') as archivo:
    lineas = archivo.readlines()
        
reglas=["if(", "vswitch(", "while("]

log=["log de fallos\n"]

#lineas - lista de las lineas del fichero
#reglas - lista de las "modificaciones"
#log - lista de errores mostrables mas tarde

def contar_caracteres_en_lista(lineas,uno,dos):
    #testea los numeros de caracteres
    contador = 0

    for linea in lineas:
        for caracter in linea:
            if caracter == uno:
                contador += 1
            elif caracter == dos:
                contador -= 1

    return contador == 0

def comp_car_ap_cier(sentencia,uno,dos):
# funcion que comprueba si los caracteres estan correctos, ya sea numeros y posición
#return True correcto
#return False error

    pila = []
    for caracter in sentencia:
        if caracter == uno:
            pila.append(caracter)
        elif caracter == dos:
            if not pila:
                return False
            pila.pop()
    
    return len(pila) == 0
    

def lanza_if(numero):
    #metodo analiza la entrada del if y lo transforma o traduce en python
    indice=numero
    if comp_car_ap_cier(lineas[numero],'(',')'):
        #testea parentesis una vez mas (nunca es suficiente) y separa el comparador
        lineas[numero]= "if " + lineas[numero].split("if(")[1].split("){")[0].strip() + ":"
        lineas[numero]= lineas[numero]+"\n"
        indice=indice+1
        #if formado
        while not "}" in lineas[indice]:
            lineas[indice]="\t" + lineas[indice]
            indice=indice+1
            #en caso de no tener } lanza el error
            if indice == len(lineas):
                log.append("falta el '}' en caso "+str(numero))
                break
            #genera tabs en el if para que lo entienda python    
            
    if "}" in lineas[indice]:
        lineas[indice]=""
        
        #deja de meter tabs y quita }
        
    
    
def lanza_switch(numero):
    indice=numero        
    if comp_car_ap_cier(lineas[numero],'(',')'):
        #testea parentesis una vez mas (nunca es suficiente) y separa el comparador
        #me quedo solo con el comparable, lo que esta entre parentesis:
        indice_parentesis_abierto = lineas[numero].find("(") + 1  # Índice del carácter después del paréntesis abierto
        indice_parentesis_cerrado = lineas[numero].find(")", indice_parentesis_abierto)  # Índice del paréntesis cerrado

        comparable = lineas[numero][indice_parentesis_abierto:indice_parentesis_cerrado]
        if comparable == '':
            log.append("error sintactico en linea "+ str(numero) +"\n")
        lineas[numero]=""
        contacase=0
        
        while not "}" in lineas[indice]:
            
            if "case" in lineas[indice]:
                contacase=contacase+1
                
                #me quedo con el caso
                
                indice_comilla_abierta = lineas[indice].find('"') + 1  # Índice del carácter después de la comilla abierta
                indice_comilla_cerrada = lineas[indice].find('"', indice_comilla_abierta)  # Índice de la comilla cerrada
                contenido_entre_comillas = lineas[indice][indice_comilla_abierta:indice_comilla_cerrada]
                #creo el if:
                if contacase >= 2:
                    lineas[indice] = "elif "+comparable+" == " +contenido_entre_comillas+":\n"
                else:
                    lineas[indice] = "if "+comparable+" == " +contenido_entre_comillas+":\n"
                    #en caso de no tener } lanza el error
                if indice == len(lineas):
                    log.append("falta el '}' en caso "+str(numero))
                    break
            
            indice=indice+1
            
            
    else:
        #lanza error de parentesis
        log.append("error parentesis en linea "+ str(numero) +"\n")
    lineas[indice]=""

    
    #si lo pongo se rompe
    #fixed
    if contacase == 0:
        log.append("no se ha detectado ningun case en linea "+ str(numero) +"\n")
        
        
def lanza_while(numero):
    #testea parentesis una vez mas (nunca es suficiente) y separa el comparador
    indice=numero
    if comp_car_ap_cier(lineas[numero],'(',')'):
        lineas[numero]= "while " + lineas[numero].split("while(")[1].split("){")[0].strip() + ":"
        lineas[numero]= lineas[numero]+"\n"
        indice=indice+1
        while not "}" in lineas[indice]:
            lineas[indice]="\t" + lineas[indice]
            indice=indice+1
            #en caso de no tener } lanza el error
            if indice == len(lineas):
                log.append("falta el '}' en caso "+numero)
                break
    
            
    if "}" in lineas[indice]:
        lineas[indice]=""
        


def comprobar_reglas(lineas, reglas):
    #lanza funcion principal, comprueba reglas y se mete en ellas
    contador=0
    for linea in lineas:
        for elemento in reglas:
            if isinstance(elemento, str) and elemento in linea:
                #log de regla encontrada
                print(f"La línea '{linea.strip()}' contiene el elemento '{elemento}'.")
                log.append(f"La línea '{linea.strip()}' contiene el elemento '{elemento}'.")
                  
                  #clasifica entre reglas (se haria mejor con un switch, para eso lo implemento)
                if elemento == "if(":
                    lanza_if(int(contador))
                if elemento == "vswitch(":
                    lanza_switch(int(contador)) 
                if elemento == "while(":
                    lanza_while(int(contador))
            
            else:
                print("no se ha detectado codigo v#\n")
                log.append("no se ha detectado codigo v#\n")
        contador=contador+1         
            
    ruta_py=os.path.dirname(ruta_archivo)+"\\debug.py"
    ruta_log=os.path.dirname(ruta_archivo)+"\\log.txt"
            
         #escribe resultado en debug py, el cual, se abre a continuacion, ya que ese es el objetivo    
    with open(ruta_py, "w") as archivo2:
        archivo2.writelines(lineas)
        #escribe el log, se podira abrir tras la ejecucion pero es algo que normalmente al usuario no le suele agradar ver mucho texto
    with open(ruta_log, "w") as archivo2:
        archivo2.writelines(log)
        
        
def lanza_python():
    #lanza el codigo traducido
    
    ruta ='py ' + os.path.dirname(ruta_archivo)+"\\debug.py"
    subprocess.call('cls', shell=True)
    subprocess.call(ruta, shell=True)
                
                
comprobar_reglas(lineas, reglas)
lanza_python()




