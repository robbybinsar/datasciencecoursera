---
title: "CodeBook Peer Graded-Assignment Getting and Cleaning Data"
author: "Robby Butarbutar"
date: "8/21/2020"
output: 
  html_document:
    keep_md: TRUE
    toc: TRUE
    
---



## Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

The `run_analysis.R` perform 5 main process as described on the project description:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### 1. Loading and unzipping dataset
  - Download dataset and unzipping it to working directory

### 2. Assigning variables to each dataset
  - `activity` = `./data/UCI HAR Dataset/activity_labels.txt` : 6 rows, 2 columns  
  List of activities performed when the corresponding measurements were taken and its codes (labels)
  - `features` = `./data/UCI HAR Dataset/features.txt` : 561 rows, 2 columns  
  The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
  - `subjectTest` = `./data/UCI HAR Dataset/test/subject_test.txt` : 2947 rows, 1 column  
  contains test data of 9/30 volunteer test subjects being observed
  - `test_x` = `./data/UCI HAR Dataset/test/X_test.txt` : 2947 rows, 561 columns  
  contains recorded features test data
  - `test_y` = `./data/UCI HAR Dataset/test/y_test.txt` : 2947 rows, 1 columns  
  contains test data of activities’code labels
  - `subjectTrain` = `./data/UCI HAR Dataset/train/subject_train.txt` : 7352 rows, 1 column  
  contains train data of 21/30 volunteer subjects being observed
  - `train_x` = `./data/UCI HAR Dataset/train/X_train.txt` : 7352 rows, 561 columns  
  contains recorded features train data
  - `train_y` = `./data/UCI HAR Dataset/train/y_train.txt` : 7352 rows, 1 columns  
  contains train data of activities’code labels
  
### 3. Merging Test and Training datasets
  - `sumbu_X` is created by merging `train_x` and `test_x` using `bind_rows` in dplyr package (10299 rows; 561 columns)
  - `sumbu_Y` is created by merging `train_y` and `test_y` using `bind_rows` in dpyr package (10299 rows; 1 column)
  - `subjects` is created by merging `subjectTrain` and `subjectTest` using `bind_rows` in dplyr package (10299 rows; 1 column)
  - `merged` is created by merging `subjects`, `sumbu_X`, and `sumbu_Y` using `bind_cols` in dplyr package (10299 rows; 563 column)
  
### 4. Selecting variables that contain only "mean" and "standard deviation"
  - `tidydata` is created by selecting `merged` with several variables they are: `subject` `no` and any variables that contain `mean` and `standard deviation (std)`.
  
### 5. Using descrptive activity names
  - Replacing value in `no` of `tidydata` dataframe with corresponding second column of the `activity` dataframe
  - `no` column names is replaced with new name `activity`
  
### 6. Labeling all the variables with proper name
  - All Acc in column’s name replaced by Accelerometer
  - All Gyro in column’s name replaced by Gyroscope
  - All BodyBody in column’s name replaced by Body
  - All Mag in column’s name replaced by Magnitude
  - All start with character f in column’s name replaced by Frequency
  - All start with character t in column’s name replaced by Time
  
### 7. Creating another independent tidydata with average of each variables
  - `result` is created by grouping the data based on subject and activity and summarizing the variables with calculating mean of each variables. (180 rows; 88 columns)
  - Final step is to export the `result` into `resultassignment.txt`

