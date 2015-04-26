---
title: "README.md"
output: html_document
---

This repo contains the R scripts that can be used to analysis the smartphone data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

R script for below

-    Merges the training and the test sets to create one data set.
-    Extracts only the measurements on the mean and standard deviation for each measurement. 
-    Uses descriptive activity names to name the activities in the data set
-    Appropriately labels the data set with descriptive variable names. 

-    From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## R code

source("run_analysis.R"

tidy_data <- read.table("tidy_data.txt")

##Data CodeBook
The repo includes Codebook which defines and explain tidy dataset variables.