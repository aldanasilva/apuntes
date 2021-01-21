# Variables en VBA

Una característica de los lenguajes de programación es la capacidad para almacenar algo en una **variable**, haciendo que el contenido de la variable pueda ser usado o cambiado más adelante en el procedimiento.

La manera más sencilla para **declarar una variable** en un procedimiento es utilizar la instrucción `Dim`. La siguiente línea muestra la declaración de dos variables `x` y `y` como enteros:

    Dim x As Integer, y As Integer

Con `x` y `y` declaradas como enteros, se está reservando en VBA el espacio necesario para almacenar dos variables de tipo entero.

Cuando se declara más de una variable con la instrucción `Dim`, se debe especificar el tipo de dato para cada variable, si no se especifica el tipo de dato, o no se declara la variable, automáticamente VBA especifica el tipo de datos de la variable como `Variant`.

    Dim x, y As Integer

En la línea anterior, la variable x fue declarada como Variant, y la variable y como Integer.

## Tipos de Variables

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

>**Nota:** En notación científica, “E” se refiere a potencias de 10. Así que 3,56E+2 significa 3,56×10^2=356, y 3,56E–2 significa 3,56×10^(-2)=3,56⁄10^2 =0,0356.

Cuando se hace uso de una variable sin declararla, VBA automáticamente especifica la variable como tipo `Variant`.

El siguiente ejemplo muestra cómo las variables tipo `Variant` admiten los valores mencionados en la tabla 1.

```
Dim x, y, z
x = True
y = 1.79769313486232E+308
z = “01/01/2000”
```

## Ámbito

Cuando se declara una variable, ésta puede ser vista o no por otros módulos u otros proyectos. Esta disponibilidad de la variable en los módulos se llama **ámbito** (scope).

Hay tres tipos de ámbitos para las variables:

1. Variable a nivel de procedimiento (`Dim`)
2. Variable privada a nivel de módulo (`Private`)
3. Variable pública a nivel de módulo (`Public`)

El ámbito depende de cómo y dónde se declara la variable.

La **variable con ámbito a nivel de procedimiento** no puede ser vista afuera del procedimiento en donde es declarada. Si se le da un valor a una variable de ámbito a nivel de procedimiento, éste valor no podrá ser visto por otros procedimientos `Sub`.

La **variable con ámbito privado a nivel de módulo**, solo puede ser vista en un módulo y ser usada por todos los procedimientos de dicho módulo, ésta variable se declara en el comienzo del módulo, antes de iniciar cualquier procedimiento, y se declara con la instrucción `Dim` o la instrucción `Private`.

La **variable con ámbito público a nivel de módulo**, puede ser vista en todos los módulos y procedimientos, ésta variable se declara en el comienzo del módulo, antes de iniciar cualquier procedimiento, y se declara con la instrucción `Public`.

>**Nota:** Si se desea que la variable declarada sea de ámbito privado a nivel de módulo, se usa la instrucción `Private` en vez de la instrucción `Dim`. Ambas formas de declarar la variable tienen el mismo efecto, pero el ámbito es más claro al momento de leer el código si se utiliza la instrucción `Private`. También se utiliza un prefijo en el nombre de las variables según su ámbito para reconocerlas fácilmente (g en caso de variable pública a nivel de módulo, y m en caso de variable privada a nivel de módulo).

El tiempo durante el cual una variable retiene su valor se conoce como su **duración** (lifetime). El valor de la variable puede cambiar durante su duración pero retendrá un valor. Además, cuando la variable pierda su ámbito, no tendrá más un valor.

Cuando se ejecuta un procedimiento, todas las variables son inicializadas con un valor. Una variable numérica (`Byte`, `Integer`, `Long`, `Single`, `Double`, `Currency` y `Date`) es inicializada con cero, una variable de cadena de texto (`String`) es inicializada con una cadena de texto de longitud cero (`""`). Las variables de tipo `Variant` son inicializadas como vacías (`Empty`). Una variable vacía es representada por un cero en un contexto numérico y una cadena de texto de longitud cero (`""`) en un contexto de cadena de texto.

