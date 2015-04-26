library(dplyr)
library(plyr)
setwd("/media/fabric/6b25fcc5-b9e8-4e2d-b662-218d7324bdd4/courserapartial/datascience/getandclean/assgn1")

traindata<- read.table("UCI HAR Dataset/train/X_train.txt")
testdata<- read.table("UCI HAR Dataset/test/X_test.txt")
mergeddata = rbind(traindata, testdata)

trainlabels<- read.table("UCI HAR Dataset/train/y_train.txt")
testlabels<- read.table("UCI HAR Dataset/test/y_test.txt")
mergedlabels= rbind(trainlabels, testlabels)
activitylabels<- read.table("UCI HAR Dataset/activity_labels.txt")

trainsubject<- read.table("UCI HAR Dataset/train/subject_train.txt")
testsubject<- read.table("UCI HAR Dataset/test/subject_test.txt")
mergedsubject <- rbind(trainsubject, testsubject)

mergelabelsandmeaning <- merge(mergedlabels, activitylabels)

features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
features$V2 <- tolower(features$V2)
features$V2 <- sapply(features$V2, function(x) gsub("-|\\(|\\)|,", "",x))


meanandstddata <- select(mergeddata, grep("mean|std", features$V2))
colnames(meanandstddata) <- features$V2[grep("mean|std", features$V2)]
meanandstddata <- cbind(mergelabelsandmeaning$V2 ,meanandstddata)
meanandstddata <- cbind(mergedsubject, meanandstddata)

colnames(meanandstddata)[1] <-"subject"
colnames(meanandstddata)[2] <-"activity"


#stage 5  
tidy_data <- tbl_df(meanandstddata) %>%
  group_by(subject, activity) %>%
  summarise_each(funs(mean)) %>%
  gather(measurement, mean, -activity, -subject)

# Save the data into the file
write.table(tidy_data, file="tidy_data.txt", row.name=FALSE)

