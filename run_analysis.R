###################################################
## R Scipt for Getting and Cleaning Data Project ##
## Submitted by:Bipin Karunakaran                ##
## 22 Nov, 2015                                  ##
##                                               ##
## Description:                                  ##
## The script is meant for merging, cleaning and ##
## aggregating the UCI HAR Dataset, as part of   ##
## submission of the project for Getting and     ##
## Cleaning Data                                 ##
###################################################

## Step 1

#Download the data from the given link:
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile="./hardata.zip",method="curl")

#Create directory ./har in the current working directory(this is done outside of R)

#Unzip the file into the created directory ./har
unzip(zipfile="./hardata.zip", exdir = "./har")

#create path variables for the /train and /test subfolders
path_train = "./har/UCI HAR Dataset/train"
path_test = "./har/UCI HAR Dataset/test"

## Step 2
#Read in the X, Y and subject data from the train and test datasets

featTrain  <- read.table(file.path(path_train , "X_train.txt" ),header = FALSE)
featTest  <- read.table(file.path(path_test , "X_test.txt" ),header = FALSE)

actTrain  <- read.table(file.path(path_train , "Y_train.txt" ),header = FALSE)
actTest  <- read.table(file.path(path_test , "Y_test.txt" ),header = FALSE)

subTrain  <- read.table(file.path(path_train , "subject_train.txt" ),header = FALSE)
subTest  <- read.table(file.path(path_test , "subject_test.txt" ),header = FALSE)

#Concatenate each of these test and train datasets separately
act <- rbind(actTrain, actTest)
feat <- rbind(featTrain, featTest)
sub  <- rbind(subTrain, subTest)

## Step 3
#Name the columns for activity and subject and features from the "features.txt" dataset
names(act) <- c("Activity")
names(sub) <- c("Subject")
names(feat) <- read.table("./har/UCI HAR Dataset/features.txt",header=FALSE)[,2]

# Append the columns to form one dataset
finalData <- cbind(feat, sub, act)


## Step 4
# Create a subset with only mean() and std() variables along with "Subject" and "Activity"
summaryData <- subset(finalData, select = c(names(finalData[, grep('mean\\(\\)|std\\(\\)' , names(finalData))]), "Activity", "Subject"))


## Step 5
# Read in the activity labels
actLabels <- read.table("./har/UCI HAR Dataset/activity_labels.txt",header = FALSE)

#Merge the summary data with the activity labels data  
summaryData <- merge(summaryData, actLabels, by.x = "Activity", by.y = "V1", all.x= TRUE, sort=FALSE)

#Remove the current activity field and rename the activity label field as activity
summaryData <- subset(summaryData, select = -Activity)
library(plyr)
summaryData <- rename(summaryData, c("V2" = "Activity"))

 

#Rename the variables with full label descriptions
names(summaryData)<-gsub("^t", "Time", names(summaryData))
names(summaryData)<-gsub("^f", "Frequency", names(summaryData))
names(summaryData)<-gsub("-std\\(\\)", "StdDev", names(summaryData))
names(summaryData)<-gsub("-mean\\(\\)", "Mean", names(summaryData))
names(summaryData)<-gsub("[Aa]cc", "Acceleration", names(summaryData))
names(summaryData)<-gsub("[Gg]yro", "Gyroscope", names(summaryData))
names(summaryData)<-gsub("[Mm]ag", "Magnitude", names(summaryData))
names(summaryData)<-gsub("Body", "BodyBody", names(summaryData))

## Step 6

# Create a tidy dataset wth the averages for all the variables by subject and activity
TidyAverageData <- aggregate(. ~ Subject + Activity, data = summaryData, mean)

# Sort by Subject and Activity and output as a text file
TidyAverageData <- arrange(TidyAverageData, Subject, Activity )
write.table(TidyAverageData, file = "tidydata.txt",row.name=FALSE)






