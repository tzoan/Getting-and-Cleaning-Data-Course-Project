#Getting and Cleaning Data Course Project
#Anastasia Tzogani

#Human Activity Recognition Using Smartphones Data Set
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names. 
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(dplyr)

## Download the dataset
if(!file.exists("./getcleandata")){dir.create("./getcleandata")}
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile = "./getcleandata/projectdataset.zip")

## Unzip the dataset
unzip(zipfile = "./getcleandata/projectdataset.zip", exdir = "./getcleandata")

### 1. Merges the training and the test sets to create one data set.

## Reading the train datasets
x_train <- read.table("./getcleandata/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./getcleandata/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./getcleandata/UCI HAR Dataset/train/subject_train.txt")

## Reading the test datasets
x_test <- read.table("./getcleandata/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./getcleandata/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./getcleandata/UCI HAR Dataset/test/subject_test.txt")

## Reading the feauture vector
features <- read.table("./getcleandata/UCI HAR Dataset/features.txt")

## Reading activity labels
activities<-read.table("./getcleandata/UCI HAR Dataset/activity_labels.txt")

## Variable names train datasets
colnames(x_train)<-features[,2]
colnames(y_train) <- "activityID"
colnames(subject_train) <- "subjectID"

##Variable names test datasets
colnames(x_test)<-features[,2]
colnames(y_test) <- "activityID"
colnames(subject_test) <- "subjectID"

##Merges the training and the test sets to create one data set.Alldata consists of 10299 observations of 563 variables
alltrain<-cbind(x_train,y_train,subject_train)
alltest<-cbind(x_test,y_test,subject_test)
alldata<-rbind(alltrain,alltest)

### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
alldata<-alldata[,grep("subjectID|activityID|mean|std",names(alldata))]


## 3. Uses descriptive activity names to name the activities in the data set. 1 WALKING 2 WALKING_UPSTAIRS 3 WALKING_DOWNSTAIRS 4 SITTING 5 STANDING 6 LAYING
alldata$activityID <- factor(alldata$activityID, levels = activities[, 1], labels = activities[, 2])
alldata$activityID

## 4. Appropriately labels the data set with descriptive variable names. 
colnames(alldata)<-gsub("[\\(\\)-]","",names(alldata))
colnames(alldata)<-gsub("^f", "frequencyDomain",names(alldata))
colnames(alldata)<-gsub("^t", "timeDomain",names(alldata))
colnames(alldata)<-gsub("Acc", "Accelerometer",names(alldata))
colnames(alldata)<-gsub("Gyro", "Gyroscope",names(alldata))
colnames(alldata)<-gsub("Mag", "Magnitude",names(alldata))
colnames(alldata)<-gsub("Freq", "Frequency",names(alldata))
colnames(alldata)<-gsub("mean", "Mean",names(alldata))
colnames(alldata)<-gsub("std", "StandardDeviation",names(alldata))
colnames(alldata)<-gsub("BodyBody", "Body",names(alldata))


## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
second_dataset <- alldata %>% group_by(subjectID, activityID) %>% summarise_each(funs(mean))
write.table(second_dataset, file="tidy_data.txt", row.names = FALSE, quote = FALSE)





