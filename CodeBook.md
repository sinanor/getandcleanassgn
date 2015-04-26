---
title: "CodeBook for Tidy Dataset"
output: html_document
---

This CodeBook describes the data produced by run_analysis.R file

The data  is downloaded from below link 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data is merged as below

trainlabels<- read.table("UCI HAR Dataset/train/y_train.txt")
testlabels<- read.table("UCI HAR Dataset/test/y_test.txt")
mergedlabels= rbind(trainlabels, testlabels)
activitylabels<- read.table("UCI HAR Dataset/activity_labels.txt")

trainsubject<- read.table("UCI HAR Dataset/train/subject_train.txt")
testsubject<- read.table("UCI HAR Dataset/test/subject_test.txt")
mergedsubject <- rbind(trainsubject, testsubject)

The train and test data are combine, column names gathered feature.txt and names lower cased and cleaned strange charaters as below

features$V2 <- tolower(features$V2)
features$V2 <- sapply(features$V2, function(x) gsub("-|\\(|\\)|,", "",x))

## subject
This column represent person id which data is measured (1-30)

## activity

This column represent type of activity and can be one of below

- "LAYING"
- "SITTING"
- "STANDING"
- "WALKING"           
- "WALKING_DOWNSTAIRS" 
- "WALKING_UPSTAIRS"  

## Measurement

Measurement variables can be one of below 86 

 [1] "tbodyaccmeanx"                     "tbodyaccmeany"                    
 [3] "tbodyaccmeanz"                     "tbodyaccstdx"                     
 [5] "tbodyaccstdy"                      "tbodyaccstdz"                     
 [7] "tgravityaccmeanx"                  "tgravityaccmeany"                 
 [9] "tgravityaccmeanz"                  "tgravityaccstdx"                  
[11] "tgravityaccstdy"                   "tgravityaccstdz"                  
[13] "tbodyaccjerkmeanx"                 "tbodyaccjerkmeany"                
[15] "tbodyaccjerkmeanz"                 "tbodyaccjerkstdx"                 
[17] "tbodyaccjerkstdy"                  "tbodyaccjerkstdz"                 
[19] "tbodygyromeanx"                    "tbodygyromeany"                   
[21] "tbodygyromeanz"                    "tbodygyrostdx"                    
[23] "tbodygyrostdy"                     "tbodygyrostdz"                    
[25] "tbodygyrojerkmeanx"                "tbodygyrojerkmeany"               
[27] "tbodygyrojerkmeanz"                "tbodygyrojerkstdx"                
[29] "tbodygyrojerkstdy"                 "tbodygyrojerkstdz"                
[31] "tbodyaccmagmean"                   "tbodyaccmagstd"                   
[33] "tgravityaccmagmean"                "tgravityaccmagstd"                
[35] "tbodyaccjerkmagmean"               "tbodyaccjerkmagstd"               
[37] "tbodygyromagmean"                  "tbodygyromagstd"                  
[39] "tbodygyrojerkmagmean"              "tbodygyrojerkmagstd"              
[41] "fbodyaccmeanx"                     "fbodyaccmeany"                    
[43] "fbodyaccmeanz"                     "fbodyaccstdx"                     
[45] "fbodyaccstdy"                      "fbodyaccstdz"                     
[47] "fbodyaccmeanfreqx"                 "fbodyaccmeanfreqy"                
[49] "fbodyaccmeanfreqz"                 "fbodyaccjerkmeanx"                
[51] "fbodyaccjerkmeany"                 "fbodyaccjerkmeanz"                
[53] "fbodyaccjerkstdx"                  "fbodyaccjerkstdy"                 
[55] "fbodyaccjerkstdz"                  "fbodyaccjerkmeanfreqx"            
[57] "fbodyaccjerkmeanfreqy"             "fbodyaccjerkmeanfreqz"            
[59] "fbodygyromeanx"                    "fbodygyromeany"                   
[61] "fbodygyromeanz"                    "fbodygyrostdx"                    
[63] "fbodygyrostdy"                     "fbodygyrostdz"                    
[65] "fbodygyromeanfreqx"                "fbodygyromeanfreqy"               
[67] "fbodygyromeanfreqz"                "fbodyaccmagmean"                  
[69] "fbodyaccmagstd"                    "fbodyaccmagmeanfreq"              
[71] "fbodybodyaccjerkmagmean"           "fbodybodyaccjerkmagstd"           
[73] "fbodybodyaccjerkmagmeanfreq"       "fbodybodygyromagmean"             
[75] "fbodybodygyromagstd"               "fbodybodygyromagmeanfreq"         
[77] "fbodybodygyrojerkmagmean"          "fbodybodygyrojerkmagstd"          
[79] "fbodybodygyrojerkmagmeanfreq"      "angletbodyaccmeangravity"         
[81] "angletbodyaccjerkmeangravitymean"  "angletbodygyromeangravitymean"    
[83] "angletbodygyrojerkmeangravitymean" "anglexgravitymean"                
[85] "angleygravitymean"                 "anglezgravitymean"   


## Mean
The mean of the measurements.
