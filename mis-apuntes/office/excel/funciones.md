
# Funciones

## Funciones de Texto

| Función (español) | Función (inglés) | Descripción |
| --- | --- | --- |
| `CONCATENAR` | `CONCATENATE` | Concatena varios elementos de texto en uno solo. |
| `UNIRCADENAS` | `TEXTJOIN` | Combina el texto de varios rangos o cadenas e incluye el delimitador que se especifique entre cada valor de texto que se combinará. Si el delimitador es una cadena de texto vacío, esta función concatenará los rangos. |
| `MAYUSC` | `UPPER` | Pone el texto en mayúsculas. |
| `MINUSC` | `LOWER` | Pone el texto en minúsculas. |
| `NOMPROPIO` | `PROPER` | Pone en mayúscula la primera letra de cada palabra de un valor de texto. |
| `DECIMAL` | `FIXED` | Da formato a un número como texto con un número fijo de decimales. |
| `VALOR` | `VALUE` | Convierte un argumento de texto en un número. |
| `VALOR.NUMERO` | `NUMBERVALUE` | Convierte texto a número de manera independiente a la configuración regional. |
| `TEXTO` | `TEXT` | Convierte un valor en texto, con un formato de número específico. |
| `LARGO` | `LEN` | Devuelve el número de caracteres de una cadena de texto. |
| `ENCONTRAR` | `FIND` | Busca un valor de texto dentro de otro (distingue mayúsculas de minúsculas). |
| `HALLAR` | `SEARCH` | Busca un valor de texto dentro de otro (no distingue mayúsculas de minúsculas). |
| `DERECHA` | `RIGHT` | Devuelve los caracteres del lado derecho de un valor de texto. |
| `EXTRAE` | `MID` | Devuelve un número específico de caracteres de una cadena de texto que comienza en la posición que se especifique. |
| `IGUAL` | `EXACT` | Comprueba si dos valores de texto son idénticos (tiene en cuenta mayúsculas y minúsculas). |
| `IZQUIERDA` | `LEFT` | Devuelve los caracteres del lado izquierdo de un valor de texto. |
| `REEMPLAZAR` | `REPLACE` | Reemplaza caracteres de texto. |
| `REPETIR` | `REPT` | Repite el texto un número determinado de veces. |
| `SUSTITUIR` | `SUBSTITUTE` | Sustituye texto nuevo por texto antiguo en una cadena de texto. |
| `T` | `T` | Comprueba si un valor es texto y devuelve texto si lo es o comillas dobles (sin texto) si no lo es. |
| `CARACTER` | `CHAR` | Devuelve el carácter especificado por el número de código. |
| `CODIGO` | `CODE` | Devuelve un código numérico del primer carácter de una cadena de texto. |
| `LIMPIAR` | `CLEAN` | Quita del texto todos los caracteres no imprimibles. |
| `MONEDA` | `DOLLAR` | Convierte un número en texto, con el formato de moneda $ (dólar). |
| `TEXTOBAHT` | `BATHTEXT` | Convierte un número en texto, con el formato de moneda ß (Baht, en texto tailandés). |
| `UNICAR` | `UNICHAR` | Devuelve el carácter Unicode al que hace referencia el valor numérico dado. |
| `UNICODE ` | `UNICODE` | Devuelve el número (punto de código) que corresponde al primer carácter del texto. |

### Ejemplos

| Función | Resultado |
| --- | --- |
| `=CONCATENAR("HO";"LA")` | HOLA |
| `=TEXTJOIN(", ";TRUE;1;2;3;4;5;6;7;8;9;10)` | 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 |
| `=MAYUSC("hola")` | HOLA |
| `=MINUSC("HOLA")` | hola |
| `=NOMPROPIO("HOLA")` | Hola |
| `=DECIMAL(1234567,8901;2;FALSO)` | 1.234.567,89 |
| `=VALOR("1234,56")` | 1234,56 |
| `=VALOR.NUMERO("2.573,23";",";".")` | 2573,23 |
| `=TEXTO(AHORA();"dd-mm-yyyy")` | 21-01-2021 |
| `=LARGO("HOLA")` | 4 |
| `=ENCONTRAR("O";"HOLA";1)` | 2 |
| `=HALLAR("l";"HOLA";1)` | 3 |
| `=DERECHA("HOLA";2)` | LA |
| `=EXTRAE("HOLA";2;2)` | OL |
| `=IGUAL("HOLA";"hola")` | FALSE |
| `=IZQUIERDA("HOLA";2)` | HO |
| `=REEMPLAZAR("HOLA";2;1;"UU")` | HUULA |
| `=REPETIR("HOLA";2)` | HOLAHOLA |
| `=SUSTITUIR("HOLA";"L";"J")` | HOJA |
| `=T("HOLA")` | HOLA |
| `=CARACTER(80)` | P |
| `=CODIGO("P")` | 80 |
| `=LIMPIAR(CARACTER(12))` |  |
| `=MONEDA(1234,5678;2)` | $ 1.234,57 |
| `=TEXTOBAHT(1)` | หนึ่งบาทถ้วน |
| `=UNICAR(256)` | Ā |
| `=UNICODE("HOLA")` | 72 |



