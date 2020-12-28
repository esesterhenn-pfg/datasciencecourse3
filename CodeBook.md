The run_analysis.R file contains a series of transformations that load, unload, and transform the UCI HAR Dataset. The following transformations are performed on the dataset:

**Download the dataset and select files**
1. fileURL
2. fileDestination
3. features
4. activities
5. subjectTrain
6. xTrain
7. yTrain
8. subjectTest
9. xTest
10. yTest

**Merge training and testing sets into one dataset**
1. subject
2. xData
3. yData
4. mergedData

**Select the mean and standard deviation for the measurements**
1. tidyData

**Uses descriptive activity names to name the activities in the data set**
1. tidyData$activity_code

**Appropriately labels the data set with descriptive variable names**
Renames the columns as follows:

**From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject**
1. summaryData
