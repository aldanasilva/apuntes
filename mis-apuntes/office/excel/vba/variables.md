# Variables en VBA

## Tipos de variables

La siguiente tabla muestra los tipos de variables de VBA de Excel, los valores admitidos por cada una, el valor por defecto de la variable, el prefijo estándar para identificar el tipo de variable por su nombre y el espacio de almacenamiento requerido.

| Tipo de variable | Valores admitidos | Valor por defecto | Prefijo | Espacio usado |
| --- | --- | --- | --- | --- |
| `Boolean` | `True` o `False` | `False` | `bln` | 2 bytes (revisar) |
| `Byte` | Número entero<br>≥ 0<br>≤ 255 | `0` | `byt` | 1 byte |
| `Integer` | Número entero<br>≥ –32.768<br>≤ 32.767 | `0` | `int` | 2 bytes |
| `Long` | Número entero<br>≥ –2.147.483.648<br>≤ 2.147.483.647 | `0` | `lng` | 4 bytes |
| `Single` | Número decimal (punto flotante)<br>≥ –3,4028235E+38<br>≤ 3,4028235E+38 | `0` | `sng` | 4 bytes |
| `Double` | Número decimal (punto flotante)<br>> –1,79769313486232E+308<br>< 1,79769313486232E+308 | `0` | `dbl` | 8 bytes |
| `Currency` | Moneda<br>≥ –922.337.203.685.477,5808<br>≤ 922.337.203.685.477,5807 | `0` | `cur` | 8 bytes |
| `Date` | Fecha y hora<br>≥ 01/01/100<br>≤ 31/12/9999 | `0` | `dtm` | 8 bytes |
| `String` | Cadena de texto<br>Desde 0 hasta aproximadamente 2 billones de caracteres Unicode | `""` | `str` | 10 bytes + 1 byte por carácter |
| `Variant` | `Boolean`, `Double`, `Date` y `String`. | `Empty` | `vnt` | Al menos 16 bytes |

###### Referencias:
* https://docs.microsoft.com/en-us/dotnet/visual-basic/language-reference/data-types/
* https://docs.microsoft.com/en-us/previous-versions/visualstudio/visual-basic-6/aa240858(v=vs.60)?redirectedfrom=MSDN
* https://docs.microsoft.com/en-us/dotnet/visual-basic/programming-guide/language-features/declared-elements/declared-element-names

## Declaración

Las variables deben se declaran con la palabra clave `Dim` cuando son declaradas dentro de un método (`Sub` o `Function`), de lo contrario son declaradas con las palabras clave `Public` o `Private`.

Cuando se declarar más de una variable con la instrucción `Dim`, se debe especificar el tipo de dato para cada variable, si no se especifica el tipo de dato, o no se declara la variable, automáticamente VBA especifica el tipo de datos de la variable como `Variant`.

    Dim x, y As Integer

En la línea anterior, la variable `x` fue declarada como `Variant`, y la variable `y` como `Integer`. Si se desea que ambas variables sean de tipo `Integer`, deben declararse de la siguiente manera:

    Dim x As Integer, y As Integer

###### Referencias:
* https://docs.microsoft.com/en-us/office/vba/Language/Concepts/Getting-Started/declaring-variables

## Ámbito

* `Dim` - Acceso a nivel de método
* `Private` - Acceso a nivel de módulo
* `Public` - Acceso a cualquier nivel

## Option Explicit

Esta opción se utiliza para forzar la declaración de una variable antes de utilizarla, para esto se debe escribir `Option Explicit` en el comienzo del módulo.


