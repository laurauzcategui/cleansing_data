# Load the Gross Domestic Product data for the 190 ranked countries in this data set: 
  
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 

# Load the educational data from this data set: 
  
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv 

# Match the data based on the country shortcode. Of the countries for which the end of the fiscal year is available, 
#how many end in June? 

# Original data sources: 
# http://data.worldbank.org/data-catalog/GDP-ranking-table 
# http://data.worldbank.org/data-catalog/ed-stats
ranks <- function(col){
  ranks <- as.numeric(gsub(",","",gsub("^\\s+|\\s+$", "", as.character(col))))
  return(ranks)
}

ranked <- function(col){
  ranked <- as.numeric(as.character(col))
  return(ranked)
}



gdp_init <- read.csv("gdp.csv", header = FALSE, sep = ",", skip=5)

country <- read.csv("country.csv",header = TRUE, sep= ",")

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

fiscalJune <- grep("Fiscal year end: June",country$Special.Notes)
validCodes <- gdp$V1 %in% country[fiscalJune,]$CountryCode
nrow(gdp[validCodes,])

gdp <- cbind(gdp,ranks=ranks[!na_ranks])