Si se tiene una variable que es declarada en un procedimiento utilizando la instrucción `Dim`, la variable retiene su valor durante el tiempo que el procedimiento se esté ejecutando. Si el procedimiento hace un llamado a otro procedimiento, el valor de la variable es retenido, pero no será visible desde los otros procedimientos.

Si una variable es declarada a nivel de procedimiento utilizando la palabra clave `Static`, la variable conservará su valor hasta que su proyecto sea reiniciado. Entonces, si se tiene una variable estática, la siguiente vez que el procedimiento sea llamado, la variable `Static` es inicializada con su último valor.

>**Nota:** Si se tiene una variable a nivel de módulo, su duración es la misma que si fuera una variable estática a nivel de procedimiento.

Si se desea reiniciar el valor de una variable estática o de una variable a nivel de módulo, se debe hacer clic en el botón **Restablecer** de la barra de herramientas estándar  , o hacer clic en el botón **Restablecer** del menú **Ejecutar**.

Cada variable declarada tiene un nombre, también llamado identificador, que es lo que el código utiliza para referirse a ella.

El nombre de una variable debe seguir las siguientes reglas:

* Debe comenzar con un carácter alfabético.
* Solo debe contener caracteres alfabéticos, números, y guiones bajos.
* No debe tener más de 1023 caracteres de largo.

El límite de 1023 caracteres de largo también aplica para la cadena de texto entera de un nombre completo calificado, como:
`outerNamespace.middleNamespace.innerNamespace.thisClass.thisElement`.

Para ser práctico, el nombre de la variable debe ser tan corto como sea posible mientras identifique de forma clara la naturaleza de la variable. Esto mejora el entendimiento del código al momento de leerlo y reduce la longitud de las líneas de código y el tamaño del archivo.

De otra parte, el nombre de la variable tampoco debe ser tan corto que no describa adecuadamente lo que la variable representa y cómo el código la utiliza. Esto es importante para entender el código. Si alguien más intenta entenderlo, o quien lo escribió lo lee después de mucho tiempo, los nombres claros de las variables le ahorrarán mucho tiempo.

Los nombres de las variables en VBA no son sensibles a las mayúsculas. Esto significa que cuando el compilador compare dos nombres que difieren en mayúsculas solamente, las interpreta como la misma. Por ejemplo, considera que `ABC` y `abc` se refieren a la misma variable.

Una variable puede ser declarada implícitamente usándola en una instrucción de asignación.

Todas las variables que son declaradas de forma implícita son de tipo `Variant`. Las variables de tipo `Variant` necesitan más recursos de memoria que muchas otras variables. El código será más eficiente si se declaran las variables de forma explícita y con un tipo de dato específico. La declaración explícita de todas las variables reduce la incidencia de errores de conflictos de nombramiento y errores ortográficos.

## Option Explicit

Si se desea que VBA no haga declaraciones implícitas, se debe colocar la instrucción `Option Explicit` en el módulo antes de todos los procedimientos. Esta instrucción requiere que se declaren explícitamente todas las variables dentro del módulo. Si el módulo tiene la instrucción `Option Explicit`, ocurrirá un error en tiempo de compilación cuando VBA encuentre una variable que no haya sido declarada previamente, o que haya sido escrita de forma incorrecta.


###### Referencias:
* https://docs.microsoft.com/en-us/dotnet/visual-basic/language-reference/data-types/
* https://docs.microsoft.com/en-us/previous-versions/visualstudio/visual-basic-6/aa240858(v=vs.60)?redirectedfrom=MSDN
* https://docs.microsoft.com/en-us/dotnet/visual-basic/programming-guide/language-features/declared-elements/declared-element-names
* https://docs.microsoft.com/en-us/office/vba/Language/Concepts/Getting-Started/declaring-variables


