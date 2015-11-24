# Quiz 3 - Question 1
# Create a logical vector that identifies the households on greater than 10
# acres who sold more than $10,000 worth of agriculture products.
# Assign that logical vector to the variable agricultureLogical.
# Apply the which() function like this to identify the rows of the data frame where the logical vector is TRUE.
# which(agricultureLogical) What are the first 3 values that result?


if (!file.exists("data")){
  dir.create("data")
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
  file <- download.file(fileURL,destfile="./data/communities.csv",method="curl")

  dateDownload <- date()
}

communities <- read.csv("./data/communities.csv", header = TRUE, sep = ",")

agricultureLogical <- communities[,"ACR"] == 3 & communities[,"AGS"] == 6
top3 <- which(agricultureLogical)[1:3]
