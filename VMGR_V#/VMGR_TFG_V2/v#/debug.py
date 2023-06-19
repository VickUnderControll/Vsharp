
dni=int( input("Ingresa un numero: "))
calcular=dni % 23
dni=str(dni)

if calcular == 0:
     dni=dni+"t"
elif calcular == 1:
     dni=dni+"r"
elif calcular == 2:
     dni=dni+"w"
elif calcular == 3:
     dni=dni+"a"
elif calcular == 4:
     dni=dni+"g"
elif calcular == 5:
    dni=dni+ "m"
elif calcular == 6:
    dni=dni+ "y"
elif calcular == 7:
     dni=dni+"f"
elif calcular == 8:
    dni=dni+ "p"
elif calcular == 9:
    dni=dni+ "d"
elif calcular == 10:
    dni=dni+ "x"
elif calcular == 11:
   dni= dni+ "b"
elif calcular == 12:
    dni=dni+ "n"
elif calcular == 13:
  dni= dni+  "j"
elif calcular == 14:
   dni= dni+ "z"
elif calcular == 15:
   dni= dni+ "s"
elif calcular == 16:
   dni= dni+ "q"
elif calcular == 17:
   dni= dni+ "v"
elif calcular == 18:
    dni= dni+"h"
elif calcular == 19:
   dni= dni+ "l"
elif calcular == 20:
   dni= dni+ "t"
elif calcular == 21:
    dni= dni+"t"
elif calcular == 22:
  dni= dni+"e"



dni= input("tu dni es: "+dni)
