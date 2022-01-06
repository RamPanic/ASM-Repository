
# Registros del CPU

## Propósito general

Son los encargados de almacenar temporalmente los datos con los que el procesador realiza las operaciones, y de guardar los resultados de dichas operaciones. También se utilizan para guardar direcciones de memoria. Los primeros procesadores tenían un numero limitado de registros de propósito general, esta limitación representaba un problema importante ya que cuando la CPU usaba todos los registros o llamaba una subrutina, el programa se veía forzado a utilizar la pila. Los registros de propósito general **se utilizan para almacenar datos temporalmente.**

 Aún cuando estos registros pueden mantener cualquier tipo de datos,  **algunos tienen cierta funcionalidad específica o son usados de manera especial por algunas instrucciones.**

![enter image description here](https://i.imgur.com/fCE2lhs.png)

Los registros **EAX, EBX, ECX y EDX**  son los únicos en el sentido de que se puede direccionarlos como una palabra o como una parte de un byte. El ultimo byte de la izquierda es la parte «alta», y el ultimo byte de la derecha es la parte «baja».


## Registro de segmento

Un segmento es un área especial en un programa que inicia en un límite de un párrafo, esto es, en una localidad de regularmente divisible entre 16, o 10 hexadecimal. Aunque un segmento puede estar ubicado casi en cualquier lugar de la memoria y, en modo real, puede ser hasta de 64K, solo necesita tanto espacio como el programa requiera para su ejecución.

Un segmento en modo real puede ser de hasta 64K. Se puede tener cualquier número de segmentos; para direccionar un segmento en particular basta cambiar la dirección en el registro del segmento apropiado. Los tres segmentos principales son los segmentos de código, de datos y de la pila.

**Segmento de código.**

El segmento de código (CS) contiene las instrucciones de maquina que son ejecutadas por lo común la primera instrucción ejecutable esta en el inicio del segmento, y el sistema operativo enlaza a esa localidad para iniciar la ejecución del programa. Como su nombre indica, el registro del CS direcciona el segmento de código. Si su área de código requiere mas de 64K, su programa puede necesitar definir mas de un segmento de código.

**Segmento de datos.**

El segmento de datos (DS) contiene datos, constantes y áreas de trabajo definidos por el programa. El registro DS direcciona el segmento de datos. Si su área de datos requiere mas de 64K, su programa puede necesitar definir mas de un segmento de datos.

**Segmento de pila.**  

En términos sencillos, la pila contiene los datos y direcciones que usted necesita guardar temporalmente o para uso de sus "llamadas" subrutinas. El registro de segmento de la pila (SS) direcciona el segmento de la pila.

**Registros de segmento**

Un registro de segmento tiene 16 bits de longitud y facilita un área de memoria para direccionamiento conocida como el segmento actual.

**Registro CS:** El DOS almacena la dirección inicial del segmento de código de un programa en el registro CS. Esta dirección de segmento, mas un valor de desplazamiento en el registro apuntador de instrucción (IP), indica la dirección de una instrucción que es buscada para su ejecución. Para propósito de programación normal no se necesita referenciar al registro CS.

**Registro DS:** La dirección inicial de un segmento de datos de programa es almacenada en el registro DS. En términos sencillos, esta dirección, mas un valor de desplazamiento en una instrucción, genera una referencia a la localidad de un byte especifico en el segmento de datos.

**Registro SS:** El registro SS permite la colocación en memoria de una pila, para almacenamiento temporal de direcciones y datos. El DOS almacena la dirección de inicio del segmento de pila de un programa en le registro SS. Esta dirección de segmento, mas un valor de desplazamiento en el registro del apuntador de pila (SP), indica la palabra actual en la pila que esta siendo direccionada. . Para propósito de programación normal no se necesita referenciar al registro SS.

**Registros ES:** Alguna operaciones con cadenas de caracteres (datos de caracteres) utilizan el registro extra de segmento para manejar el direccionamiento de memoria. En este contexto, el registro ES esta asociado con el registro DI (índice). Un programa que requiere el uso del registro ES puede inicializarlo con una dirección de segmento apropiada.

**Registros FS y GS:** Son registros extra de segmento en los procesadores 80386 y posteriores.
