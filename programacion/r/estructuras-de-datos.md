
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
  * [`list()`](#list)
* [Matrices](#matrices)
* [Data frames](#data-frames)


## Vectores

Un vector es una lista de datos del mismo tipo, los tipos de dato básicos de `R` son logical, integer, numeric, complex, character y raw.

### `c()`

Para crear un vector se usa la función `c()`, los valores del vector se dan como parámetros de la función separados por una coma. Sobre los vectores se pueden aplicar varias funciones como `length(x)`, `sum(x)`, `mean(x)`, `var(x)`, `cov(x, y)`, `sd(x)`, etc.

También se puede obtener un subvector especificando índices como `x[index]` o condiciones como `x[condition]`.

```r
> #?c -> Combine Values into a Vector or List
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
> #?scan -> Read Data Values
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
> #?fix -> Fix an Object
> fix(x)
```

### `rep()`

La función `rep()` repite un valor o vector *n* veces.

```r
> #?rep -> Replicate Elements of Vectors and Lists
> rep(c(1, 2, 3), 4)
 [1] 1 2 3 1 2 3 1 2 3 1 2 3
```

### `seq()`

La función `seq()` crea una secuencia.

```r
> #?seq -> Sequence Generation
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
> x = seq(0, by=pi/2, length.out=5)
> f = function(x) { sin(x) }
> #?sapply -> Apply a Function over a List or Vector
> sapply(x, f)
[1]  0.000000e+00  1.000000e+00  1.224647e-16 -1.000000e+00 -2.449294e-16
```

### `sort()`

La función `sort()` se usa para ordenar los valores de un vector.

```r
> x = sample(1:10, size=10, replace=TRUE)
> x
 [1]  6  3 10  6 10  4 10  9  1 10
> #?sort -> Sorting or Ordering Vectors
> sort(x)
 [1]  1  3  4  6  6  9 10 10 10 10
> sort(x, decreasing=TRUE)
 [1] 10 10 10 10  9  6  6  4  3  1
```



## Factores

Los factores se usan para describir items que pueden tener un número finito de valores (género, estrato, etc.). Un factor puede ser puramente nominal (`factor()`) o puede tener categorías ordenadas (`ordered()`). Los factores actualmente son implementados usando un arreglo de enteros para especificar los niveles actuales (`levels`) y un segundo arreglo de nombres (`names`) que están mapeados a los enteros.

### `factor()`

La función `factor()` se usa para crear un factor no ordenado a partir de un arreglo, con el parámetro `levels` se puede especificar los niveles del factor, con el parámetro `labels` se asigna el nombre de cada nivel, con el parámetro `exclude` se puede especificar qué valores del arreglo excluir al momento de crear el factor, y con el parámtro `ordered=TRUE` se crea el factor ordenado, igual que si se creara con la función `ordered()`. La función `as.factor()` también crea un factor no ordenado, pero no permite parámetros adicionales al vector `x`.

```r
> x = c("H", "H", "M", "H", "M", "M", "M", "H", "M", "M")
> #?factor -> Factors
> x.f = factor(x, levels=c("H", "M"), labels=c("Hombre", "Mujer"))
> x.f
 [1] Hombre Hombre Mujer  Hombre Mujer  Mujer  Mujer  Hombre Mujer  Mujer 
Levels: Hombre Mujer
> #?levels -> Levels Attributes
> levels(x.f) = c("Male", "Female")
> x.f
 [1] Male   Male   Female Male   Female Female Female Male   Female Female
Levels: Male Female
```

### `ordered()`

La función `ordered()` se usa para crear un factor ordenado, y recibe los mismos parámetros que `factor()`. La función `as.ordered()` también crea un factor ordenado, pero no recibe parámetros adicionales al vector `x`.

```r
> x = c(2, 3, 2, 3, 3, 5, 4, 5, 4, 3)
> #?ordered -> Factors
> x.f = ordered(x,
+   levels=c(1, 2, 3, 4, 5),
+   labels=c("Deficiente", "Insuficiente", "Aceptable", "Sobresaliente", "Excelente"))
> x.f
 [1] Insuficiente  Aceptable     Insuficiente  Aceptable     Aceptable     Excelente    
 [7] Sobresaliente Excelente     Sobresaliente Aceptable    
Levels: Deficiente < Insuficiente < Aceptable < Sobresaliente < Excelente
```


## Listas

Las listas (vectores genéricos) son otro tipo de estructura de datos. Las listas tienen elementos, cada elemento puede contener cualquier tipo de objeto de `R`, los elementos de una lista no tiene que ser del mismo tipo. Los objetos de la lista pueden ser accesados por tres métodos diferentes.

### `list()`

La función `list()` se una para crear una lista, los valores de la lista se dan de la forma `key=value` y se separan por una coma.

```r
> x = c(1, 5, -2, 6, -7, 8, -3, 4, -9, -6)
> #?list -> Lists – Generic and Dotted Pairs
> l = list(
+     nombre = "temperaturas",
+     datos = x,
+     media = mean(x)
+ )
> l$sumas = cumsum(x)
> l
$nombre
[1] "temperaturas"

$datos
 [1]  1  5 -2  6 -7  8 -3  4 -9 -6

$media
[1] -0.3

$sumas
 [1]  1  6  4 10  3 11  8 12  3 -3

> # The [[ form allows select only a single element using integer or character indices
> l[[3]] # l[["media"]]
[1] -0.3
> # whereas [ allows indexing by vectors and returns a list of the selected elements
> l[3] # l["media"] # l[c("media", "sumas")] # l[c(3, 4)]
$media
[1] -0.3

> # The form using $ applies to recursive objects such as lists and pairlists. It allows only a literal character string or a symbol as the index. That is, the index is not computable: for cases where you need to evaluate an expression to find the index, use x[[expr]]. Applying $ to a non-recursive object is an error.
> l$nombre
[1] "temperaturas"
> #?str -> Compactly Display the Structure of an Arbitrary R Object
> str(l)
List of 4
 $ nombre: chr "temperaturas"
 $ datos : num [1:10] 1 5 -2 6 -7 8 -3 4 -9 -6
 $ media : num -0.3
 $ sumas : num [1:10] 1 6 4 10 3 11 8 12 3 -3
> #?names -> The Names of an Object
> names(l)
[1] "nombre" "datos"  "media"  "sumas" 
```


## Matrices

```r
> #?matrix ->
> M = matrix(1:9, nrow=3)
> M
     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9
> M = matrix(1:9, ncol=3, byrow=TRUE)
> M
     [,1] [,2] [,3]
[1,]    1    2    3
[2,]    4    5    6
[3,]    7    8    9
> # ?rbind
> M = rbind(M, c(10, 11, 12), c(13, 14, 15))
> M
     [,1] [,2] [,3]
[1,]    1    2    3
[2,]    4    5    6
[3,]    7    8    9
[4,]   10   11   12
[5,]   13   14   15
> #?cbind
> M = cbind(M, c(16, 17, 18, 19, 20), c(21, 22, 23, 24, 25))
> M
     [,1] [,2] [,3] [,4] [,5]
[1,]    1    2    3   16   21
[2,]    4    5    6   17   22
[3,]    7    8    9   18   23
[4,]   10   11   12   19   24
[5,]   13   14   15   20   25
> #?diag
> diag(c(1, 2, 3, 4, 5))
     [,1] [,2] [,3] [,4] [,5]
[1,]    1    0    0    0    0
[2,]    0    2    0    0    0
[3,]    0    0    3    0    0
[4,]    0    0    0    4    0
[5,]    0    0    0    0    5
> diag(1, nrow=4)
     [,1] [,2] [,3] [,4]
[1,]    1    0    0    0
[2,]    0    1    0    0
[3,]    0    0    1    0
[4,]    0    0    0    1
> M[4, 5]
[1] 24
> M[2, ]
[1]  2  5  8 17 22
> M[, 2]
[1]  4  5  6 11 14
> M[c(2, 4), c(3, 5)]
     [,1] [,2]
[1,]    8   22
[2,]   12   24
> diag(M)
[1]  1  5  9 19 25
> nrow(M)
[1] 5
> ncol(M)
[1] 5
> dim(M)
[1] 5 5
> diag(M)
[1]  1  5  9 19 25
> nrow(M)
[1] 5
> ncol(M)
[1] 5
> dim(M)
[1] 5 5
> sum(M)
[1] 325
> prod(M)
[1] 1.551121e+25
> mean(M)
[1] 13
> colSums(M)
[1]  29  40  51  90 115
> rowSums(M)
[1] 49 54 59 76 87
> colMeans(M)
[1]  5.8  8.0 10.2 18.0 23.0
> rowMeans(M)
[1]  9.8 10.8 11.8 15.2 17.4
> colMeans(M)
[1]  5.8  8.0 10.2 18.0 23.0
> apply(M, MARGIN=1, FUN=function(x) {sqrt(sum(x^2))})
[1] 27.62245 29.42788 31.28898 36.08324 40.18706
> apply(M, MARGIN=2, FUN=function(x) {sqrt(sum(x^2))})
[1] 16.82260 19.84943 23.72762 40.37326 51.52669
# MARGIN = 1 is by row, = 2 is by column, and = c(1, 2) is by row and column
> t(M)
     [,1] [,2] [,3] [,4] [,5]
[1,]    1    2    3   10   13
[2,]    4    5    6   11   14
[3,]    7    8    9   12   15
[4,]   16   17   18   19   20
[5,]   21   22   23   24   25
> M%*%t(M)
     [,1] [,2] [,3] [,4] [,5]
[1,]  763  812  861  946 1019
[2,]  812  866  920 1022 1106
[3,]  861  920  979 1098 1193
[4,]  946 1022 1098 1302 1444
[5,] 1019 1106 1193 1444 1615
> # Valores propios de la matriz
> # eigen(M)$values
> # Vectores propios de la matriz M
> # eigen(M)$vectors
> # Rango de la matriz M
> # qr(M)$rank
```










## Data frames








### `which()`

```r
> x = sample(1:10, size=20, replace=TRUE)
> x
 [1]  5  1  5  9  6  1  3  7  5  7  2  4  2  9  8  5 10  7  6  2
> which(x==min(x))
[1] 2 6
> which(x==max(x))
[1] 17
```

### `ls()` y `rm()`
```r
> x = 4
> y = 7
> z = 10
> #?ls -> List Objects
> ls()
[1] "x" "y" "z"
> #?rm -> Remove Objects from a Specified Environment
> rm(y)
> ls()
[1] "x" "z"
> rm(list=ls())
> ls()
character(0)
```

```r
> M = matrix(sample(1:10, size=9, replace=TRUE), ncol=3, byrow=TRUE)
> M
     [,1] [,2] [,3]
[1,]    3    8    7
[2,]    6    6    6
[3,]    7    8    9
> # Inversa de la matriz M
> solve(M)
           [,1]       [,2]       [,3]
[1,] -0.1666667  0.4444444 -0.1666667
[2,]  0.3333333  0.6111111 -0.6666667
[3,] -0.1666667 -0.8888889  0.8333333
> round(M%*%solve(M), 10)
     [,1] [,2] [,3]
[1,]    1    0    0
[2,]    0    1    0
[3,]    0    0    1
```





* https://cran.r-project.org/doc/manuals/r-release/R-lang.html