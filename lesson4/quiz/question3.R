# author @laura_uzcategui


#question 3
#In the data set from Question 2 what is a regular expression that would allow you to 
#count the number of countries whose name begins with "United"? Assume that the variable 
#with the country names in it is named countryNames. How many countries begin with United?


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

grep("^United",gdp$V4,value=TRUE)