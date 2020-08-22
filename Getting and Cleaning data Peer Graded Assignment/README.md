---
title: "README"
author: "Robby Butarbutar"
date: "8/22/2020"
output: 
  html_document: 
    keep_md: TRUE
    toc: TRUE
---



## Peer Graded Assignment: Getting and Cleaning Data Course Project


This README is created to guide you into important files related with peer graded assignment: Getting and cleaning data course project by JHU with Coursera.

It has the instructions on how to run analysis on human activity recognition dataset.

The dataset can be downloaded here:  
[Data collected from the accelerometers from the Samsung Galaxy S smartphone](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

**Files**  
1. `CodeBook.md`: a code book that describes the variables, the data, and any transformations or work that I performed to clean up the data  
2. `run_analysis.R` : performs the data preparation and then followed by the 5 steps required as described in the course project’s definition:  
  
  - Merges the training and the test sets to create one data set.  
  - Extracts only the measurements on the mean and standard deviation for each measurement.  
  - Uses descriptive activity names to name the activities in the data set  
  - Appropriately labels the data set with descriptive variable names.  
  - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  

3.`resultassignment.txt`  is the exported final data after going through all the sequences described above.



