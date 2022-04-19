# Un Script Es un conjunto de instrucciones  pensadas para ejecutarse  conjuntamente
#y así conseguir resolver un determinado problema. Este script calcula las soluciones
#para ana ecuación de segundo grado (ax^2+bx+c=0). Los valores a, b y c se especifican
#a continuación:

a=1
b=2
c=-3

discr= sqrt(b*b -4*a*c)
raiz1 = (-b+discr)/(2*a)
raiz2 = (-b-discr)/(2*a)

#print() Muestra un mensaje por pantalla; paste() permite crear un único texto 
#concatenando variables y texto
print(paste("Las raíces son", raiz1, "y", raiz2))

#Prueba a ejecutar todo el script con el botón "Source" (parte superior derecha del editor)

#A continuación, prueba a cambiar el valor de c por 3 (positivo). ¿Qué pasa?

#Finalmente, prueba a retirar los paréntesis de las líneas 11 y 12. ¿Qué pasa?