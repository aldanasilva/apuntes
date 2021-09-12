# DOS

## Autorun

```
[autorun]
label = Autorun
icon = Autorun.bat
```

## Hacer visible un archivo o carpeta

    attrib -h -r -s *.* /s /d

## Copiar un archivo de red a escritorio

```
IF EXIST \\aldanasilva\dba_system (
   COPY "\\aldanasilva\dba_system\DB Poli v2016.11.12.5.accdb" "%userprofile%\Desktop\DB Poli.accdb"
  ) ELSE (
   ECHO No se puede establecer conexión con \\aldanasilva\dba_system
  )
PAUSE
```

## Crear acceso directo en escritorio

1. 
```
SET ruta=%userprofile%\Desktop\
nircmd.exe shortcut "%ruta%ventas.accdb" "%ruta%hola"
PAUSE
```

2. 
```
SET ruta=%userprofile%\Desktop\
MKLINK /d "%ruta%hola" "%ruta%ventas.accdb"
```

## Crear carpeta en escritorio

```
SET ruta=%userprofile%\Desktop
MD "%ruta%\Hola"
```

## Desinfectar USB

```
open=c:\windows\system32\cmd.exe
del "cwtslatwbl..vbs"
del *.lnk
Attrib -h -r -s *.* /s /d

By Andrés Aldana
```

## Borrar un archivo

    DEL "C:\Users\Andrés Aldana\Desktop\DOS\borrar.txt"





















