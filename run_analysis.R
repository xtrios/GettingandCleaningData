## Merges the training and the test sets to create one data set.

## Extracts only the measurements on the mean and standard deviation for each measurement. 

## Uses descriptive activity names to name the activities in the data set

## Appropriately labels the data set with descriptive variable names. 

## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity 
## and each subject.

## =======================================================

## load libraries 
library(plyr)

## set directories
dir<-getwd()
test_dir<-paste(dir,"/test",sep="")
train_dir<-paste(dir,"/train",sep="")

## load files
setwd(dir)
features<-read.table("features.txt")
activity_labels<-read.table("activity_labels.txt")
setwd(test_dir)
subject_test<-read.table("subject_test.txt")
X_test<-read.table("X_test.txt")
y_test<-read.table("y_test.txt")
setwd(train_dir)
subject_train<-read.table("subject_train.txt")
X_train<-read.table("X_train.txt")
y_train<-read.table("y_train.txt")


## Extracts only the measurements on the mean and standard deviation for each measurement.

## identify columns for means and standard deviation
feature_names<-features[,2]
meanstdcol<-c(grep("*mean*",feature_names),grep("*std*",feature_names))
## replace headers with names
names(X_train)<-names(X_test)<-feature_names
names(y_train)<-names(y_test)<-"Activity"
names(subject_train)<-names(subject_test)<-"Subject"
## extract columns with only mean and standard deviations
X_test_trunc<-X_test[,meanstdcol]
X_train_trunc<-X_train[,meanstdcol]

## combine data
X_testA<-cbind(X_test_trunc,y_test,subject_test)
X_trainA<-cbind(X_train_trunc,y_train,subject_train)
combined<-rbind(X_testA,X_trainA)

## Uses descriptive activity names to name the activities in the data set

## replace y-test/y-train labels with activities
activity<-as.vector(activity_labels[,2])
for (i in 1:length(activity))
{combined$Activity[combined$Activity==i]<-activity[i]}


## Appropriately labels the data set with descriptive variable names. 
cnames<-names(combined)
cnames1<-gsub("\\(\\)","",cnames)
cnames1<-gsub("fB","Freq_B",cnames1)
cnames1<-gsub("fG","Freq_G",cnames1)
cnames1<-gsub("tB","Time_B",cnames1)
cnames1<-gsub("tG","Time_G",cnames1)
cnames1<-gsub("mean","Mean",cnames1)
names(combined)<-cnames1

## Create an independent tidy data set with the average of each variable for each activity and each subject.
tidydata <- group_by(combined, Activity, Subject) %>% summarise_each(funs(mean))
## Export as table/text file
setwd(dir)
write.table(tidydata,"tidydata.txt")