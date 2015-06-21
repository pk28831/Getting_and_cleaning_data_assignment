##program assignment cleaning data
#
# required data packages
#
require(downloader)
require(curl)
require(dplyr)
require(tidyr)
#
# read the zipfile from the internet and unzip it
#
if (!file.exists("getdata_projectfiles_UCI_HAR_Dataset.zip")){
        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "getdata_projectfiles_UCI_HAR_Dataset.zip" ,method="curl")
        download_time<-date()
        print(download_time)
        unzip("getdata_projectfiles_UCI_HAR_Dataset.zip")
}
if(!file.exists("UCI_HAR_Dataset")){
        file.rename("UCI HAR Dataset", "UCI_HAR_Dataset")
}
#
#load the raw data
#
if(!exists("y_train")){
        y_train<-read.table("./UCI_HAR_Dataset/train/y_train.txt", header=FALSE)
        X_train<-read.table("./UCI_HAR_Dataset/train/X_train.txt", header=FALSE)
        subject_train<-read.table("UCI_HAR_Dataset/train/subject_train.txt", sep=" ", header=FALSE)
}
if (!exists("y_test")){
        y_test<-read.table("./UCI_HAR_Dataset/test/y_test.txt", header=FALSE)
        X_test<-read.table("./UCI_HAR_Dataset/test/X_test.txt", header=FALSE)
        subject_test<-read.table("UCI_HAR_Dataset/test/subject_test.txt", sep=" ", header=FALSE)
}
if (!exists("features")){
        features<-read.table("./UCI_HAR_Dataset/features.txt", header=FALSE)
        labels<-read.table("./UCI_HAR_Dataset/activity_labels.txt", header=FALSE)
}
#
#change headers for dataframes and vectors
#
header_test<-features[,2]
names(X_test)<-header_test
names(X_train)<-header_test
names(y_test)<-"activity"
names(y_train)<-"activity"
names(subject_test)<-"subjectNumber"
names(subject_train)<-"subjectNumber"
# 
#combine subject and activity
#
sub_act_test<-cbind(subject_test,y_test)
sub_act_train<-cbind(subject_train,y_train)
#
#combine sub_act_* and X*
#
test<-cbind(sub_act_test,X_test)
train<-cbind(sub_act_train,X_train)
#
#combine test and train
#
complete_set<-rbind(test,train)
#
# select mean and std drv channels, including Jerk signals, which are not measured,
# Jerk signals are the derivative to time of the accelerations. 
# including meanFrequency and the angle between 2 signals (7 rows) is not done, 
# as no std deviation of these signals are known, which would lead to NA .
#
colNames <-names(complete_set)
selection<-c(grep("subjectNumber",colNames),grep("activity",colNames), 
             grep("-mean\\()",colNames),grep("-std\\()",colNames))
selection_sorted<-sort(selection)
reduced_set<-complete_set[selection_sorted]
#
# clean up reduced_set
#
colNames2<-names(reduced_set)
# colNames2<-gsub("-mean\\()", "Mean",colNames2)
# colNames2<-gsub("-std\\()","Stddev", colNames2)
# #colNames2<-gsub("-meanFreq\\()","MeanFreq",colNames2)
# colNames2<-gsub("BodyBody","Body",colNames2)
# colNames2<-gsub("^t","time",colNames2)
# colNames2<-gsub("^f","freq",colNames2)
# colNames2<-gsub("Mag","Magnitude",colNames2)
# colNames2<-gsub("-","",colNames2)
# names(reduced_set) <- colNames2
#
#clean up labels
#
clean_labels<-labels
clean_labels[,2]<-tolower(clean_labels[,2])
clean_labels[2,2]<-"walkingUpstairs"
clean_labels[3,2]<-"walkingDownstairs"
#
# replace avtivity number by activity string in new dataframe
#
clean_set<- reduced_set
for (i in 1:6) {
        clean_set$activity<- gsub(as.character(i),clean_labels[i,2],clean_set$activity)
}
#
# now group_by activity and subjectNummber and summarize the mean and write to tidy_set
#
clean_set<-as.tbl(clean_set)
tidy_set<- clean_set %>%
        group_by(subjectNumber,activity,add=TRUE) %>%
        summarise_each(funs(mean))
# write the tidy data set to a text file
write.table(tidy_set, file="tidy_set.txt",sep=" ",dec=".",row.names=FALSE, col.names=TRUE) 
        


