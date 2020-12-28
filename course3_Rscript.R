library(dplyr)

fileURL = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
fileDestination = "DS_COURSE3_PROJECT.zip"
download.file(fileURL,fileDestination)
unzip(fileDestination)

#Get features and activities data from zip
features = read.table("UCI HAR Dataset/features.txt", col.names = c("n","feature"))
activities = read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("activity_code","activity"))

#Train data
subjectTrain = read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
xTrain = read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
yTrain = read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity_code")

#Test data
subjectTest = read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
xTest = read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
yTest = read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity_code")

#Merges the training and the test sets to create one data set
subject = rbind(subjectTrain,subjectTest)
xData = rbind(xTrain, xTest)
yData = rbind(yTrain, yTest)
mergedData = cbind(subject,xData,yData)

#Extracts only the measurements on the mean and standard deviation for each measurement
tidyData = mergedData %>% select(subject, activity_code, contains("mean"),contains("std"))

#Uses descriptive activity names to name the activities in the data set
tidyData$activity_code = activities[tidyData$activity_code,"activity"]

#Appropriately labels the data set with descriptive variable names
names(tidyData)[1] = gsub("subject", "Subject",names(tidyData)[1])
names(tidyData)[2] = gsub("activity_code", "Activity",names(tidyData)[2])
names(tidyData)[3:88] = gsub("angle", "Angle",names(tidyData)[3:88])
names(tidyData)[3:88] = gsub("gravity", "Gravity",names(tidyData)[3:88])
names(tidyData)[3:88] = gsub("Acc", "Accelerometer",names(tidyData)[3:88])
names(tidyData)[3:88] = gsub("Gyro", "Gyroscope",names(tidyData)[3:88])
names(tidyData)[3:88] = gsub("BodyBody", "Body",names(tidyData)[3:88])
names(tidyData)[3:88] = gsub("Mag", "Magnitude",names(tidyData)[3:88])
names(tidyData)[3:88] = gsub("-mean()", "Mean",names(tidyData)[3:88])
names(tidyData)[3:88] = gsub("-std()", "STD",names(tidyData)[3:88])
names(tidyData)[3:88] = gsub("-freq()", "Frequency",names(tidyData)[3:88])
names(tidyData)[3:88] = gsub("^f", "Frequency",names(tidyData)[3:88])
names(tidyData)[3:88] = gsub("^t", "Time",names(tidyData)[3:88])


#Create a second, independent tidy data set, with the average of each variable for each activity and each subject
summaryData = tidyData %>% group_by(Subject, Activity) %>%
  summarize_all(list(mean))
write.table(summaryData, "summaryData.txt",row.name = FALSE)