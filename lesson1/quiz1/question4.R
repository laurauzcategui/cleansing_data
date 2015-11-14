library(XML)
library(RCurl)

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
xData <- getURL(fileURL)
xmlDoc <- xmlTreeParse(xData,useInternal=TRUE)
rootNode <- xmlRoot(xmlDoc)
zipCodes <- xpathSApply(rootNode,"//zipcode",xmlValue)
