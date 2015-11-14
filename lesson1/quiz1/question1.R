if (!file.exists("data")){
  dir.create("data")
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
  file <- download.file(fileURL,destfile="./data/communities.csv",method="wget")

  dateDownload <- date()
}

communities <- read.csv("./data/communities.csv", header = TRUE, sep = ",")
