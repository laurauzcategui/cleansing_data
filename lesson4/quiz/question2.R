# author @laura_uzcategui


#question 2
#Load the Gross Domestic Product data for the 190 ranked countries in this data set: 
  
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 
#Remove the commas from the GDP numbers in millions of dollars and average them. What is the average? 
#Original data sources: http://data.worldbank.org/data-catalog/GDP-ranking-table


ranks <- function(col){
  ranks <- as.numeric(gsub(",","",gsub("^\\s+|\\s+$", "", as.character(col))))
  return(ranks)
}

ranked <- function(col){
  ranked <- as.numeric(as.character(col))
  return(ranked)
}


gdp_init <- read.csv("gdp.csv", header = FALSE, sep = ",", skip=5)
good <- gdp_init[,"V1"] != ""
gdp <- gdp_init[good,]

na_ranked <- is.na(ranked(gdp$V2))
na_ranks <- is.na(ranks(gdp$V5))

gdp <- gdp[!na_ranks,]
gdp <- gdp[!na_ranked,]

ranked <- ranked(gdp$V2)
na_ranked <- is.na(ranked)

ranks <- ranks(gdp$V5)
na_ranks <- is.na(ranks)

gdp <- cbind(gdp,ranks=ranks[!na_ranks])

mean(gdp$ranks)
