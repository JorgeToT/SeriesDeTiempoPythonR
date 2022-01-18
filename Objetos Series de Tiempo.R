#Fechas y tiempos
{
#Librerias 
library(lubridate)
library(tseries)
library(forecast)

#Opciones estándar en R base POSIXT (Portable Operating System Interface for Time)

x = as.POSIXct('2019-12-25 11:45:34') #Segundos desde 01-01-1970 00:00:00

y = as.POSIXlt('2019-12-25 11:45:34')

x; y

unclass(x) #Se obtiene lo mismo

unclass(y)

#Time Zone
y$zone

x$zone

#Otra forma as.Date

x=as.Date('2019-12-25')

x; class(x)

unclass(x)

50*365-5 #Número de dias desde 01-01-1970

library(chron)

x=chron('12/25/2019', '23:34:09')

x

class(x)

unclass(x)

# scriptime convierte desde caracteres 

a = as.character(c('1993-12-30 23:45',
                   '1994-11-05 11:43',
                   '1992-03-09 21:54'))

class(a)

b = strptime(a, format = '%Y-%m-%d %H:%M')

b; class(b)

#Lubridate
#Formas distintas de agregar fechas
ymd(19931123)
dmy(23111993)
mdy(11231993)

#Vamos a usar tiempos y fechas

mytimepoint <- ymd_hm('1993-11-23 11:23', tz = 'Mexico/General')

OlsonNames()

mytimepoint; class(mytimepoint)

#Extrayebdo los componentes

minute(mytimepoint)

day(mytimepoint)

#Cambiar un solo valor

hour(mytimepoint)<-14

mytimepoint

#Dia de la semana

wday(mytimepoint)

wday(mytimepoint, label = T, abbr = F)

#Podemos ver en otra zona a que fecha y hora corresponde

with_tz(mytimepoint, tz = 'Europe/London')

mytimepoint

#Calculando el intervalo entre 2 zonas horarias

time1 = ymd_hm(199309231523, tz = 'Europe/Prague')
time2 = ymd_hm(199511021523, tz = 'Europe/Prague')

myinterval = interval(time1,time2); myinterval

class(myinterval)
}

#Objetos de series de tiempos en R
{
#Creamos unos datos
mydata = runif(n=50, min=10, max=45)

#ts es la clase 'time series'
#Vamos a poner que empieza en 1956 - y con una frecuencia de 4 observaciones por año
mytimeseries = ts(data=mydata, start = 1956, frequency = 4)

#Veamos el grafico de la serie
plot(mytimeseries)

#Clase
class(mytimeseries)

#Tiempos
time(mytimeseries)

#Redefiniendo el inicio 'start'
mytimeseries = ts(data = mydata, start = c(1956,3), frequency = 4)
}

#Plots
{
#Nottem dataset
#Series de tiempo que contiene el promedio de temperaturas de Nottingham en grados F durante 20 años

plot(nottem)

library(forecats)
library(ggplot2)

autoplot(nottem)

autoplot(nottem) + ggtitle('Autoplot of Nottinghan temperature data')
}

#Datos faltantes u outliers
{
#Importando datos
mydata=read.csv('C:/Users/Jorge/Desktop/Progra/Curso series de tiempo/Rmissing.csv')

#Convertir la segunda columna en una serie de tiempo sin especificar frecuencia
myts = ts(mydata$mydata)
myts

#Comprobar si hay NAs y outliers
summary(myts)
plot(myts)

#Usando zoo para localizar y rellenar datos faltantes
library(zoo)
myts.NAlocf = na.locf(myts) #LOCF Last Observation Carried Forward
myts.NAfill = na.fill(myts, 33)

#Detección automatica de outliers
library(forecast)
myts1 = tsoutliers(myts)
myts1
plot(myts)

#Tambien hay un metodo para NA en forecast
myts.NAinterp = na.interp(myts) #Rellena con interpolación

#Limpiando NAs y outliers con tsclean de forecast
mytsclean = tsclean(myts)
plot(mytsclean)
summary(mytsclean)
}

