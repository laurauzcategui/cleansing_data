#read width fixed file format

# Read this data set into R and report
# the sum of the numbers in the fourth of the nine columns.

# Key aspects: as it is fixed format you can defined the width for every column
# negatives indicates to skip determined amount of characters

fixed_width <- read.fwf(file="./getdata-wksst8110.for",skip=4,
     widths=c(-1,9,-5,4,-1,3,-5,4,-1,3,-5,4,-1,3,-5,4,-1,3))
