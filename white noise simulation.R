set.seed(123)
# simulate a time series whith just random components
white_noise<- arima.sim(list(order=c(0,0,0)),innov =rnorm(200, 5, 1), n = 200) 
# Fit a model to a time series
model<- auto.arima(white_noise)

plot.ts(white_noise)
# All good! looks like an Awesome random time series. with 5 as mean
mean(white_noise) # okay its a bit off from 5, but not too much!

library(forecast)
white_noise_forecast<- forecast(model, h = 3 ) # predicting for the next three values.

View(white_noise_forecast) 
white_noise_forecast$mean  #  the future values predicted will be equal to the mean of the past values.
