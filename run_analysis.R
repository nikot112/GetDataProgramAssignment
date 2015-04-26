## Set the working directory to read in the training files
setwd("~/Desktop/UCI HAR Dataset/train")

## Read in the training files
x_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")

## Read in the testing files
x_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")

## Combine the x, y, and subject files
x_files <- rbind(x_train, x_test)
y_files <- rbind(y_train, y_test)
subject_files <- rbind(subject_train, subject_test)

## Read in the features file
features_file <- read.table("features.txt")

## Get just the mean and st. dev. columns by searching for them in the column names
mean_std_data <- grep("-(mean|std)\\(\\)", features_file[,2])

## Subset the data to only the mean and st. dev. columns
x_files <- x_files[, mean_std_data]

## Re-name column names to correct
names(x_files) <- features_file[mean_std_data, 2]

## Read in the activity file
activities <- read.table("activity_labels.txt")

## Use the activity file to insert activity labels in the y data file
y_files[,1] <- activities[y_files[,1], 2]

## Re-name the column name to activity and subject
names(y_files) <- "activity"
names(subject_files) <- "subject"

## Combine all the separate data sets into 1 data set (using cbind and not the merge function)
all_data <- cbind(x_files, y_files, subject_files)

## Get the average of each variable for each activity and each subject for part 5
library(plyr)
tidy_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

## Write tidy data set to a table using write.table() as specified in submission directions
write.table(tidy_data, "tidy_data.txt", row.name=FALSE)