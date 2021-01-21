# Getting-and-Cleaning-Data-Course-Project
Peer-graded Assignment: Getting and Cleaning Data Course Project
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 
Data collected from the accelerometers from the Samsung Galaxy S smartphone.

Dataset
Human Activity Recognition Using Smartphones Data Set
More information can be found at the data source website: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for this project can be downloaded here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Files
CodeBook.md a code book that describes the variables, the data, any transformations and work in order to clean up the data

run_analysis.R performs the data preparation
1. Download the data set
2. Unzip the dataset
3. Merges the training and the test sets to create one data set. 
4. Reading the train datasets
5. Reading the test datasets
6. Reading the feauture vector
7. Reading activity labels
8. Variable names train datasets
9. Variable names test datasets
10. Merges the training and the test sets to create one data set. The new dataset consists of 10299 observations of 563 variables
11. Extracts only the measurements on the mean and standard deviation for each measurement using the grep command. 
12. Uses descriptive activity names to name the activities in the data set. 1 WALKING 2 WALKING_UPSTAIRS 3 WALKING_DOWNSTAIRS 4 SITTING 5 STANDING 6 LAYING 
13. Appropriately labels the data set with descriptive variable names unsing the gsub command in order to label the data set. 
14. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy_data.txt is the exported final data after going through all the sequences described above.
