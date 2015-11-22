---
title: "Getting and Cleaning Data Course Project"
author: "Bipin Karunakaran"
date: "November 21, 2015"
output: html_document
---
This is a repository for the course project for "Getting and Cleaning Data" offered by John's Hopkins University though Coursera. 

###Summary:
The project is intented to demostrate skills learned in the courser for collection, cleaning, merging and summarizing of data from different tables. The data can be downloaded from the [download link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ) and the desciption can be found at [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
 
 The R script run_analysis.R does the following as required by the project. (Please make changes to the paths and path variable, if you're downloading and using this code. )
 
 1. Downloads the datasets as a zip file and unzips the contents
 2. Merges the train and test datasets into one for the features, activities and subjects
 3. Adds the appropriate column names 
 4. Extracts the measurements on means and standard deviations
 5. Converts the column names into descriptive activity names
 6. Creates a tidy dataset with averages of each of the measurements for each subject by activity. 
 
CodeBook.md gives additional information about the variables, data and transformations. 
 
