# Author @laura_uzcategui
library(dplyr)
# load ds
train_ds <- read.table("./data/train/X_train.txt")
train_act <-  read.table("./data/train/y_train.txt", col.names = "activity")


test_ds <-  read.table("./data/test/X_test.txt")
test_act <-   read.table("./data/test/y_test.txt", col.names = "activity")

activities <- read.table("./data/activity_labels.txt",stringsAsFactors = FALSE,col.names = c("actId","actName"))
activities$actName = as.factor(activities$actName)
# merge data by columns
train_merged <- cbind(train_ds,train_act)
test_merged <- cbind(test_ds,test_act)

#merge data by rows
data_m <- rbind(train_merged,test_merged)

#read columns names for dataset
names_ds <- read.table("./data/features.txt",stringsAsFactors = FALSE,col.names = c("rowid","nameCol"))
names_ds <- rbind(names_ds, c("562","activity"))
colnames(data_m) <- names_ds$nameCol

#get only mean and std columns
data_filter <- cbind(data_m[,grep("mean|Mean|std",colnames(data_m))],activity=data_m$activity)

#adding label for the activity
tidy_data <- merge(data_filter, activities)


#writingDS
write.table(tidy_data,"./data/tidyDS.txt",row.names = FALSE )