### Ejercicio práctico


### Ejercicio en VBA




## Funciones de Fecha

| Función (español) | Función (inglés) | Descripción |
| --- | --- | --- |
| `AHORA` | `NOW` | Devuelve el número de serie correspondiente a la fecha y hora actuales. |
| `AÑO` | `YEAR` | Convierte un número de serie en un valor de año. |
| `DIA` | `DAY` | Convierte un número de serie en un valor de día del mes. |
| `DIA.LAB` | `WORKDAY` | Devuelve el número de serie de la fecha que tiene lugar antes o después de un número determinado de días laborables. |
| `DIA.LAB.INTL` | `WORKDAY.INTL` | Devuelve el número de serie de la fecha anterior o posterior a un número especificado de días laborables usando parámetros para indicar cuáles y cuántos son días de fin de semana. |
| `DIAS ` | `DAYS` | Devuelve la cantidad de días entre dos fechas. |
| `DIAS.LAB` | `NETWORKDAYS` | Devuelve el número de todos los días laborables existentes entre dos fechas. |
| `DIAS.LAB.INTL ` | `NETWORKDAYS.INTL` | Devuelve el número de todos los días laborables existentes entre dos fechas usando parámetros para indicar cuáles y cuántos son días de fin de semana. |
| `DIAS360` | `DAYS360` | Calcula el número de días entre dos fechas a partir de un año de 360 días. |
| `DIASEM` | `WEEKDAY` | Convierte un número de serie en un valor de día de la semana. |
| `FECHA` | `DATE` | Devuelve el número de serie correspondiente a una fecha determinada. |
| `FECHA.MES` | `EDATE` | Devuelve el número de serie de la fecha equivalente al número indicado de meses anteriores o posteriores a la fecha inicial. |
| `FECHANUMERO` | `DATEVALUE` | convierte una fecha almacenada como texto en un número de serie que Excel reconoce como fecha. |
| `FIN.MES` | `EOMONTH` | Devuelve el número de serie correspondiente al último día del mes anterior o posterior a un número de meses especificado. |
| `FRAC.AÑO` | `YEARFRAC` | Devuelve la fracción de año que representa el número total de días existentes entre el valor de fecha_inicial y el de fecha_final. |
| `HORA` | `HOUR` | Convierte un número de serie en un valor de hora. |
| `HORANUMERO` | `TIMEVALUE` | Convierte una hora con formato de texto en un valor de número de serie. |
| `HOY` | `TODAY` | Devuelve el número de serie correspondiente al día actual. |
| `ISO.NUM.DE.SEMANA` | `ISOWEEKNUM` | Devuelve el número de semana ISO del año para una fecha determinada. |
| `MES` | `MONTH` | Convierte un número de serie en un valor de mes. |
| `MINUTO` | `MINUTE` | Convierte un número de serie en un valor de minuto. |
| `NSHORA` | `TIME` | Devuelve el número decimal de una hora determinada. Si el formato de celda era General antes de escribir la función, el resultado tendrá formato de fecha. |
| `NUM.DE.SEMANA` | `WEEKNUM` | Convierte un número de serie en un número que representa el lugar numérico correspondiente a una semana de un año. |
| `SEGUNDO` | `SECOND` | Convierte un número de serie en un valor de segundo. |
| `SIFECHA` | `DATEDIF` | Calcula el número de días, meses o años entre dos fechas. |

### Ejemplos

