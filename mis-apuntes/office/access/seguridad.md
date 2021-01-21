# Seguridad de la aplicación

## Tecla Shift

```
Option Compare Database
Option Explicit

If DLookup("cinta_opciones", "md_app", "id = 'me'") = -1 Then
        DoCmd.ShowToolbar "Ribbon", acToolbarYes
    Else
        DoCmd.ShowToolbar "Ribbon", acToolbarNo
    End If
    
    If DLookup("tecla_shift", "md_app", "id = 'me'") = -1 Then
        TeclaShift "AllowBypassKey", dbBoolean, True
    Else
        TeclaShift "AllowBypassKey", dbBoolean, False
    End If

Public Function TeclaShift(strPropName As String, varPropType As Variant, varPropValue As Variant) As Integer
    Dim dbs As Database, prp As Property
    Const conPropNotFoundError = 3270
    Set dbs = CurrentDb
    On Error GoTo Change_Err
    dbs.Properties(strPropName) = varPropValue
    TeclaShift = True
Change_Bye:
    Exit Function
Change_Err:
    If Err = conPropNotFoundError Then
        Set prp = dbs.CreateProperty(strPropName, varPropType, varPropValue)
        dbs.Properties.Append prp
        Resume Next
    Else
        TeclaShift = False
        Resume Change_Bye
    End If
End Function
```

###### Referencias:
* Revisar fuente







