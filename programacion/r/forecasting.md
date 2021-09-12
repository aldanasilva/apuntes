# R

## Validar fuentes!!!

R HoltWinters Forecast.txt

```
#require(graphics)

(v <- c(374, 277, 397, 370, 339, 236, 391, 376, 259, 279, 352, 332, 454, 339, 473, 433, 403, 315, 445, 428, 313, 326, 423, 388, 495, 390, 551, 513, 460, 377, 509, 469, 379, 370, 489, 464))

(v <- c(38, 24, 28, 166, 166, 153.593, 22, 130, 73.43, 166, 276, 204, 486, 326, 626, 1000, 474, 522, 292, 338, 630, 562, 396, 598, 422, 474, 686, 1214, 542, 770, 494, 724, 552, 740.05, 580, 750, 850, 582, 698.05, 1366))

(v <- c(17717.257, 6713.594, 8885.406, 18740.67, 8816.107, 9010.345, 8264.996, 9188.995, 9152.74, 11568.09, 9162.641, 8198.475, 20675.962, 5801.574, 8862.425, 19407.228, 8799.088, 10297.05, 11030.253, 8732.02, 9740.103, 13487.48, 10692, 10489.65, 18459.75, 7335.35, 11690.15, 18710.725, 8398.026, 11241.682, 11520.522, 10827.739, 12157.48, 11710.424, 10894.55, 13163.465, 19786.902, 8507.024, 12981.82, 19491.348))
plot(v)
(x <- ts(v, start = c(2013, 1), frequency = 12))
(hw <- HoltWinters(x))
plot(fitted(hw))

#library(forecast) #Permite el uso de forecast, accuracy
require(forecast)
(ft <- forecast(hw, 24))
plot(ft)
accuracy(ft)

```


Forecasting with R.txt

```
#x <- c("colorspace", "fracdiff", "ggplot2", "graphics", "lmtext", "magrittr", "nnet", "parallel", "Rcpp", "stats", "timeDate", "tseries", "urca", "zoo")
#for (i in 1:length(x)) {
# library(x[i])
#}

#library(colorspace)
#library(fracdiff)
#library(ggplot2)
#library(graphics)
#library(lmtest)
#library(magrittr)
#library(nnet)
#library(parallel)
#library(Rcpp)
#library(stats)
#library(timeDate)
#library(tseries)
#library(urca)
#library(zoo)

library(forecast)

fit1 <- rwf(EuStockMarkets[1:200,1],h=100)
fit2 <- meanf(EuStockMarkets[1:200,1],h=100)
accuracy(fit1)
accuracy(fit2)
accuracy(fit1,EuStockMarkets[201:300,1])
accuracy(fit2,EuStockMarkets[201:300,1])
plot(fit1)
lines(EuStockMarkets[1:300,1])
```

