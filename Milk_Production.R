# remove env variables
rm(list = ls(all.names = T))

# set working directory
setwd("/DS/TS Cook Book")


# Required Libraries 
library(lubridate)

# Be careful, there's a header for the dataset. 
Milk_Production <- read.csv("/DS/TS Cook Book/monthly-milk-production-pounds-p.csv", header=T)
View(Milk_Production)
# the second column name looks wierd . Lets change it to Monthly_Milk_production. 
colnames(Milk_Production) <- c("Month", "Monthly_Milk_production")

str(Milk_Production) # colnames look to be fine but date is imported as factor

summary(Milk_Production) # There's an NA at the end. Lets get rid of it. 
Milk_Production <- Milk_Production[1:nrow(Milk_Production)-1,]

# Lets convert Milk_Production$Monthly_Milk_production to a timeseries. We do not need to convert date column to date object as we will not use it.
# Instead R will convert it for us. So clever of me!
Milk_ProductionTS <- ts(Milk_Production$Monthly_Milk_production, start = c(1962, 1), frequency = 12)


summary(Milk_ProductionTS) 


# Finally we have arrived for experiencing the AHA moment.
plot.ts(Milk_ProductionTS)

# We can clearly see Trend and seasonlity. 

decomposed_Milk_ProductionTS <- decompose(Milk_ProductionTS)
plot(decomposed_Milk_ProductionTS)
# observe the values for decomposed_Milk_ProductionTS
decomposed_Milk_ProductionTS$trend
# The trend is incresing, Look at Jan columns for all years (623<647<668<....<848<858) the numbers are constantly increasing, same is the case for Feb, March 
# and rest of the months. An Aha moment that there's trend

decomposed_Milk_ProductionTS$seasonal
# The seasonality is constant for every month

decomposed_Milk_ProductionTS$random
# The random component is purely random.


######################### 

#Air temparature in Nottingham castle.

air.temperature <- read.csv("/DS/TS Cook Book/mean-monthly-air-temperature-deg.csv", header=T)
View(air.temperature)

colnames(air.temperature) <- c("Month", "Monthly_air_temp")
air.temperature <- air.temperature[1:nrow(air.temperature)-1,]
air.temperatureTS <- ts(air.temperature$Monthly_air_temp, start = c(1920, 1), frequency = 12)
summary(air.temperatureTS)
plot.ts(air.temperatureTS)
plot(decompose(air.temperatureTS))

#FInd your own Aha moments. 


