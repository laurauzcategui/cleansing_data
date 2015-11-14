#read width fixed file format

fixed_width <- read.fwf(file="./getdata-wksst8110.for",skip=4,
     widths=c(-1,9,-5,4,-1,3,-5,4,-1,3,-5,4,-1,3,-5,4,-1,3))
