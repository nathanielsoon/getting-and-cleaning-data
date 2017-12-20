download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile="dataset.zip")
unzip("dataset.zip")

rm(list=ls())

actlabels=read.table("./UCI HAR Dataset/activity_labels.txt",col.names=c("V1","activitydesc"))
features=read.table("./UCI HAR Dataset/features.txt",col.names=c("V1","varnames"),colClasses = c("factor","character"))

# training data set #
xtrain=read.table("./UCI HAR Dataset/train/X_train.txt",col.names=features$varnames)
ytrain=read.table("./UCI HAR Dataset/train/y_train.txt",col.names="activitylabel")
trainsubject=read.table("./UCI HAR Dataset/train/subject_train.txt",col.names="subject")
train=merge(data.frame(trainsubject,ytrain,xtrain),actlabels,by.x="activitylabel",by.y="V1",sort=F)

# test data set #
xtest=read.table("./UCI HAR Dataset/test/X_test.txt",col.names=features$varnames)
ytest=read.table("./UCI HAR Dataset/test/y_test.txt",col.names="activitylabel")
testsubject=read.table("./UCI HAR Dataset/test/subject_test.txt",col.names="subject")
test=merge(data.frame(testsubject,ytest,xtest),actlabels,by.x="activitylabel",by.y="V1",sort=F)

full=rbind(train,test)

# keep only required columns #
keepcols=grep("([Mm][Ee][Aa][Nn]|[Ss][Tt][Dd]|subject|activitydesc)",names(full))
fullkeep=full[,c(keepcols)]
dropcols=grep("angle|meanFreq",names(fullkeep))
fullkeep=fullkeep[,-c(dropcols)]
names(fullkeep)<-gsub("\\.\\.\\.","\\.",gsub("\\.\\.","",names(fullkeep)))
fullkeep$grp<-paste(fullkeep$subject,fullkeep$activitydesc,sep=" ")
retaincols=c("subject","activitydesc","grp")
fullkeep<-fullkeep[,c("subject","activitydesc",setdiff(names(fullkeep),retaincols))]
fullkeep$subject<-as.factor(fullkeep$subject)

fullkeep.mean<-aggregate(fullkeep[,sapply(fullkeep,is.numeric)],list(subject=fullkeep$subject,activitydesc=fullkeep$activitydesc),mean)
write.table(fullkeep.mean,
            file="C:/Users/NathanielSOON/Desktop/Coursera Data science/Getting and cleaning data/Week 4 Programming Assignment/tidydata.txt",
            row.names=F)
