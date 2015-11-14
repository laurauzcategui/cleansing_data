library(sqldf)

# read the dataset and use sqldf to get
# probability weights pwgtp1 with ages less than 50?

acs <- read.csv("./getdata-data-ss06pid.csv", header = TRUE, sep = ",")
