---
title: "Code Book"
author: "Bipin Karunakaran"
date: "November 21, 2015"
output: html_document
---

###Overview
This Code Book lists the variables and transformations done on the Human Activity Recognition data, done and submitted as part of the project for "Getting and Cleaning Data". Please consult the README document for the steps followed in the process


The data sets provided in the [download link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ) has the train and test datasets with the acceleration and angular velocity captured by accelerometers and gyroscopes on 6 activities performed by 30 volunteers. The activities are Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing and Laying. The dataset containing the measurements is prefixed with 'X', the one with the activity ids is prefixed with 'Y' and the one with id for the subject, prefixed with 'subject'. The train and test data are available in the /train and /test subfolders respectively. The labels for these activities can be found in /UCI HAR Dataset folder, one level above the /test and /train folders. 

The **first step** in the data cleaning process is to download and unzip the data. The subsequent steps are listed below with descriptions:

#### Steps 2 and 3
The datasets are read in and features (x_), activity(y_) and subject (subject_) data sets are concatenated  

+ subject_train.txt with subject_test.txt  
+ x_train.txt with x_test.txt  
+ y_train.txt with y_test.txt 

The lone column in the activity data set is named "Activity" and the one in the subject dataset is named "Subject". The features dataset is named with the values read in from features.txt. After that, the three concatenated datasets are merged to get one dataset with subject, activity and all the features columns. This is a straightforward merge using cbind, as the rows in these datasets are already aligned.

#### Step 4

Only the columns with which have mean() and std() are retained. The grep function is used for this. The fields that have meanFreq() and gravityMean were not included in this. 


#### Step 5

The descriptive column names were read in from activity_labels.txt and merged with the above dataset to get the activity lables in the field named "Activity". The earlier "Activity" column containing the activity id is deleted. 

The columns 't' at the start of column names were replaced with 'time', 'f' with 'frequency', '-mean()' with 'Mean', '-std()' with 'StdDev', 'acc' with 'Acceleration'. 'gyro' with 'gyroscope' and 'mag' with 'magnitudd'. The gsub function is used for this purpose. The resulting dataset has the following columns:


