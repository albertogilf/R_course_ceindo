# Un Script es un conjunto de instrucciones  pensadas para ejecutarse  conjuntamente
#y as� conseguir resolver un determinado problema. Este script calcula las soluciones
#para una ecuaci�n de segundo grado (ax^2+bx+c=0). Los valores a, b y c se especifican
#a continuaci�n:

a=1
b=2
c=-3

discr = sqrt(b*b -4*a*c)
raiz1 = (-b+discr)/(2*a)
raiz2 = (-b-discr)/(2*a)

#print() Muestra un mensaje por pantalla; paste() permite crear un �nico texto 
#concatenando variables y texto que se separan por ","
print(paste("Las ra�ces son", raiz1, "y", raiz2))

#Prueba a ejecutar todo el script con el bot�n "Source" (parte superior derecha del editor)

#A continuaci�n, prueba a cambiar el valor de c por 3 (positivo). �Qu� pasa?

#Finalmente, prueba a retirar los par�ntesis de las l�neas 11 y 12. �Qu� pasa?