# Quiz 3 - Question 2
#Use the parameter native=TRUE.
#What are the 30th and 80th quantiles of the resulting data?
# (some Linux systems may produce an answer 638 different for the 30th quantile)

library(jpeg)

if (!file.exists("data")){
  dir.create("data")
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
  file <- download.file(fileURL,destfile="./data/picture.jpg",method="curl")

  dateDownload <- date()
} else {
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg "
  file <- download.file(fileURL,destfile="./data/picture.jpg",method="curl")
}


img <- readJPEG("./data/picture.jpg",native=TRUE)

qtilesImg <- quantile(img,probs=c(0.3,0.8))
