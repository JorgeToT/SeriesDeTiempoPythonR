library(tseries)
library(forecast)

x <- rnorm(1000)
adf.test(x)


#Temperaturas del castillo
plot(nottem)

#Descomposicion en tendencia, estacional y residual
plot(decompose((nottem)))

#Dickey Fuller
adf.test(nottem) 

#Serie no estacionaria
y<- diffinv(x)
plot(y)
adf.test(y)

#ACF y PACF

acf(nottem, lag.max = 20)
pacf(nottem, lag.max = 20)

acf(x, lag.max = 20)

autoplot(decompose(nottem, type = 'additive'))

plot (stl(nottem, s.window = 'periodic'))

mynottem = decompose(nottem, 'additive')
class(mynottem)

