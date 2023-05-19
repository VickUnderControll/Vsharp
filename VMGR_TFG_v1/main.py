import sys

ruta = sys.argv[1]
print(ruta)
with open("nuevo_archivo.txt", "w") as f:
    f.write(ruta)

