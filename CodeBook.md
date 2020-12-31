The run_analysis.R file contains a series of transformations that load, unload, and transform the UCI HAR Dataset. The following transformations are performed on the dataset:

**Download the dataset and select files**
1. fileURL - The URL for the .zip provided in Coursera to be downloaded
2. fileDestination - The filepath destination for the .zip file
3. features - The gyroscope and accelerometer 3-axis (X, Y, and Z) signals
4. activities - The activities that was performed when taking the feature measurement
5. subjectTrain - The identifiers for the 21 subjects that are used for the training data
6. xTrain - The measurement values for the training data subjects
7. yTrain - The activity codes for the training data
8. subjectTest - The identifiers for the 9 subjects that are used for the testing data
9. xTest - The measurement values for the testing data subjects
10. yTest - The activity codes for the testings data

**Merge training and testing sets into one dataset**
1. subject - A table formed by merging the subjectTrain and subjectTest datasets together contain all 30 subjects
2. xData - A table formed by merging the xTrain and xTest datasets together
3. yData - A table formed by merging the yTrain and yTest datasets together
4. mergedData - A table formed by joining the subject, xData, and yData datasets together

**Select the mean and standard deviation for the measurements**
1. tidyData - A table that contains the subject, activity_code, and all measurements regarding the mean and standard deviation

**Uses descriptive activity names to name the activities in the data set**
1. tidyData$activity_code = activities[tidyData$activity_code,"activity"] - Recreates the activity_code column to contain the name of the activity instead of the code

**Appropriately labels the data set with descriptive variable names**
1. Renames the word **subject** in the 1st column as: **Subject**
2. Renames the word **activity_code** in the 2nd column as: **Activity**
3. Renames the word **angle** in columns 3 through 88 as: **Angle**
4. Renames the word **gravity** in columns 3 through 88 as: **Gravity**
5. Renames the word **Acc** in columns 3 through 88 as: **Accelerometer**
6. Renames the word **Gyro** in columns 3 through 88 as: **Gyroscope**
7. Renames the word **BodyBody** in columns 3 through 88 as: **Body**
8. Renames the word **Mag** in columns 3 through 88 as: **Magnitude**
9. Renames the word **-mean()** in columns 3 through 88 as: **Mean**
10. Renames the word **-std()** in columns 3 through 88 as: **Std**
11. Renames the word **-freq()** in columns 3 through 88 as: **Frequency**
13. Renames the word **f** at the beginning of the column name in columns 3 through 88 as: **Frequency**
12. Renames the word **t** at the beginning of the column name in columns 3 through 88 as: **Time**

**From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject**
1. summaryData - Table containing the mean for each measurement partitioned by Subject and Activity
