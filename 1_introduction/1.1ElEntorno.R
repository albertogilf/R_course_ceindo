# Todo lo que comienza por el s�mbolo "#" es un comentario

#Sumamos dos n�meros; prueba a teclear esto en la consola (Ventana "Console").
#Prueba tambi�n a poner el cursor en esta l�nea y pulsar CTRL+Enter
#Por �ltimo, prueba tambi�n a poner el cursor en la l�nea y pulsar el bot�n de "Run"
#que puedes encontrar en la esquina superior derecha del editor
3+4

# Los operadores de suma, resta, multiplicaci�n y divisi�n son respectivamente
#+, -, * y / . Ejecuta las siguientes sentencias:

2+3
4-5
3*5
2/3

#Las variables permiten almacenar datos que pueden cambiar en el futuro.
#Podemos pensar en ella como una "caja" donde podemos meter un dato, el "contenido
#de la caja". Creemos una variable con nombre "x" y con valor 2

x = 2 #Observa c�mo ha aparecido la variable en el "Global Environment" a la derecha
x # En modo interactivo al teclear una variable se muestra su valor.

# Una variable puede cambiar de valor

x = 5
x
x = x+1 #En esta sentencia se suma 1 a x, y se vuelve a asignar el valor resultado de la suma a x
x
y = 2*x
y

#Puedes probar a ejecutar las sentencias anteriores desde este archivo pulsando ctrl + enter

#Ojo que se distingue entre may�sculas y min�sculas; la siguiente sentencia da un error al ejecutarse

z = 3*X + y

#La sintaxis correcta es

z = 3*x + y

# Adem�s del operador "=" puede emplearse el operador "<-" para las asignaciones

var <- x/y + 5*z
number <- 5 

# Los n�meros reales siempre deben ponerse con "."

real = 4.5

#Podemos ver todos los objetos del entorno con el comando objects.
#Son los mismos objetos que se puede ver en el panel superior derecho

objects()
