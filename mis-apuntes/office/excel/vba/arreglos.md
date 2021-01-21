# Arreglos en VBA

Un _**arreglo**_ es una serie ordenada de datos, llamados elementos, que están referenciados por un número. Dado que un arreglo existe en la memoria, permite un acceso rápido y fácil manipulación. Es fácil especificar, localizar, o manipular elementos en un arreglo.

Los arreglos tienen los mismos ámbitos de una variable y son declarados de la misma manera que las variables, usando las instrucciones `Dim`, `Static`, `Private` o `Public`. La diferencia entre las variables escalares (variables que no son arreglos) y los arreglos es que generalmente se debe especificar el tamaño del arreglo. Un arreglo donde su tamaño es especificado es un _**arreglo de tamaño fijo**_, y un arreglo que puede cambiar su tamaño mientras un programa se está ejecutando es un _**arreglo dinámico**_.

Que un arreglo esté indexado desde 0 o 1 depende de la configuración de la instrucción `Option Base`. Si `Option Base 1` no es especificado al comienzo del módulo, todos los índices de los arreglos comenzarán en cero.

La siguiente línea de código, declara un arreglo de tamaño fijo de tipo Integer y tiene 11 filas y 11 columnas:

    Dim MyArray(10, 10) As Integer

El primer argumento representa las filas; el segundo argumento representa las columnas. El espacio de almacenamiento del arreglo es (11 * 11 * 2 bytes) = 242 bytes.

Si se desea iniciar el índice de la variable desde un valor diferente que 0 o 1, se hace una modificación de la línea de código como se observa a continuación:

    Dim MyArray(2 To 10, 2 To 10) As Integer

El arreglo anterior tiene un tamaño fijo de 9 filas y 9 columnas.

Al igual que las variables, si se declara un arreglo sin un tipo de dato específico, el tipo de dato de sus elementos será `Variant`. Cada elemento numérico `Variant` del arreglo usa 16 bytes. Cada elemento de tipo cadena de texto `Variant` usa al menos 22 bytes. Para escribir el código de la manera más compacta posible, se debe especificar un tipo de dato diferente de `Variant` al momento de declarar un arreglo.

El tamaño máximo de un arreglo varía, basado en el sistema operativo y qué tanta memoria hay disponible. Si se usa un arreglo que excede la capacidad de la RAM (Random-Access Memory) el sistema se volverá más lento porque los datos deberán ser leídos desde y escritos en el disco duro.

Cuando se declara un _**arreglo dinámico**_, el tamaño del arreglo puede ser cambiado durante la ejecución del código. Para declarar un arreglo dinámico también se usan las instrucciones `Static`, `Dim`, `Private`, o `Public`, dejando el paréntesis vacío, como se muestra en el siguiente ejemplo.

    Dim MyArray() As Integer

La instrucción `ReDim` se utiliza para especificar o modificar las dimensiones y límites de cada dimensión de un arreglo variable que haya sido declarado formalmente antes. Se puede usar la instrucción `ReDim` para cambiar un arreglo dinámico tantas veces como sea necesario. Sin embargo, cada vez que se hace esto, los valores existentes en el arreglo se perderán. Si se usa la instrucción `ReDim Preserve` para expandir un arreglo, los valores contenidos en el arreglo no se perderán, pero solamente se puede cambiar el tamaño de la última dimensión del arreglo. Para el resto de las dimensiones, se debe especificar los mismos límites existentes.

Si se tiene un arreglo muy grande y ya no se necesitan algunos de sus elementos, `ReDim` puede liberar memoria reduciendo el tamaño del arreglo. De otra parte, si el arreglo necesita más elementos, `ReDim` puede añadirlos.

>**Nota:** La instrucción `ReDim` solo puede ser utilizada a nivel de procedimiento y se puede usar para declarar de forma implícita un arreglo en un procedimiento. Se debe tener cuidado de no escribir mal el nombre del arreglo que se está modificando con la instrucción `ReDim`. Siempre que la instrucción `Option Explicit` está incluida en el módulo, un segundo arreglo será creado.

El siguiente ejemplo muestra la declaración de dos arreglos dinámicos y su redimensionamiento:

```
Dim MyArray1() As Integer, MyArray2() As String
ReDim MyArray1(9, 1 To 10), MyArray2(10)
ReDim Preserve MyArray1(9, 1 To 15)
```

Se puede cambiar el tamaño de varios arreglos en la misma instrucción `ReDim` especificando el nombre y lista de límites (boundlist) para cada uno. Varios arreglos son separados por comas.

En cada entrada en la lista de límites puede especificar el límite inferior y superior de cada dimensión. El límite inferior es siempre 0 (cero). El límite superior es el valor superior posible para este índice para cada dimensión, no la longitud de la dimensión (que es el límite superior más uno). El índice de cada dimensión puede variar desde 0 hasta el valor del límite superior.

>**Nota:** La instrucción `ReDim` no puede cambiar el tipo de dato de un arreglo o sus elementos.
