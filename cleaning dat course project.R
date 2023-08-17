readme<- read.table("D:\\r git projects\\cleaningdata\\UCI HAR Dataset\\README.txt",fill=T,sep='\t')
features_info<-read.table("D:\\r git projects\\cleaningdata\\UCI HAR Dataset\\features_info.txt",fill=T,sep="\t")
features<- read.table("D:\\r git projects\\cleaningdata\\UCI HAR Dataset\\features.txt",fill=T,sep='\t')

activity_labels<- read.table("D:\\r git projects\\cleaningdata\\UCI HAR Dataset\\activity_labels.txt",fill=T,sep='\t')

subject_train<-read.table("D:\\r git projects\\cleaningdata\\UCI HAR Dataset\\train\\subject_train.txt")
activity_train<-read.table("D:\\r git projects\\cleaningdata\\UCI HAR Dataset\\train\\y_train.txt")

subject_test<-read.table("D:\\r git projects\\cleaningdata\\UCI HAR Dataset\\test\\subject_test.txt")
activity_test<-read.table("D:\\r git projects\\cleaningdata\\UCI HAR Dataset\\test\\y_test.txt")

##bind the rows of subjects and activities in train and test dat
subject<-rbind(subject_train,subject_test,colnames("subject"))
activity<-rbind(activity_train,activity_test,colnames('activity'))


##loading train dat
train<- read.table("D:\\r git projects\\cleaningdata\\UCI HAR Dataset\\train\\X_train.txt")

##loading test dat
test<-read.table("D:\\r git projects\\cleaningdata\\UCI HAR Dataset\\test\\X_test.txt")

##---------Merges the training and the test sets to create one data set.--------------------
dat<-rbind(train, test)

##--------Extracts only the measurements on the mean and standard deviation for each measurement---------

##finding out the index in features calculating the mean and std values
mean_index<-lapply(features,function(x)grep("mean[^Freq]",x))
mean_index_value<-lapply(features,function(x)grep("mean[^Freq]",x,value=T))

std_index<-lapply(features,function(x)grep("std",x))
std_index_value<-lapply(features,function(x)grep("std",x,value=T))

##assigning the index to dat columns
mean_columns<-dat[,mean_index[[1]]]
std_columns<-dat[,std_index[[1]]]

##joining the columns according to the measurement targets
dat_join<-cbind(mean_columns[,c(1,2,3)],std_columns[,c(1,2,3)],##tBodyAcc-XYZ
                mean_columns[,c(4,5,6)],std_columns[,c(4,5,6)],##tGravityAcc-XYZ
                mean_columns[,c(7,8,9)],std_columns[,c(7,8,9)],##tBodyAccJerk-XYZ
                mean_columns[,c(10,11,12)],std_columns[,c(10,11,12)],##tBodyGyro-XYZ
                mean_columns[,c(13,14,15)],std_columns[,c(13,14,15)],##tBodyGyroJerk-XYZ
                mean_columns[,16],std_columns[,16],##tBodyAccMag
                mean_columns[,17],std_columns[,17],##tGravityAccMag
                mean_columns[,18],std_columns[,18],##tBodyAccJerkMag
                mean_columns[,19],std_columns[,19],##tBodyGyroMag
                mean_columns[,20],std_columns[,20],##tBodyGyroJerkMag
                mean_columns[,c(21,22,23)],std_columns[,c(21,22,23)],##fBodyAcc-XYZ
                mean_columns[,c(24,25,26)],std_columns[,c(24,25,26)],##fBodyAccJerk-XYZ
                mean_columns[,c(27,28,29)],std_columns[,c(27,28,29)],##fBodyGyro-XYZ
                mean_columns[,30],std_columns[,30],##fBodyAccMag
                mean_columns[,31],std_columns[,31],##fBodyAccJerkMag
                mean_columns[,32],std_columns[,32],##fBodyGyroMag
                mean_columns[,33],std_columns[,33]##fBodyGyroJerkMag
)
##----------Uses descriptive activity names to name the activities in the data set---------