```
##  [1] "TimeBodyBodyAccelerationMean-X"                          
##  [2] "TimeBodyBodyAccelerationMean-Y"                          
##  [3] "TimeBodyBodyAccelerationMean-Z"                          
##  [4] "TimeBodyBodyAccelerationStdDev-X"                        
##  [5] "TimeBodyBodyAccelerationStdDev-Y"                        
##  [6] "TimeBodyBodyAccelerationStdDev-Z"                        
##  [7] "TimeGravityAccelerationMean-X"                           
##  [8] "TimeGravityAccelerationMean-Y"                           
##  [9] "TimeGravityAccelerationMean-Z"                           
## [10] "TimeGravityAccelerationStdDev-X"                         
## [11] "TimeGravityAccelerationStdDev-Y"                         
## [12] "TimeGravityAccelerationStdDev-Z"                         
## [13] "TimeBodyBodyAccelerationJerkMean-X"                      
## [14] "TimeBodyBodyAccelerationJerkMean-Y"                      
## [15] "TimeBodyBodyAccelerationJerkMean-Z"                      
## [16] "TimeBodyBodyAccelerationJerkStdDev-X"                    
## [17] "TimeBodyBodyAccelerationJerkStdDev-Y"                    
## [18] "TimeBodyBodyAccelerationJerkStdDev-Z"                    
## [19] "TimeBodyBodyGyroscopeMean-X"                             
## [20] "TimeBodyBodyGyroscopeMean-Y"                             
## [21] "TimeBodyBodyGyroscopeMean-Z"                             
## [22] "TimeBodyBodyGyroscopeStdDev-X"                           
## [23] "TimeBodyBodyGyroscopeStdDev-Y"                           
## [24] "TimeBodyBodyGyroscopeStdDev-Z"                           
## [25] "TimeBodyBodyGyroscopeJerkMean-X"                         
## [26] "TimeBodyBodyGyroscopeJerkMean-Y"                         
## [27] "TimeBodyBodyGyroscopeJerkMean-Z"                         
## [28] "TimeBodyBodyGyroscopeJerkStdDev-X"                       
## [29] "TimeBodyBodyGyroscopeJerkStdDev-Y"                       
## [30] "TimeBodyBodyGyroscopeJerkStdDev-Z"                       
## [31] "TimeBodyBodyAccelerationMagnitudeMean"                   
## [32] "TimeBodyBodyAccelerationMagnitudeStdDev"                 
## [33] "TimeGravityAccelerationMagnitudeMean"                    
## [34] "TimeGravityAccelerationMagnitudeStdDev"                  
## [35] "TimeBodyBodyAccelerationJerkMagnitudeMean"               
## [36] "TimeBodyBodyAccelerationJerkMagnitudeStdDev"             
## [37] "TimeBodyBodyGyroscopeMagnitudeMean"                      
## [38] "TimeBodyBodyGyroscopeMagnitudeStdDev"                    
## [39] "TimeBodyBodyGyroscopeJerkMagnitudeMean"                  
## [40] "TimeBodyBodyGyroscopeJerkMagnitudeStdDev"                
## [41] "FrequencyBodyBodyAccelerationMean-X"                     
## [42] "FrequencyBodyBodyAccelerationMean-Y"                     
## [43] "FrequencyBodyBodyAccelerationMean-Z"                     
## [44] "FrequencyBodyBodyAccelerationStdDev-X"                   
## [45] "FrequencyBodyBodyAccelerationStdDev-Y"                   
## [46] "FrequencyBodyBodyAccelerationStdDev-Z"                   
## [47] "FrequencyBodyBodyAccelerationJerkMean-X"                 
## [48] "FrequencyBodyBodyAccelerationJerkMean-Y"                 
## [49] "FrequencyBodyBodyAccelerationJerkMean-Z"                 
## [50] "FrequencyBodyBodyAccelerationJerkStdDev-X"               
## [51] "FrequencyBodyBodyAccelerationJerkStdDev-Y"               
## [52] "FrequencyBodyBodyAccelerationJerkStdDev-Z"               
## [53] "FrequencyBodyBodyGyroscopeMean-X"                        
## [54] "FrequencyBodyBodyGyroscopeMean-Y"                        
## [55] "FrequencyBodyBodyGyroscopeMean-Z"                        
## [56] "FrequencyBodyBodyGyroscopeStdDev-X"                      
## [57] "FrequencyBodyBodyGyroscopeStdDev-Y"                      
## [58] "FrequencyBodyBodyGyroscopeStdDev-Z"                      
## [59] "FrequencyBodyBodyAccelerationMagnitudeMean"              
## [60] "FrequencyBodyBodyAccelerationMagnitudeStdDev"            
## [61] "FrequencyBodyBodyBodyBodyAccelerationJerkMagnitudeMean"  
## [62] "FrequencyBodyBodyBodyBodyAccelerationJerkMagnitudeStdDev"
## [63] "FrequencyBodyBodyBodyBodyGyroscopeMagnitudeMean"         
## [64] "FrequencyBodyBodyBodyBodyGyroscopeMagnitudeStdDev"       
## [65] "FrequencyBodyBodyBodyBodyGyroscopeJerkMagnitudeMean"     
## [66] "FrequencyBodyBodyBodyBodyGyroscopeJerkMagnitudeStdDev"   
## [67] "Subject"                                                 
## [68] "Activity"
```

#### Step 6
A tidy data set with the averages of all the feature variables are created, grouping by the Subject and Activity variables. The 'aggregate function is used for this purpose and the 'arrange' function is used for sorting the resuling data set. The tidy data set is written as a text file using the write.table function. 










