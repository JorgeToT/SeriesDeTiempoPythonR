library(tseries)
library(forecast)
library(dygraphs)

df <- read.csv('C:/Users/Jorge/Documents/GitHub/curso-series-temporales/3. Características fundamentales/Python/airline_passengers.csv', header = TRUE)
df.ts <- ts(df$Thousands.of.Passengers, start = c(1949,01), end = c(1960,12), frequency = 12 )
dygraph(df.ts)

frequency(df.ts)

df_decompose <- decompose(x = df.ts, type = 'multiplicative' )

dygraph(df_decompose$trend, ylab = 'Thousand of passengers')

#Veo una tendencia claramente alcista


