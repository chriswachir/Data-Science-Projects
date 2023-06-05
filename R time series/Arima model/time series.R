### Reading Data 
TSData <- read.csv(file.choose(), header = T)
View(TSData)
summary(TSData)
sum(is.na(TSData))
std_deviation <-sqrt(var(TSData))
std_deviation
boxplot(TSData, main="Boxplot of Adjusted Clossing Prices")
TSData <- ts(TSData)
TSData
plot.ts(TSData, main=" Daily Adj Close")

library(TTR)
TSDataSMA3 <- SMA(TSData, n = 3)
plot.ts(TSDataSMA3)

TSDataSMA6 <- SMA(TSData, n = 6)
plot.ts(TSDataSMA6)

TSDataSMA10 <- SMA(TSData, n = 10)
plot.ts(TSDataSMA10)

###exponential smoothing 
TSData_forecast <- HoltWinters(TSData, beta = F, gamma = F)
TSData_forecast
summary(TSData_forecast)
plot(TSData_forecast)
library(forecast)
TSData_forecast1 <- forecast(TSData_forecast, h=300)
TSData_forecast1
summary(TSData_forecast1)
plot(TSData_forecast1)
acf(TSData_forecast1$residuals, lag.max = 50, na.action = na.pass)
###  Ljung Box test
Box.test(TSData_forecast1$residuals, lag=20, type = 'Ljung-Box')
accuracy(TSData_forecast1)


library(tseries)
acf(TSData)
pacf(TSData)
adf.test(TSData, alternative = "stationary")

series1 <- diff(TSData, differences = 1)
plot.ts(series1)
acf(series1)
pacf(series1)

my_arima <- auto.arima(TSData)
summary(my_arima)
my_arima_forecast <- forecast(my_arima, h = 365)
plot(my_arima_forecast)
acf(my_arima_forecast$residuals, lag.max = 50, na.action = na.pass)
Box.test(my_arima_forecast$residuals, lag=20, type = 'Ljung-Box')
accuracy(my_arima_forecast)
checkresiduals(my_arima)

record_AIC = matrix(0,7,7)
rownames(record_AIC) = c('p=0', 'p=1', 'p=2', 'p=3', 'p=4','p=5', 'p=6')
colnames(record_AIC) = c('q=0', 'q=1', 'q=2', 'q=3', 'q=4','q=5', 'q=6')
for(p in 0:6){
  for(q in 0:6){
    m <- arima(series1, order = c(p,0,q), include.mean = TRUE)
    record_AIC[p+1, q+1] <- m$aic
  }
}
kable(record_AIC,caption = 'AIC')
which(record_AIC==min(record_AIC), arr.ind = TRUE)
min(record_AIC)
library(knitr)


arima2 <- arima(TSData,order = c(6,1,5))
accuracy(arima2)
checkresiduals(arima2)
