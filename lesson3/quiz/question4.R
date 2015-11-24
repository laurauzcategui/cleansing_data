# Quiz 3 - Question 3
# Load the Gross Domestic Product data for the 190 ranked countries in this data set:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
# Load the educational data from this data set:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv
# Match the data based on the country shortcode. How many of the IDs match?
# Sort the data frame in descending order by GDP rank (so United States is last).
# What is the 13th country in the resulting data frame?

# Original data sources:
# http://data.worldbank.org/data-catalog/GDP-ranking-table
# http://data.worldbank.org/data-catalog/ed-stats

library(dplyr)
 
downloadFile <- function(fURL, dir,method,fname) {
  
  if (!file.exists(dir)){
    dir.create(dir)
    destfile <- paste0('./',dir,'/',fname)
    file <- download.file(fURL,destfile=destfile,method=method)
    
    dateDownload <- date()
  } else {
    destfile <- paste0('./',dir,'/',fname)
    file <- download.file(fURL,destfile=destfile,method=method)
    dateDownload <- date()
  }
  return(dateDownload)
}

ranks <- function(col){
  ranks <- as.numeric(gsub(",","",gsub("^\\s+|\\s+$", "", as.character(col))))
  return(ranks)
}

ranked <- function(col){
  ranked <- as.numeric(as.character(col))
  return(ranked)
}

#reading Gross Domestic Product
#dateGross <- downloadFile("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv","data","curl","gdp.csv")
grossProduct <- read.csv("./data/gdp.csv", header = FALSE, sep = ",", skip=5)

#reding educational data
#dateEducational <- downloadFile("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv","data","curl","country.csv")
educational <- read.csv("./data/country.csv", header = TRUE, sep = ",")

highOECD <- educational[educational$"Income.Group" ==  "High income: OECD",]
highNO <- educational[educational$"Income.Group" == "High income: nonOECD",]
mergedDS <- merge(highOECD,highNO,all=TRUE)

