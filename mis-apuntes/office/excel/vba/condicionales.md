# Condicionales en VBA

Una instrucción condicional aquella que ejecuta un grupo de instrucciones, dependiendo del valor de una expresión.

En VBA de Excel, hay dos instrucciones que se pueden usar para realizar una comprobación condicional: la instrucción `If...Then...Else` o la instrucción `Select Case`. La instrucción `If...Then...Else` ejecuta un grupo de instrucciones en función del valor de una expresión, y la instrucción `Select Case` ejecuta una de varias instrucciones según el valor de una expresión.

## Instrucción If...Then...Else

La instrucción `If` se utiliza para ejecutar un grupo de instrucciones, dependiendo del valor de una expresión.

La sintaxis de la instrucción es la siguiente:

En múltiples líneas

```
If Condición Then
    Instrucciones
ElseIf otraCondición Then
    otrasInstrucciones
Else
    elseInstrucciones
End if
```

En una sola línea

    If Condición Then Instrucciones

ó

    If Condición Then Instrucciones Else elseInstrucciones

La `Condición` al momento de ser evaluada debe retornar `True` o `False`, o un tipo de dato que sea implícitamente convertible a `Boolean`.

Cuando una instrucción `If` es encontrada en momento de ejecución, la condición es evaluada. Si la condición es verdadera (`True`), las instrucciones que estén después de `Then` serán ejecutadas. Si la condición es falsa (`False`), cada instrucción `ElseIf` (si hay alguna) es evaluada en orden. Cuando la condición de un `ElseIf` es evaluada como verdadera, las instrucciones seguidas al `Then` del correspondiente `ElseIf` son ejecutadas. Si ninguna instrucción `ElseIf` es evaluada como verdadero, o no hay instrucciones `ElseIf`, las instrucciones seguidas de `Else` son ejecutadas. Después de ejecutar las instrucciones seguidas de `Then`, `ElseIf` o Else, la ejecución continúa con la instrucción que esté después de `End If`.

Las instrucciones `ElseIf` y `Else` son opcionales. Se puede tener tantos `ElseIf` como se necesite, pero ningún `ElseIf` puede aparecer después de un `Else`. Las instrucciones `If...Then...Else` pueden ser anidadas dentro de otras.

En sintaxis de múltiples líneas, la instrucción `If` debe estar solo en la primera línea. Las instrucciones `ElseIf`, `Else`, y `End If` pueden estar precedidas por una sola línea de etiqueta (`GoTo`). El bloque `If...Then...Else` debe terminar con la instrucción `End If`.

La instrucción `If...Then...Else` también puede ser usada en una sola línea. Como sea, la sintaxis de múltiples líneas permite estructurar y flexibilidad y es usualmente más fácil de leer, mantener y debuggear.

Lo que siga la plabra clave `Then` es examinado para determinar cuando una instrucción es escrita con sintaxis `If` de una sola línea. Si algo diferente a un comentaro es escrito después de `Then` en la misma línea, la instrucción es tratada como `If` de una sola línea. 

###### Referencias:
* https://docs.microsoft.com/en-us/office/vba/language/concepts/getting-started/using-ifthenelse-statements
* https://docs.microsoft.com/en-us/dotnet/visual-basic/language-reference/statements/if-then-else-statement
* https://docs.microsoft.com/en-us/dotnet/visual-basic/language-reference/statements/select-case-statement
