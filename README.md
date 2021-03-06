# README - Getting and Cleaning Data
 
Data was obtained from here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A description of the “Human Activity Recognition Using Smartphones Data” from the data source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Course Project

The course project instructions were to create one R script called run_analysis.R that does the following:

	1.	Merges the training and the test sets to create one data set.
	2.	Extracts only the measurements on the mean and standard deviation for each measurement.
	3.	Uses descriptive activity names to name the activities in the data set
	4.	Appropriately labels the data set with descriptive activity names.
	5.	Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Reference the CodeBook file for details on the data set elements.

# How to process run_analysis.R:

	1.	Download and unzip the data
	2.	Set your R working directory to the directory of your unzipped data files
	3.	Run run_analysis.R, which outputs a file "tidy.csv" to your working directory