| Función | Resultado |
| --- | --- |
| `=AHORA()` | 44217,6340665509 |
| `=AÑO(FECHA(2017;10;18))` | 2017 |
| `=DIA(FECHA(2017;10;18))` | 18 |
| `=DIA.LAB(FECHA(2017;10;18);60;FECHA(2017;10;24))` | 43111 |
| `=DIA.LAB.INTL(FECHA(2017;10;18);60;1)` | 43110 |
| `=DIAS(FECHA(2017;11;25);FECHA(2017;10;18))` | 38 |
| `=DIAS.LAB(FECHA(2017;10;18);FECHA(2017;11;25))` | 28 |
| `=DIAS.LAB.INTL(FECHA(2017;10;18);FECHA(2017;11;25);1)` | 28 |
| `=DIAS(FECHA(2018;11;25);FECHA(2017;11;25))` | 365 |
| `=DIASEM(AHORA();2)` | 4 |
| `=FECHA(2017;10;18)` | 43026 |
| `=FECHA.MES(FECHA(2017;10;18);3)` | 43118 |
| `=DATEVALUE("2017-10-18")` | 43026 |
| `=FIN.MES(FECHA(2017;10;18);0)` | 43039 |
| `=FRAC.AÑO(FECHA(2017;10;18);FECHA(2017;10;24);1)` | 0,0164383561643836 |
| `=HORA(AHORA())` | 15 |
| `=HORANUMERO("11:32")` | 0,480555555555556 |
| `=HOY()` | 44217 |
| `=ISO.NUM.DE.SEMANA(AHORA())` | 3 |
| `=MES(FECHA(2017;10;18))` | 10 |
| `=MINUTO(AHORA())` | 13 |
| `=NUM.DE.SEMANA(FECHA(2017;10;18);1)` | 42 |
| `=SEGUNDO(AHORA())` | 3 |




## Bases de Datos

| Función (español) | Función (inglés) | Descripción |
| --- | --- | --- |
| `BDCONTAR` | `DCOUNT` | Counts the cells that contain numbers in a field (column) of records in a list or database that match conditions that you specify.  The field argument is optional. If field is omitted, DCOUNT counts all records in the database that match the criteria. |
| `BDCONTARA` | `DCOUNTA` | Counts the nonblank cells in a field (column) of records in a list or database that match conditions that you specify.  The field argument is optional. If field is omitted, DCOUNTA counts all records in the database that match the criteria. |
| `BDDESVEST` | `DSTDEV` | Estimates the standard deviation of a population based on a sample by using the numbers in a field (column) of records in a list or database that match conditions that you specify. |
| `BDDESVESTP` | `DSTDEVP` | Calculates the standard deviation of a population based on the entire population by using the numbers in a field (column) of records in a list or database that match conditions that you specify. |
| `BDEXTRAER` | `DGET` | Extracts a single value from a column of a list or database that matches conditions that you specify. |
| `BDMAX` | `DMAX` | Returns the largest number in a field (column) of records in a list or database that matches conditions you that specify. |
| `BDMIN` | `DMIN` | Returns the smallest number in a field (column) of records in a list or database that matches conditions that you specify. |
| `BDPRODUCTO` | `DPRODUCT` | Multiplies the values in a field (column) of records in a list or database that match conditions that you specify. |
| `BDPROMEDIO` | `DAVERAGE` | Averages the values in a field (column) of records in a list or database that match conditions you specify. |
| `BDSUMA` | `DSUM` | Adds the numbers in a field (column) of records in a list or database that match conditions that you specify. |
| `BDVAR` | `DVAR` | Estimates the variance of a population based on a sample by using the numbers in a field (column) of records in a list or database that match conditions that you specify. |
| `BDVARP` | `DVARP` | Calculates the variance of a population based on the entire population by using the numbers in a field (column) of records in a list or database that match conditions that you specify. |





## Matemáticas

| Función (español) | Función (inglés) | Descripción |
| --- | --- | --- |
| `REDONDEAR` | `ROUND` | Redondea un número al número de decimales especificado. |
| `REDONDEAR.MAS` | `ROUNDUP` | Redondea un número hacia arriba, en dirección contraria a cero. |
| `REDONDEAR.MENOS` | `ROUNDDOWN` | Redondea un número hacia abajo, hacia cero. |
| `SUMA.CUADRADOS` | `SUMSQ` | Devuelve la suma de los cuadrados de los argumentos. Los argumentos pueden ser números, matrices, nombres o referencias a celdas que contengan números. |
| `SUMAPRODUCTO` | `SUMPRODUCT` | Devuelve la suma de los productos de rangos o matrices correspondientes. |
| `SUMAR.SI` | `SUMIF` | Suma las celdas que cumplen determinado criterio o condición. |
| `SUMAR.SI.CONJUNTO` | `SUMIFS` | Suma las celdas que cumplen un determinado conjunto de condiciones o criterios. |






