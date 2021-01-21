# Funciones de Texto

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


# Ejemplos

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


# Ejercicio práctico



# Ejercicio en VBA






















