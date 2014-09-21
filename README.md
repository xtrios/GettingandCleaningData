GettingandCleaningData
======================

## The run_analysis.R file performs the following function:

1) Merges the training and the test sets to create one data set.

2) Extracts only the measurements on the mean and standard deviation for each measurement. 

3) Uses descriptive activity names to name the activities in the data set

4) Appropriately labels the data set with descriptive variable names. 

5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## =======================================================

## Operating Instructions

1) The working directory must be set to the dataset folder: "..\UCI HAR Dataset"

2) The code requires the "plyr" package in R. If not installed, please run 'install.packages("plyr")' in your R console.

## ========================================================

## Quick run-through on how the code works

1) load the plyr libraries
2) set working directories
3) import files into data sets within R
4) identify columns for means and standard deviation, and extract these specific columns from data set
5) replace dataframe headers with variable names (for subject, activity, and features)
6) merge the test and training data sets
7) replace the number codes with descriptive activities
8) refine the dataset with descriptive variable names. 
9) create an independent tidy data set with the average of each variable for each activity and each subject
    ** note: the "plyr" package is required for this step
10) export tidy data set as a text file.