##rename the columns of 33 the features (mean and std*66)
library(data.table)
setnames(dat_join,old=c(names(dat_join)),
         new=c("mean_tBodyAcc-X","mean_tBodyAcc-Y","mean_tBodyAcc-Z",
               "std_tBodyAcc-X","std_tBodyAcc-Y","std_tBodyAcc-Z",
               
               "mean_tGravityAcc-X", "mean_tGravityAcc-Y", "mean_tGravityAcc-Z",
               "std_tGravityAcc-X", "std_tGravityAcc-Y", "std_tGravityAcc-Z",
               
               "mean_tBodyAccJerk-X","mean_tBodyAccJerk-Y","mean_tBodyAccJerk-Z",
               "std_tBodyAccJerk-X","std_tBodyAccJerk-Y","std_tBodyAccJerk-Z",
               
               "mean_tBodyGyro-X","mean_tBodyGyro-Y","mean_tBodyGyro-Z",
               "std_tBodyGyro-X","std_tBodyGyro-Y","std_tBodyGyro-Z",
               
               "mean_tBodyGyroJerk-X","mean_tBodyGyroJerk-Y","mean_tBodyGyroJerk-Z",
               "std_tBodyGyroJerk-X","std_tBodyGyroJerk-Y","std_tBodyGyroJerk-Z",
               
               "mean_tBodyAccMag",
               "std_tBodyAccMag",
               
               "mean_tGravityAccMag",
               "std_tGravityAccMag",
               
               "mean_tBodyAccJerkMag",
               "std_tBodyAccJerkMag",
               
               "mean_tBodyGyroMag",
               "std_tBodyGyroMag",
               
               "mean_tBodyGyroJerkMag",
               "std_tBodyGyroJerkMag",
               
               "mean_fBodyAcc-X","mean_fBodyAcc-Y","mean_fBodyAcc-Z",
               "std_fBodyAcc-X","std_fBodyAcc-Y","std_fBodyAcc-Z",
               
               "mean_fBodyAccJerk-X","mean_fBodyAccJerk-Y","mean_fBodyAccJerk-Z",
               "std_fBodyAccJerk-X","std_fBodyAccJerk-Y","std_fBodyAccJerk-Z",
               
               "mean_fBodyGyro-X","mean_fBodyGyro-Y","mean_fBodyGyro-Z",
               "std_fBodyGyro-X","std_fBodyGyro-Y","std_fBodyGyro-Z",
               
               "mean_fBodyAccMag",
               "std_fBodyAccMag",
               
               "mean_fBodyAccJerkMag",
               "std_fBodyAccJerkMag",
               
               "mean_fBodyGyroMag",
               "std_fBodyGyroMag",
               
               "mean_fBodyGyroJerkMag",
               "std_fBodyGyroJerkMag"
               
         ))

##From the data set in step 4, creates a second, 
##independent tidy data set with the average of each variable for
##each activity and each subject.----------------

##cbind the subject, activity and the mean and std selected for 33 features
result<-cbind(subject,activity,dat_join)
colnames(result)[1]='subject'
colnames(result)[2]='activity'

##rename all elements in activity column to the actual activity name
result$activity[result$activity=='1']<-'Walking'
result$activity[result$activity=='2']<-'Walking_Upstairs'
result$activity[result$activity=='3']<-'Walking_Downstairs'
result$activity[result$activity=='4']<-'Sitting'
result$activity[result$activity=='5']<-'Standing'
result$activity[result$activity=='6']<-'Laying'

##split result by subjects
library(dplyr)
result<-result%>%group_by(subject,activity)%>%summarise_all(list(mean))

openxlsx::write.xlsx(result,"D:\\r git projects\\cleaningdata\\cleaning dat project.xlsx")