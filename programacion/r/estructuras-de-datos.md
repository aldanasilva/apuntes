
# Estructuras de datos

1. [Vectores](#vectores)
  1.1. [`c()`](#c)
2. [Factores](#factores)
3. [Listas](#listas)
4. [Matrices](#matrices)


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


## Listas


## Matrices











para aplicar una función específica a todos los valores de un vector se puede usar la función `sapply()`.

```r
sapply(v, function(x) { (x - mean(x))^2 })
```