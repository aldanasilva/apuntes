# Bucles en VBA

## Bucle For

Repite un grupo de instrucciones una cantidad específica de veces.

Sintaxis

```
For Contador = Inicio To Fin [Step Paso]
    [Instrucciones]
    [Exit For[
    [Instrucciones]
Next [Contador]

Parte           Descripción
Contador        Requerido. Variable numérica usado como un
                contador bucle. La variable no puede ser un
                elemento booleano o arreglo.
Inicio          Requerido. Valor inicial de Contador.
Fin             Requerido. Valor final de Contador.
Paso            Opcional. cantidad Contador es cambiado
                cada vez en el bucle. Si no se especifica,
                el valor Paso es, por defecto, uno.
Instrucciones   Opcional. una o más instrucciones entre
                For y Next que es ejecutado un número
                de veces.
```

El argumento `Paso` puede ser positivo o negativo, el valor del argumento determina el procesamiento como sigue:

```
Valor   El bucle se ejecuta si
>= 0    Contador <= Fin
 < 0    Contador >= Fin
```

Después de que todas las instrucciones en el bucle hayan sido ejecutadas, `Paso` es sumado a `Contador`. En este punto, las instrucciones en el bucle se ejecutan de nuevo (basado en la misma prueba hecha en el bucle para ejecutarlo inicialmente), o el bucle es terminado y la ejecución continúa, con la ejecución de las instrucciones después de la instrucción `Next`.

>**Tip:** Cambiando el valor de `Contador` mientras está dentro del bucle puede hacer más difícil leer y depurar el código.

La instrucción `Exit For` puede ser colocada cualquier cantidad de veces en cualquier parte dentro del bucle como una forma de salir. `Exit For` con frecuencia es usado después de evaluar alguna condición, por ejemplo `If...Then`, y transfiere el control a la instrucción siguiente a `Next`. Se puede anidar bucles `For...Next` colocando un bucle `For...Next` dentro de otro. Cada bucle debe tener un nombre único de variable como `Contador`.

## Ejemplo

```
Option Explicit

Sub ForLoop()
    
    Dim Contador1 As Long, Contador2 As Long
    
    Dim Inicio1 As Long, Fin1 As Long, Paso1 As Long
    Inicio1 = 1
    Fin1 = 10
    Paso1 = 1
    
    Dim Inicio2 As Long, Fin2 As Long, Paso2 As Long
    Inicio2 = 1
    Fin2 = 10
    Paso2 = 1
    
    Dim Cadena As String
    
    For Contador1 = Inicio1 To Fin1 Step Paso1
        For Contador2 = Inicio2 To Fin2 Step Paso2
            If Contador1 = Inicio1 Then
                If Contador2 = Inicio2 Then
                    Cadena = Contador1 & ": " & Contador2
                ElseIf Contador2 = Fin2 Then
                    Cadena = Cadena & ", " & Contador2 & _
                        "." & vbNewLine
                Else
                    Cadena = Cadena & ", " & Contador2
                End If
            ElseIf Contador1 = Fin1 Then
                If Contador2 = Inicio2 Then
                    Cadena = Cadena & Contador1 & _
                        ": " & Contador2
                ElseIf Contador2 = Fin2 Then
                    Cadena = Cadena & ", " & Contador2 & "."
                Else
                    Cadena = Cadena & ", " & Contador2
                End If
            Else
                If Contador2 = Inicio2 Then
                    Cadena = Cadena & Contador1 & _
                        ": " & Contador2
                ElseIf Contador2 = Fin2 Then
                    Cadena = Cadena & ", " & Contador2 & _
                        "." & vbNewLine
                Else
                    Cadena = Cadena & ", " & Contador2
                End If
            End If
        Next Contador2
    Next Contador1
    
    MsgBox Cadena, vbOKOnly, "For...Next Statement"
    
End Sub
```

###### Referencias:
* https://docs.microsoft.com/en-us/office/vba/Language/Reference/User-Interface-Help/fornext-statement
* https://docs.microsoft.com/en-us/office/vba/Language/Reference/User-Interface-Help/for-eachnext-statement
* https://docs.microsoft.com/en-us/dotnet/visual-basic/language-reference/statements/for-each-next-statement
