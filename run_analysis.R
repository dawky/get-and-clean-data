setwd("D:/r/coursera/gettingcleandata")
library(dplyr)

#1
#combine the data,read the x_train,y_train data,subject_train data and combine them into train data, do the same work for the test data, and then put the data together
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
#find the mean and std, from the feature_info file, we know the "mean" and ¡°std" word appear in the variable name
#I firstly select the needed variable from the features.txt file, and find the position of these variables from the featurename(feature2), and then apply it to the original data
feature<- read.table("./UCI HAR Dataset/features.txt")
feature2 <- grep(("mean\\(\\)|std\\(\\)"), feature[, 2])
featurename<-feature[feature2,2]
dat2 <- dat[, c(1, 2, feature2+2)] 
colnames(dat2)<-c("subject","activity",paste(featurename))

#3
#change the activity number with name,view the activity name, find the number of each activity, and replace them
activity<- read.table("./UCI HAR Dataset/activity_labels.txt")
View(activity)
dat2[,2][dat2[,2]== 1] <- "Walking"
dat2[,2][dat2[,2] == 2] <- "Walking Upstairs"
dat2[,2][dat2[,2] == 3] <- "Walking Downstairs"
dat2[,2][dat2[,2] == 4] <- "Sitting"
dat2[,2][dat2[,2] == 5] <- "Standing"
dat2[,2][dat2[,2] == 6] <- "Laying"

#4
#redo the step2, change the short word into their full name, rewrite the featurename, and apply it to the colname 
#for example, from the feature_info.txt file, we know that Acc represent for Accelerator, Mag represent for Magnitude,and it's them same for "Gyro"and "Gyroscope","t"and "time","f"and "frequency"
#we change our featurename list, screen for the original word and replace it with full name, and apply it to the colname
featurename2<-featurename
featurename2<-gsub("Acc", "Accelerator", featurename2)
featurename2<-gsub("Mag", "Magnitude", featurename2)
featurename2<-gsub("Gyro", "Gyroscope", featurename2)
featurename2<-gsub("^t", "time", featurename2)
featurename2<-gsub("^f", "frequency", featurename2)

colnames(dat2)<-c("subject","activity",paste(featurename2))


#5
#aggregate each col by the two listed variable using group_by, and then export it to clean txt file

cleandata<-dat2%>%group_by(subject,activity)%>%summarise_each(funs(mean))

write.table(cleandata, file = "cleandata.txt", row.names = FALSE)

