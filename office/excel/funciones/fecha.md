# Funciones de Fecha

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

# Ejemplos

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

Video en YouTube  
[Funciones de fecha y hora en Excel - Parte 1 - Descripción de las funciones](https://www.youtube.com/watch?v=LoeAwHEcibM)


# Ejercicio práctico

Video en YouTube  
[Funciones de fecha y hora en Excel - Parte 2 - Aplicaciones a casos concretos](https://www.youtube.com/watch?v=ofBWJ4ldAPQ)


# Ejercicio en VBA

Video en YouTube  
[Funciones de fecha y hora en Excel - Parte 3 - Creación de un procedimiento en VBA](https://www.youtube.com/watch?v=EzAXIkLAZxY)





















