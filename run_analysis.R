setwd("D:\\Coursera\\course 3\\UCI HAR Dataset")
################################################################################
# STEP1: Merge the training and the test sets to create one data set
################################################################################

# read the X_train file from the train directory 
inputDataXTrn <- read.delim("train\\X_train.txt", header=F, sep='', fill=T)
# read the y_train file from the train directory 
inputDatayTrn <- read.delim("train\\y_train.txt", header=F, sep='', fill=T)
# read the subject file from the train directory 
inputDataSubTrn <- read.delim("train\\subject_train.txt", header=F, sep='', fill=T)


# read the X_test file from the test directory
inputDataXTst <- read.delim("test\\X_test.txt", header=F, sep='', fill=T)
# read the y_test file from the test directory
inputDatayTst <- read.delim("test\\y_test.txt", header=F, sep='', fill=T)
# read the subject file from the train directory 
inputDataSubTst <- read.delim("test\\subject_test.txt", header=F, sep='', fill=T)

# bind the files together into a single dataset
combinedDataX <- rbind(inputDataXTrn, inputDataXTst)
combinedDatay <- rbind(inputDatayTrn, inputDatayTst)
combinedSubjectData <- rbind(inputDataSubTrn, inputDataSubTst)
combinedData <- cbind(combinedSubjectData, combinedDatay, combinedDataX)
colnames(combinedData)[1:2] <- c("Subject", "ActivityCode")

################################################################################
# STEP2: Extracts only the measurements on the mean and standard deviation
################################################################################

# Read the features.txt file to find out columns that contain
# mean or standard deviation
features <- read.table("features.txt")
# Get indexes of all statements containing 'mean' and 'std'
indexM <- grep("mean", features$V2, ignore.case=T) 
indexS <- grep("std", features$V2, ignore.case=T)

# Get the column indexes of columns containing mean and std
colIndex <- features$V1[append(indexM, indexS)]
    
# Keep columns 1 and 2 since they contain the subject and activity info
# Keep columns defined by colIndex since they contain mean and std info
# The indexes are offset by  2 since the 'combinedData'created above contains 
# subject and activity info in the first two columns
combinedData <- combinedData[, c(1, 2, colIndex+2)]

################################################################################
# STEP3: Use descriptive activity names to name the activities in the data set
################################################################################

# Read the activity info data
activity <- read.table("activity_labels.txt")
# Assign meaningful names to the columns 
colnames(activity) <- c("ActivityCode", "Activity")

# merge the data sets so that activity gets added as a column to the combined dataset
combinedData <- merge(activity, combinedData, by.x="ActivityCode", by.y="ActivityCode", all.y=T)
# remove the 'ActivityCode' column
combinedData <- combinedData[, -1]

################################################################################
# STEP4: Appropriately label the data set with descriptive variable names
################################################################################

# Since the number of variables is large, 88 to be precise,
# The names from the features.txt file would be used to name the variables
colnames(combinedData)[-(1:2)] <- as.character(features$V2[colIndex])

################################################################################
# STEP5: Create an independent tidy data set with the average of each variable
# for each activity and each subject
################################################################################

library(reshape2)
# melt the dataset
moltenData <- melt(combinedData, id=colnames(combinedData)[(1:2)],
                   measure.vars=colnames(combinedData)[-(1:2)])
# Summarize the melted dataset on the combination of 'Activity' and 'Subject'
summary <- dcast(moltenData, Activity + Subject ~ variable, mean)
write.table(summary, file="finalTidyData.txt", row.name=F)
