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
##  [1] "Subject"                                                 
##  [2] "Activity"                                                
##  [3] "TimeBodyBodyAccelerationMean-X"                          
##  [4] "TimeBodyBodyAccelerationMean-Y"                          
##  [5] "TimeBodyBodyAccelerationMean-Z"                          
##  [6] "TimeBodyBodyAccelerationStdDev-X"                        
##  [7] "TimeBodyBodyAccelerationStdDev-Y"                        
##  [8] "TimeBodyBodyAccelerationStdDev-Z"                        
##  [9] "TimeGravityAccelerationMean-X"                           
## [10] "TimeGravityAccelerationMean-Y"                           
## [11] "TimeGravityAccelerationMean-Z"                           
## [12] "TimeGravityAccelerationStdDev-X"                         
## [13] "TimeGravityAccelerationStdDev-Y"                         
## [14] "TimeGravityAccelerationStdDev-Z"                         
## [15] "TimeBodyBodyAccelerationJerkMean-X"                      
## [16] "TimeBodyBodyAccelerationJerkMean-Y"                      
## [17] "TimeBodyBodyAccelerationJerkMean-Z"                      
## [18] "TimeBodyBodyAccelerationJerkStdDev-X"                    
## [19] "TimeBodyBodyAccelerationJerkStdDev-Y"                    
## [20] "TimeBodyBodyAccelerationJerkStdDev-Z"                    
## [21] "TimeBodyBodyGyroscopeMean-X"                             
## [22] "TimeBodyBodyGyroscopeMean-Y"                             
## [23] "TimeBodyBodyGyroscopeMean-Z"                             
## [24] "TimeBodyBodyGyroscopeStdDev-X"                           
## [25] "TimeBodyBodyGyroscopeStdDev-Y"                           
## [26] "TimeBodyBodyGyroscopeStdDev-Z"                           
## [27] "TimeBodyBodyGyroscopeJerkMean-X"                         
## [28] "TimeBodyBodyGyroscopeJerkMean-Y"                         
## [29] "TimeBodyBodyGyroscopeJerkMean-Z"                         
## [30] "TimeBodyBodyGyroscopeJerkStdDev-X"                       
## [31] "TimeBodyBodyGyroscopeJerkStdDev-Y"                       
## [32] "TimeBodyBodyGyroscopeJerkStdDev-Z"                       
## [33] "TimeBodyBodyAccelerationMagnitudeMean"                   
## [34] "TimeBodyBodyAccelerationMagnitudeStdDev"                 
## [35] "TimeGravityAccelerationMagnitudeMean"                    
## [36] "TimeGravityAccelerationMagnitudeStdDev"                  
## [37] "TimeBodyBodyAccelerationJerkMagnitudeMean"               
## [38] "TimeBodyBodyAccelerationJerkMagnitudeStdDev"             
## [39] "TimeBodyBodyGyroscopeMagnitudeMean"                      
## [40] "TimeBodyBodyGyroscopeMagnitudeStdDev"                    
## [41] "TimeBodyBodyGyroscopeJerkMagnitudeMean"                  
## [42] "TimeBodyBodyGyroscopeJerkMagnitudeStdDev"                
## [43] "FrequencyBodyBodyAccelerationMean-X"                     
## [44] "FrequencyBodyBodyAccelerationMean-Y"                     
## [45] "FrequencyBodyBodyAccelerationMean-Z"                     
## [46] "FrequencyBodyBodyAccelerationStdDev-X"                   
## [47] "FrequencyBodyBodyAccelerationStdDev-Y"                   
## [48] "FrequencyBodyBodyAccelerationStdDev-Z"                   
## [49] "FrequencyBodyBodyAccelerationJerkMean-X"                 
## [50] "FrequencyBodyBodyAccelerationJerkMean-Y"                 
## [51] "FrequencyBodyBodyAccelerationJerkMean-Z"                 
## [52] "FrequencyBodyBodyAccelerationJerkStdDev-X"               
## [53] "FrequencyBodyBodyAccelerationJerkStdDev-Y"               
## [54] "FrequencyBodyBodyAccelerationJerkStdDev-Z"               
## [55] "FrequencyBodyBodyGyroscopeMean-X"                        
## [56] "FrequencyBodyBodyGyroscopeMean-Y"                        
## [57] "FrequencyBodyBodyGyroscopeMean-Z"                        
## [58] "FrequencyBodyBodyGyroscopeStdDev-X"                      
## [59] "FrequencyBodyBodyGyroscopeStdDev-Y"                      
## [60] "FrequencyBodyBodyGyroscopeStdDev-Z"                      
## [61] "FrequencyBodyBodyAccelerationMagnitudeMean"              
## [62] "FrequencyBodyBodyAccelerationMagnitudeStdDev"            
## [63] "FrequencyBodyBodyBodyBodyAccelerationJerkMagnitudeMean"  
## [64] "FrequencyBodyBodyBodyBodyAccelerationJerkMagnitudeStdDev"
## [65] "FrequencyBodyBodyBodyBodyGyroscopeMagnitudeMean"         
## [66] "FrequencyBodyBodyBodyBodyGyroscopeMagnitudeStdDev"       
## [67] "FrequencyBodyBodyBodyBodyGyroscopeJerkMagnitudeMean"     
## [68] "FrequencyBodyBodyBodyBodyGyroscopeJerkMagnitudeStdDev"
```

#### Step 6
A tidy data set with the averages of all the feature variables are created, grouping by the Subject and Activity variables. The 'aggregate function is used for this purpose and the 'arrange' function is used for sorting the resuling data set. The tidy data set is written as a text file using the write.table function. 










