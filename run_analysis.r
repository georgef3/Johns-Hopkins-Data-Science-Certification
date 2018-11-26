#Week 4, Coursera Getting and Cleaning Data in R, Final Assignment
#Course Project: https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project
#You should create one R script called run_analysis.R that does the following.


#1. Merges the training and the test sets to create one data set.
#Helfpul tutorial: https://www.datacamp.com/community/tutorials/r-data-import-tutorial#txt
#Another helpful tutorial: https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/

#load libraries
library(dplyr)

#Load the data and the features
X_test <- read.table("/Users/georgefleeson/Documents/Data Science in R/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("/Users/georgefleeson/Documents/Data Science in R/UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("/Users/georgefleeson/Documents/Data Science in R/UCI HAR Dataset/test/subject_test.txt")
X_train <- read.table("/Users/georgefleeson/Documents/Data Science in R/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("/Users/georgefleeson/Documents/Data Science in R/UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("/Users/georgefleeson/Documents/Data Science in R/UCI HAR Dataset/train/subject_train.txt")
features <- read.table("/Users/georgefleeson/Documents/Data Science in R/UCI HAR Dataset/features.txt")
features <- transpose(features)
features[2,]

#Add the feature names to the 561 variables in the test data
oldnames = colnames(X_test)
newnames = features[2,]
X_test_re <- X_test %>% rename_at(vars(oldnames),~newnames)

#Add the test subject to the data frame and label it
X_test_re <- cbind(X_test_re,test_subject)
names(X_test_re)[names(X_test_re) == 'V1'] <- 'Subject'

#Add the activity categories ("y_train") to the data
X_test_re_re <- cbind(y_test, X_test_re)
names(X_test_re_re)[names(X_test_re_re) == 'V1'] <- 'Activity'

#Add the feature names to the 561 variables in the train data
#(reference #4: Appropriately labels the data set with descriptive variable names.)
oldnames = colnames(X_train)
newnames = features[2,]
X_train_re <- X_train %>% rename_at(vars(oldnames),~newnames)

#Add the train subject to the data frame and label it
X_train_re <- cbind(X_train_re,train_subject)
names(X_train_re)[names(X_train_re) == 'V1'] <- 'Subject'

#Add the activity categories ("y_train") to the data
X_train_re_re <- cbind(y_train, X_train_re)
names(X_train_re_re)[names(X_train_re_re) == 'V1'] <- 'Activity'

#Combine the two data tables for sweet success
data <- rbind(X_train_re_re, X_test_re_re)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
colnames(data)
#df[, -grep("1$", colnames(df))]
mean_inclusive <- data[, grep(("[Mm]ean"), colnames(data))]
dim(mean_inclusive)

std_inclusive <- data[, grep(("std()"), colnames(data))]
dim(std_inclusive)

subject <- data[ , grep(("Subject"), colnames(data))]
activity <- data[ , grep(("Activity"), colnames(data))]

data_re <- cbind(subject,activity,mean_inclusive,std_inclusive)
dim(data_re)

#3. Uses descriptive activity names to name the activities in the data set
data_re$activity <- gsub(1,"WALKING",data_re$activity)
data_re$activity <- gsub(2,"WALKING_UPSTAIRS",data_re$activity)
data_re$activity <- gsub(3,"WALKING_DOWNSTAIRS",data_re$activity)
data_re$activity <- gsub(4,"SITTING",data_re$activity)
data_re$activity <- gsub(5,"STANDING",data_re$activity)
data_re$activity <- gsub(6,"LAYING",data_re$activity)

#5. From the data set in step 4, creates a second, 
#independent tidy data set with the average of each variable for each activity and each subject.
averages <- data_re %>% group_by(subject, activity) %>% summarise_all(mean)
write.table(averages, file =  "/Users/georgefleeson/Documents/Data Science in R/UCI HAR Dataset/averages.txt", sep="\t", row.names = FALSE, col.names = TRUE)
