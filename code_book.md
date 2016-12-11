
#Code book for Assignment in Coursera's Getting and Cleaning Data Course
##The purpose of this codebook is to give you a quick flavour of what the data that we are looking at is, how it works and how to use it. Welcome!

##Here is what you need to do to get up and running:
1. Download the source data from this link http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
2. Create a sub-folder _data_ in your R working directory, and put the downloaded zip file there
3. Either unzip it in Windows or paste the following statement into your R script: _unzip(zipfile="./data/Dataset.zip",exdir="./data")_
4. Run the script _run_analysis.R_ in your favorite R editor
5. The end result will be a file named _Tidy_Dataset.R_


##About the data
The source data is called the Human Activity Recognition Using Smartphones Data Set. Please follow this link for a full description:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##About the source files
*x_train, y_train, x_test, y_test, subject_train* and *subject_test* all have the data for the two groups "Test" and "Training".
*features* are the features applied to the above data, to make these descriptive of the features
*activity_labels*, finally, are the descriptions of each activity found in the "train"
and "test"-files.

##Summary of R script _run_analysis.R_
The script is split into seven disctinct steps:
* *Step 1:* Reading the files contained in the source data
  The files x_test.txt, y_test.txt, subject_test.txt will first be read.
  The files x_train.txt, y_train.txt, subject_train.txt will then be read.
  It is these files that will be merged into one dataset in a later step.
  Next, the files features.txt, and activity_labels.txt will be read.
* *Step 2:* This step will change the column names
* *Step 3:* Next, the script will merge the data from the "train" and "test" files
* *Step 4:* In this step, the _mean_ and _standard deviation_ measurements are
  extracted and kept, since these are the only ones of interest in this assignment
* *Step 5:* Creates some descriptive activity names and makes some names more descriptive
* *Step 6:* This step in the script will create the final new, tidy dataset, showing
  the average of each variable for each activity and each subject
  * *Step 7:* Exports the new dataset _tidy_new_dataset_ to the _Tidy_dataset.txt_ file
