# Getting-and-Cleaning-Data-Course-Project
## How the script works
## 1 bind the rows of subjects and activities in train and test data

## 2 Merges the training and the test sets to create one data set: dat
  ##2.1 finding out the index in features calculating the mean and std values 
  
  ##2.2 assigning the index to dat columns
  
  ##2.3 joining the columns according to the measurement targets
  
  ##2.4 rename the columns of 33 the features (mean and std*66)
  
## 3 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  ##3.1 bind the columns of the subject, activity and the mean and std selected for the 33 features cbind(subject,activity,dat)
  
  ##3.2 rename all elements in activity column to the actual activity name
  
  ##3.3 using dplyr to group the result according to subject n activity, and summarise all the columns of data using summarize_all() 

## Code book
num of subject=30
    activity_labels: 
1            1 WALKING
2   2 WALKING_UPSTAIRS
3 3 WALKING_DOWNSTAIRS
4            4 SITTING
5           5 STANDING
6             6 LAYING

num of features= 66  
generated data total colums = 66*2 (mean and std for each feature)
example of the col names' arrangement (first 2 features):
mean_tBodyAcc-X	mean_tBodyAcc-Y	mean_tBodyAcc-Z	std_tBodyAcc-X	std_tBodyAcc-Y	std_tBodyAcc-Z 
mean_tGravityAcc-X	mean_tGravityAcc-Y	mean_tGravityAcc-Z	std_tGravityAcc-X	std_tGravityAcc-Y	std_tGravityAcc-Z





