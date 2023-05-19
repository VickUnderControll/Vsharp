import sys
#C:\Users\usuario\Desktop\VMGR_TFG\IDE\Win32\Debug
print("Número de argumentos:", len(sys.argv))

# Imprime los argumentos
print("Los argumentos son:")
for arg in sys.argv:
    print(arg)

contenido = sys.argv[1]

with open("archivo.txt", "w") as archivo:
    archivo.write(contenido)
archivo.close()

#pasa el archivo a una lista, y la procesa linea a lineaç
