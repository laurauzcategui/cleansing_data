library(httr)
library(XML)

contact <- GET("http://biostat.jhsph.edu/~jleek/contact.html")
contacts <- content(contact,as="text")
content_Contacts <- htmlParse(contacts,asText=TRUE)

line_10 <- capture.output(content_Contacts)[10]
line_20 <- capture.output(content_Contacts)[20]
line_30 <- capture.output(content_Contacts)[30]
line_100 <-capture.output(content_Contacts)[100]
