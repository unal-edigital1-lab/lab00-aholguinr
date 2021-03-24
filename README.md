## laboratorio 01 introducción a HDL

## Estudiante: Andrés Holguín Restrepo

En este laboratorio inicial se empezó el acercamiento al software Quartus mediante la creación y simulación de un sumador de 1 bit y su uso para generar el sumador de 4 bits.


Tuve varios problemas al inicio. La carpeta de trabajo de los laboratorios que creaba siempre estaba vacía, pero con la ayuda de mis compañeros y las tutorias del profesor estos problemas se arreglaron al final, ya que lo ideal es no utilizar ningun caracter especial como tíldes para estos archivos.


Los códigos a implementar se encontraban en la guia de laboratorio, sin embargo me quedé "jugando" con ellos para empezar a acostumbrarme al lenguaje de programación para los archivos verilog.

### Sum1bcc
Lo primero fue mirar el sumador de 1 bit. En él aprendí a utilizar registros para almacenar datos y el bloque de lógica combinacional always @(*) para este tipo de casos.
![alt text](https://github.com/unal-edigital1-lab/lab00-aholguinr/blob/master/Imagenes/cod1bit.png?raw=true "Código sum1bcc")

### Sum4bcc
Lo siguiente fue utilizar el top level sum4bcc que implementa el sumador de un bit para generar un sumador de 4 bits. Esto con el hecho de unir 4 sumadores de 1 bit mediante "wires", que en este caso se crearon 3 diferentes, pero que se pudo hacer un arreglo de wires y asignar posiciones para cada conexión necesaria. Tambien se utilizan registros de 4 bits con el fin de almacenar los resultados del sumador, lo cual es mucho más práctico a crear variables para cada salida de información.
![alt text](https://github.com/unal-edigital1-lab/lab00-aholguinr/blob/master/Imagenes/cod4bit.png?raw=true "Código sum4bcc")

### testbench
Con el código del testbench se tiene una estructura diferente a los anteriores archivos. Por un lado se tiene el bucle que aumenta los valores de entrada "x" y "y" desde 0 hasta 15, que en binario sería hasta 1111. De este modo se tienen todas las combinaciones posibles para la simulación. También se tiene otro código en el mismo módulo que inicializa todas las variables y asigna un tiempo final de simulación.
![alt text](https://github.com/unal-edigital1-lab/lab00-aholguinr/blob/master/Imagenes/codtb.png?raw=true "Código testbench")


### Simulación

Otro aspecto que me costó entender fue utilziar apropiadamente la interfaz de simulación, ya que no entendía muy bien el testbench. Sin embargo lo logré entender y ya sé implementarlo. De este modo logré ajustar los tiempos entre cada caso y asignar un tiempo total a la simulación para que no se quede en un bucle todo el tiempo.

A continuación muestro dos imagenes de los resultados de la simulación, una de los primeros casos y la otra de los últimos:

![alt text](https://github.com/unal-edigital1-lab/lab00-aholguinr/blob/master/Imagenes/sim1.png?raw=true "Simulación 1")

![alt text](https://github.com/unal-edigital1-lab/lab00-aholguinr/blob/master/Imagenes/sim2.png?raw=true "Simulación 2")

### Asignación de pines

Ya teniendo la simulación completa, lo restante es implementar lo creado en la fpga directamente. A partir del mapa de pines para la tarjeta asignada, se asignan los 8 deepswitches a las entradas del sumador de 4 bits con el fin de tener los 2 valores de 4 bits que se van a sumar. Así mismo, también se asignan las salidas del sumador a 5 leds de la fpga, 4 para el valor resultante y el restante para el carry de la suma.

![alt text](https://github.com/unal-edigital1-lab/lab00-aholguinr/blob/master/Imagenes/pinplanner.png?raw=true "Asignación de pines")


### NETLISTS VIEWERS

#### RTL VIEWER
Ya con la asignación de pines completada, se compila el proyecto y se pueden ver diversos resultados. El primero es el RTL VIEWER, donde se ven las "cajas" lógicas utilizadas y sus interconexiones, y los pines de entrada y de salida del sumador.

![alt text](https://github.com/unal-edigital1-lab/lab00-aholguinr/blob/master/Imagenes/rtlviewer.png?raw=true "rtl viewer")

#### TECHNOLOGY MAP VIEWER (POST-MAPPING)

El otro resultado a ver, es el technology map viewer (post-mapping), donde se identifican las conexiones realizadas entre el sumador y los pines físicos de la fpga.
![alt text](https://github.com/unal-edigital1-lab/lab00-aholguinr/blob/master/Imagenes/tmvpm.png?raw=true "technology map viewer (post-mapping)")

### Chip planner

Por último, se puede ver el chip planner de la fpga para el caso del sumador, donde se pueden identificar los bloques lógicos utilizados y sus posiciones físicas dentro del chip.

![alt text](https://github.com/unal-edigital1-lab/lab00-aholguinr/blob/master/Imagenes/chipplanner.png?raw=true "Chip planner(post-mapping)")
