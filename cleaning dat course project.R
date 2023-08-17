readme<- read.table("D:\\r git projects\\cleaningdata\\UCI HAR Dataset\\README.txt",fill=T,sep='\t')

features_info<-read.table("D:\\r git projects\\cleaningdata\\UCI HAR Dataset\\features_info.txt",fill=T,sep="\t")

features<- read.table("D:\\r git projects\\cleaningdata\\UCI HAR Dataset\\features.txt",fill=T,sep='\t')

activity_labels<- read.table("D:\\r git projects\\cleaningdata\\UCI HAR Dataset\\activity_labels.txt",fill=T,sep='\t')


##--------------loading train dat
train<- read.table("D:\\r git projects\\cleaningdata\\UCI HAR Dataset\\train\\X_train.txt")

train_labels<-read.table("D:\\r git projects\\cleaningdata\\UCI HAR Dataset\\train\\y_train.txt",fill=T)

train_subject<-read.table("D:\\r git projects\\cleaningdata\\UCI HAR Dataset\\train\\subject_train.txt",fill=T)

##merge the subjects, labels, and 561 features' outputs in train dat
train_dat<-cbind(train_subject,train_labels,train)

colnames(train_dat)[1]='subject'
colnames(train_dat)[2]='labels'

##--------------loading test dat
test<-read.table()