library(xlsx)
if (!file.exists("data/getdata-data-DATA.gov_NGAP.xlsx")){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
  file <- download.file(fileURL,destfile="./data/getdata-data-DATA.gov_NGAP.xlsx",method="wget")

  dateDownload <- date()
}

colIndex <- 7:15
rowIndex <- 18:23
dat <- read.xlsx("./data/getdata-data-DATA.gov_NGAP.xlsx",1,colIndex=colIndex,rowIndex=rowIndex)

sumDat <- sum(dat$Zip*dat$Ext,na.rm=T) 
