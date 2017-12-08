# get-and-clean-data
this is the final project of the get-and-clean-data 

#the data required for this work comes from the link below:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#The goal is to prepare tidy data that can be used for later analysis.It contains 1) a tidy data set as described below, 2) a link to a Github repository with script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that I performed to clean up the data called CodeBook.md. 

#Here is the description for my work and the original dataset
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

#The r_analysis.R file does the following things:
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
The annotations in the file also described the procedures I took to process the data. Please see the notes in the code. 

#The CodeBook.md describes the variables, the data, and any work that were performed. It also listed the variable in my final dataset, please refer to the feature_info.txt in the original data set.

#The cleandata file is the final clean data I produced
