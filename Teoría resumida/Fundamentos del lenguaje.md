# Fundamentos del lenguaje ensamblador

## Definiciones 

### Identificadores

Nombre elegido por el programador. Sirve para identificar una variable, constante, procedimiento o una etiqueta de código.

### Directivas

Las directivas son comandos que afectan al ensamblador, y no al microprocesador, por lo que no generan código objeto. Sería un comando incrustado en el código fuente que el ensamblador reconoce y actúa en base a ésta. Se utilizan para definir segmentos, símbolos, procedimientos o subrutinas, reservar memoria, etc.

#### Ejemplos

* title
* include
* .code
* proc

### Etiqueta

Las etiquetas son símbolos que utiliza el programa ensamblador para utilizar en lugar de los valores numéricos de las direcciones que se sabrán cuando el programa comience su ejecución.

#### Etiquetas de datos

Identifica la ubicación de una variable y proporciona una manera conveniente de hacer referencia a la variable dentro del código.

* Ejemplo: cuenta DWORD 100

El ensamblador asigna una dirección númerica a cada etiqueta.

#### Etiquetas de código

Una de estas en el área de código de un programa (en donde se encuentran las instrucciones) debe terminar con [:]. Estas se utilizan como destinos de las intrucciones de saltos y de ciclos.

### Operandos

Los operandos pueden ser registros, valores constantes, etiquetas, variables de memoria y cadenas de texto. Los registros son quizá los operandos más frecuentemente usados por las instrucciones.

