# 0. Download file and unzip
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile="dataset.zip")
unzip("dataset.zip")

rm(list=ls())

# 1. Read in tables of activity labels and features 
actlabels=read.table("./UCI HAR Dataset/activity_labels.txt",col.names=c("V1","activitydesc"))
features=read.table("./UCI HAR Dataset/features.txt",col.names=c("V1","varnames"),colClasses = c("factor","character"))

# 2. Create training data set 
xtrain=read.table("./UCI HAR Dataset/train/X_train.txt",col.names=features$varnames)
ytrain=read.table("./UCI HAR Dataset/train/y_train.txt",col.names="activitylabel")
trainsubject=read.table("./UCI HAR Dataset/train/subject_train.txt",col.names="subject")
train=merge(data.frame(trainsubject,ytrain,xtrain),actlabels,by.x="activitylabel",by.y="V1",sort=F)

# 3. Create test data set 
xtest=read.table("./UCI HAR Dataset/test/X_test.txt",col.names=features$varnames)
ytest=read.table("./UCI HAR Dataset/test/y_test.txt",col.names="activitylabel")
testsubject=read.table("./UCI HAR Dataset/test/subject_test.txt",col.names="subject")
test=merge(data.frame(testsubject,ytest,xtest),actlabels,by.x="activitylabel",by.y="V1",sort=F)

# 4. Join(set) training and test dataset 
full=rbind(train,test)

# 5. Extracts only the measurements on the mean and standard deviation
keepcols=grep("([Mm][Ee][Aa][Nn]|[Ss][Tt][Dd]|subject|activitydesc)",names(full))   # keep only required columns 
fullkeep=full[,c(keepcols)]
dropcols=grep("angle|meanFreq",names(fullkeep))
fullkeep=fullkeep[,-c(dropcols)]
names(fullkeep)<-gsub("\\.\\.\\.","\\.",gsub("\\.\\.","",names(fullkeep)))  # simplify columns 
retaincols=c("subject","activitydesc")
fullkeep<-fullkeep[,c(retaincols,setdiff(names(fullkeep),retaincols))]     # order subject and activity columns to the left-most
fullkeep$subject<-as.factor(fullkeep$subject)

# 6. Create dataset with means of variable for each subject and each activity
fullkeep.mean<-aggregate(fullkeep[,sapply(fullkeep,is.numeric)],list(subject=fullkeep$subject,activitydesc=fullkeep$activitydesc),mean)
write.table(fullkeep.mean,
            file="C:/Users/Nathaniel/Desktop/Coursera R course/Getting and Cleaning Data assignment/Week 4 Programming Assignment/averages.txt",
            row.names=F)

