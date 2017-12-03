setwd("D:/r/coursera/gettingcleandata")

#1
#combine the data
trainx <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainy <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainsubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
testx <- read.table("./UCI HAR Dataset/test/X_test.txt")
testy <- read.table("./UCI HAR Dataset/test/y_test.txt")
testsubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")

train <- cbind(trainsubject, trainy, trainx)
test <- cbind(testsubject, testy, testx)
dat <- rbind(train, test)

#2
#find the mean and std, select the feature position from the featurename, and then apply to the original data
feature<- read.table("./UCI HAR Dataset/features.txt")
feature2 <- grep(("mean\\(\\)|std\\(\\)"), feature[, 2])
featurename<-feature[feature2,2]
dat2 <- dat[, c(1, 2, feature2+2)] 
colnames(dat2)<-c("subject","activity",paste(featurename))

#3
#replace the activity with name
activity<- read.table("./UCI HAR Dataset/activity_labels.txt")
view(activity)
dat2[,2][dat2[,2]== 1] <- "Walking"
dat2[,2][dat2[,2] == 2] <- "Walking Upstairs"
dat2[,2][dat2[,2] == 3] <- "Walking Downstairs"
dat2[,2][dat2[,2] == 4] <- "Sitting"
dat2[,2][dat2[,2] == 5] <- "Standing"
dat2[,2][dat2[,2] == 6] <- "Laying"

#4
#redo the step2, change the short word into their full name, rewrite the featurename, and apply it to the colname 
featurename<-feature[feature2,2]
dat2 <- dat[, c(1, 2, feature2+2)] 
featurename2<-featurename
featurename2<-gsub("Acc", "Accelerator", featurename2)
featurename2<-gsub("Mag", "Magnitude", featurename2)
featurename2<-gsub("Gyro", "Gyroscope", featurename2)
featurename2<-gsub("^t", "time", featurename2)
featurename2<-gsub("^f", "frequency", featurename2)

colnames(dat2)<-c("subject","activity",paste(featurename2))


#5
#aggregate each col by the two listed variable, and then export it to clean txt file
cleandata<-with(dat2,aggregate(dat2, by = list(subject,activity), mean))

write.table(cleandata, file = "cleandata.txt", row.names = FALSE)

