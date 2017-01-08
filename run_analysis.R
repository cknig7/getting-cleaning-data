## Coursera :: Getting Data :: Peer-reviewed Project

## Project instructions: Create one R script called run_analysis.R that does the following:
  ## 1 Merges the training and the test sets to create one data set.
  ## 2 Extracts only the measurements on the mean and standard deviation for each measurement.
  ## 3 Uses descriptive activity names to name the activities in the data set
  ## 4 Appropriately labels the data set with descriptive variable names.
  ## 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


if (!require("dplyr")) {
  install.packages("dplyr")
}
require("dplyr")


## Set your working directory to the location of your unzipped files using setwd()

## Step 1: Merge the training and the test sets to create one data set.

# Read data into data frames and assign labels
features <- read.table("features.txt")
X_test <- read.table("./test/X_test.txt", sep="",col.names=features$V2)
y_test <- read.table("./test/y_test.txt", sep="",col.names="Activity_ID")
X_train <- read.table("./train/X_train.txt", sep="",col.names=features$V2)
y_train <- read.table("./train/y_train.txt", sep="",col.names="Activity_ID")
subject_test <- read.table("./test/subject_test.txt", sep="",col.names="Subject")
subject_train <- read.table("./train/subject_train.txt", sep="",col.names="Subject")
activity_labels <- read.table("activity_labels.txt")

# Associate subject ID with data elements
test_matched <- cbind(y_test,X_test)
test_matched <- cbind(subject_test,test_matched)
train_matched <- cbind(y_train,X_train)
train_matched <- cbind(subject_train,train_matched)

# Merge test and train data sets
merged <- merge(test_matched,train_matched,all=TRUE)


## Step 2: Extract only the measurements on the mean and standard deviation for each measurement.

merged_meanstd <- merged[, grepl("Activity_ID|Subject|std|mean", names(merged))]


## Step 3: Assign descriptive activity names to name the activities in the data set

names(activity_labels) = c("Activity_ID", "Activity_Label")

merged_meanstd <- left_join(merged_meanstd, activity_labels, by= "Activity_ID")


## Step 4: Appropriately label the data set with descriptive variable names
  # descriptive names from features.txt were assigned in Step 1


## Step 5: From the data set in step 4, create a second, independent tidy data set with the average of each variable
    # for each activity and each subject

melted <- melt(merged_meanstd, id=c("Subject","Activity_Label"))
tidy <- dcast(melted, Subject+Activity_Label ~ variable, mean)


# Output the tidy data set as a .txt file
write.table(tidy, "tidy.txt", row.names=FALSE)
