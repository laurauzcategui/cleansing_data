
#How many values were collected in 2012? How many values were collected on Mondays in 2012?

library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 


year2012 <- grep("^2012",sampleTimes)
mondays <- grep("Monday",weekdays(sampleTimes[year2012]))
length(mondays)
