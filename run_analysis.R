# Coursera Getting and cleaning data course assignment

## Step 1 - Reading files
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

features <- read.table('./data/UCI HAR Dataset/features.txt')

activity_labels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

## Step 2 - Assign column names:
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activity_id"
colnames(subject_train) <- "subject_id"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activity_id"
colnames(subject_test) <- "subject_id"

colnames(activity_labels) <- c('activity_id','activity_type')

## Step 3 - Merging the data from "train" and "test" into one dataset
merge_train <- cbind(y_train, subject_train, x_train)
merge_test <- cbind(y_test, subject_test, x_test)
merge_all <- rbind(merge_train, merge_test)

## Step 4 - Extracting and keeping only the mean and std.dev. for each measurement
column_names <- colnames(merge_all)
mean_stddev <- (grepl("activity_id" , column_names) | 
                grepl("subject_id" , column_names) | 
                grepl("mean.." , column_names) | 
                grepl("std.." , column_names) 
                )
filtered_mean_stddev <- merge_all[ , mean_stddev == TRUE]

## Step 5 - Creating descriptive names for activities and making some names more descriptive in dataset
activity_names <- merge(filtered_mean_stddev, activity_labels, by='activity_id', all.x=TRUE)

names(filtered_mean_stddev) <- gsub("^t", "time", names(filtered_mean_stddev))
names(filtered_mean_stddev) <- gsub("^f", "freq", names(filtered_mean_stddev))


## Step 6 - Creating new, tidy data set, with average of each variable for each activity and each subject
tidy_new_dataset <- aggregate(. ~subject_id + activity_id, activity_names, mean)
tidy_new_dataset <- tidy_new_dataset[order(tidy_new_dataset$subject_id, tidy_new_dataset$activity_id),]

## Step 7 - Export of data without row names from tidy_new_dataset to txt-file
write.table(tidy_new_dataset, "Tidy_dataset.txt", row.name=FALSE)