## Lógica

| Función (español) | Función (inglés) | Descripción |
| --- | --- | --- |
| `O` | `OR` | Comprueba si alguno de los argumentos es VERDADERO, y devuelve VERDADERO (TRUE) o FALSO (FALSE) si todos los argumentos son falsos. |
| `SI` | `IF` | Comprueba si se cumple una condición y devuelve un valor si se evalúa como VERDADERO (TRUE) y otro valor si se evalúa como FALSO (FALSE) |
| `SI.ERROR` | `IFERROR` | Devuelve valor_si_error si la expresión es un error y el valor de la expresión si no lo es. |
| `Y` | `AND` | Comprueba si todos los argumentos son VERDADERO, y devuelve VERDADERO (TRUE) si todos los argumentos son verdaderos. |


## Búsqueda

| Función (español) | Función (inglés) | Descripción |
| --- | --- | --- |
| `BUSCARH` | `HLOOKUP` | Busca en la primera fila de una tabla o matriz de valores y devuelve el valor en la misma columna desde una fila especificada. |
| `BUSCARV` | `VLOOKUP` | Busca un valor en la primera columna de la izquierda de una tabla y luego devuelve un valor en la misma fila desde una columna especificada. De forma predeterminada, la tabla se ordena de forma ascendente. |

## Estadísticas

| Función (español) | Función (inglés) | Descripción |
| --- | --- | --- |
| `CONTAR.SI` | `COUNTIF` | Cuenta las celdas en el rango que coinciden con la condición dada. |
| `CONTAR.SI.CONJUNTO` | `COUNTIFS` | Cuenta el número de celdas que cumplen un determinado conjunto de condiciones o criterios. |



## Sin Clasificar

| Función (español) | Función (inglés) | Descripción |
| --- | --- | --- |
| `ABS` | `ABS` | Devuelve el valor absoluto de un número, es decir, un número sin signo. |
| `ALEATORIO.ENTRE` | `RANDBETWEEN` | Devuelve el número aleatorio entre los números que especifique. |
| `COLUMNA` | `COLUMN` | Devuelve el número de columna de una referencia. |
| `CONTAR` | `COUNT` | Cuenta el número de celdas de un rango que contienen números. |
| `CONTAR.BLANCO` | `COUNTBLANK` | Cuenta el número de celdas en blanco dentro de un rango especificado. |
| `CONTARA` | `COUNTA` | Cuenta el número de celdas no vacías de un rango. |
| `DESVESTPA` | `STDEVPA` | Calcula la desviación estándar de la población total, incluyendo valores lógicos y el texto. FALSO = 0, VERDADERO = 1. |
| `FILA` | `ROW` | Devuelve el número de fila de una referencia. |
| `INDICE` | `INDEX` | Devuelve un valor o referencia de la celda en la intersección de una fila y columna en particular, en un rango especificado. |
| `INDIRECTO` | `INDIRECT` | Devuelve una referencia especificada por un valor de texto. |
| `K.ESIMO.MAYOR` | `LARGE` | Devuelve el valor k-ésimo mayor de un conjunto de datos. |
| `K.ESIMO.MENOR` | `SMALL` | Devuelve el valor k-ésimo menor de un conjunto de datos. |
| `MAX` | `MAX` | Devuelve el valor máximo de una lista de valores. |
| `MIN` | `MIN` | Devuelve el valor mínimo de una lista de valores. |
| `PI` | `PI` | Devuelve el valor Pi, 3,14159265358979, con precisión de 15 dígitos. |
| `PROMEDIO` | `AVERAGE` | Devuelve el promedio (media aritmética) de los argumentos. |
| `RAIZ` | `SQRT` | Devuelve la raíz cuadrada de un número. |
| `SUBTOTALES` | `SUBTOTAL` | Devuelve un subtotal dentro de una lista o una base de datos. |
| `SUMA` | `SUM` | Suma todos los números en un rango de celdas. |
