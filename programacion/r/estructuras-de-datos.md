
# Estructuras de datos

* [Vectores](#vectores)
  * [`c()`](#c)
  * [`scan()`](#scan)
  * [`fix()`](#fix)
  * [`rep()`](#rep)
  * [`seq()`](#seq)
  * [`sapply()`](#sapply)
* [Factores](#factores)
  * [`factor()`](#factor)
  * [`ordered()`](#ordered)
* [Listas](#listas)
* [Matrices](#matrices)
* [Data frames](#data-frames)

## Vectores

Un vector es una lista de datos del mismo tipo, los tipos de dato básicos de `R` son logical, integer, numeric, complex, character y raw.

### `c()`

Para crear un vector se usa la función `c()`, los valores del vector se dan como parámetros de la función separados por una coma. Sobre los vectores se pueden aplicar varias funciones como `length(x)`, `sum(x)`, `mean(x)`, `var(x)`, `cov(x, y)`, `sd(x)`, etc.

También se puede obtener un subvector especificando índices como `x[index]` o condiciones como `x[condition]`.

```r
# ?c -> Combine Values into a Vector or List
> x = c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
> x
 [1] 0 1 2 3 4 5 6 7 8 9
> x[2]
[1] 1
> x[x > 5]
[1]  6  7  8  9
```

### `scan()`

Con la función `scan()` se puede pedir el ingreso de datos desde consola para almacenarlos en un vector, se puede especificar el tipo de dato que se va a ingresar con el parámetro `what`, por defecto `what = double()`, también se puede especificar el separador decimal con el parámetro `dec`, por defecto `dec = "."`.

```r
# ?scan -> Read Data Values
> vowels = scan(what=character())
1: a
2: e
3: i
4: o
5: u
6: 
Read 5 items
> vowels
[1] "a" "e" "i" "o" "u"
```

### `fix()`

Con la función `fix()` se puede modificar los valores de un vector por interfaz gráfica.

```r
# ?fix -> Fix an Object
> fix(x)
```

### `rep()`

La función `rep()` repite un valor o vector *n* veces.

```r
# ?rep -> Replicate Elements of Vectors and Lists
> rep(c(1, 2, 3), 4)
 [1] 1 2 3 1 2 3 1 2 3 1 2 3
```

### `seq()`

La función `seq()` crea una secuencia.

```r
# ?seq -> Sequence Generation
> seq(0, 10)
 [1]  0  1  2  3  4  5  6  7  8  9 10
> seq(0, 10, by=2)
[1]  0  2  4  6  8 10
> seq(0, 10, length.out=5)
[1]  0.0  2.5  5.0  7.5 10.0
> seq(0, by=2, length.out=10)
 [1]  0  2  4  6  8 10 12 14 16 18
```

### `sapply()`

La función `sapply()` permite aplicar una función a cada uno de los valores de un vector.

```r
# ?sapply -> Apply a Function over a List or Vector
> x = seq(0, by=pi/2, length.out=5)
> f = function(x) { sin(x) }
> sapply(x, f)
[1]  0.000000e+00  1.000000e+00  1.224647e-16 -1.000000e+00 -2.449294e-16
```

## Factores

Los factores se usan para describir items que pueden tener un número finito de valores (género, estrato, etc.). Un factor puede ser puramente nominal (`factor()`) o puede tener categorías ordenadas (`ordered()`). Los factores actualmente son implementados usando un arreglo de enteros para especificar los niveles actuales (`levels`) y un segundo arreglo de nombres (`names`) que están mapeados a los enteros.

### `factor()`

La función `factor()` se usa para crear un factor no ordenado a partir de un arreglo, con el parámetro `levels` se puede especificar los niveles del factor, con el parámetro `labels` se asigna el nombre de cada nivel, con el parámetro `exclude` se puede especificar qué valores del arreglo excluir al momento de crear el factor, y con el parámtro `ordered=TRUE` se crea el factor ordenado, igual que si se creara con la función `ordered()`. La función `as.factor()` también crea un factor no ordenado, pero no permite parámetros adicionales al vector `x`.

```r
> x = c("H", "H", "M", "H", "M", "M", "M", "H", "M", "M")
> x.f = factor(x, levels=c("H", "M"), labels=c("Hombre", "Mujer"))
> x.f
 [1] Hombre Hombre Mujer  Hombre Mujer  Mujer  Mujer  Hombre Mujer  Mujer 
Levels: Hombre Mujer
> levels(x.f) = c("Male", "Female")
> x.f
 [1] Male   Male   Female Male   Female Female Female Male   Female Female
Levels: Male Female
```

### `ordered()`

La función `ordered()` se usa para crear un factor ordenado, y recibe los mismos parámetros que `factor()`. La función `as.ordered()` también crea un factor ordenado, pero no recibe parámetros adicionales al vector `x`.

```r
> x = c(2, 3, 2, 3, 3, 5, 4, 5, 4, 3)
> x.f = ordered(x,
+   levels=c(1, 2, 3, 4, 5),
+   labels=c("Deficiente", "Insuficiente", "Aceptable", "Sobresaliente", "Excelente"))
> x.f
 [1] Insuficiente  Aceptable     Insuficiente  Aceptable     Aceptable     Excelente    
 [7] Sobresaliente Excelente     Sobresaliente Aceptable    
Levels: Deficiente < Insuficiente < Aceptable < Sobresaliente < Excelente
```

## Listas
















## Matrices


## Data frames








para aplicar una función específica a todos los valores de un vector se puede usar la función `sapply()`.

```r
sapply(v, function(x) { (x - mean(x))^2 })
```