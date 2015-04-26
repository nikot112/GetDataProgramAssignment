# Data and Transformations to the Data
The run_analysis.R file contains the R programming code. The data transformations that took place are:
* After all source files are read, the x_files, y_files and subject_files are created by combining each respective training and testing file
* Only columns containing the mean and standard deviation are extracted and then given corrected names using the features.txt file
* Then the resulting data labels are updated using the respective lavels from the activity_labels.txt file
* The names of the columns are then re-named with the y_files variable called "activity" and the subject_files variable called "subject"
* Lastly, a new tidy data set is made containing the average measures for each subject and activity type called averages_data.txt

# Variables List
* x_train, y_train, x_test, y_test, subject_train and subject_test are the downloaded source files
* x_files, y_files, and subject_files are the merged files of the training and testing data
* The features variable contains the corrected names to the x_files variable
* The mean_std_data variable is a vector with the column names that the features variable is applied to that is used to extract the desired data
* activities is similar to the features variable except it is applied to the y_files variable
* all_data is the combined merge of the x_files, y_files and subject _files variables
* tidy_data is the output text file that contains the mean measurements for each activity and each subject

# Source Data
The source data can be found in the URL below: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Supplementary Data
Supplementary data of the project can be found at the link below: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
