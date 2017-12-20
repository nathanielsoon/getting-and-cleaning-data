# Codebook for run_analysis.R

## Step 0. Download file and unzip  
Downloads zip file and unzip datasets into a working directory.

## Step 1. Read in tables of activity labels and features
Creates two data frames, actlabels and features, that contain the activity labels and the feature labels respectively.

## Step 2. Create training data set
Reads in the training data and names the columns using the features data frame.  
Merges the training activity labels read in from ./train/y_train.txt as well as the activity labels.  
Creates a dataset containing the training data with correct variable names and activity descriptions.  

## Step 3. Create test data set
Reads in the test data and names the columns using the features data frame.  
Merges the test activity labels read in from ./test/y_test.txt as well as the activity labels.  
Creates a dataset containing the test data with correct variable names and activity descriptions.  

## Step 4. Merge(join) training and test dataset
Use rbind() to combine both the test and training datasets

## Step 5. Extracts only the measurements on the mean and standard deviation
Extract only the variables containing the mean and standard deviation.  
Simplify the variable names but removing excess periods.  
Re-order subject and activity description columns to the left-hand most column.  
Convert subject to a factor variable.

## Step 6. Create dataset with means of variable for each subject and each activity
Use the aggregate function to create dataset containing the averages of each subject and each activity.  
We will need to define the subject and activity variables as a list to be used as an argument in the aggregate function.  
Use write.table() to save the final dataset as a text file (averages.txt)

## Variables in averages.txt:  
1. Identifiers:  
* "subject": Factor variables labelled 1 to 30 for each subject
* "activitydesc": Factor variables of each activity "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"

2. Measurements:  
The variables below are all numeric and units follow the original dataset. The variables are the averages of each measurement for each subject and each activity.  
* "tBodyAcc.mean.X"  
* "tBodyAcc.mean.Y"  
* "tBodyAcc.mean.Z"  
* "tBodyAcc.std.X"  
* "tBodyAcc.std.Y"  
* "tBodyAcc.std.Z"  
* "tGravityAcc.mean.X"  
* "tGravityAcc.mean.Y"  
* "tGravityAcc.mean.Z"  
* "tGravityAcc.std.X"  
* "tGravityAcc.std.Y"  
* "tGravityAcc.std.Z"  
* "tBodyAccJerk.mean.X"  
* "tBodyAccJerk.mean.Y"  
* "tBodyAccJerk.mean.Z"  
* "tBodyAccJerk.std.X"  
* "tBodyAccJerk.std.Y"  
* "tBodyAccJerk.std.Z"  
* "tBodyGyro.mean.X"  
* "tBodyGyro.mean.Y"  
* "tBodyGyro.mean.Z"  
* "tBodyGyro.std.X"  
* "tBodyGyro.std.Y"  
* "tBodyGyro.std.Z"  
* "tBodyGyroJerk.mean.X"  
* "tBodyGyroJerk.mean.Y"  
* "tBodyGyroJerk.mean.Z"  
* "tBodyGyroJerk.std.X"  
* "tBodyGyroJerk.std.Y"  
* "tBodyGyroJerk.std.Z"  
* "tBodyAccMag.mean"  
* "tBodyAccMag.std"  
* "tGravityAccMag.mean"  
* "tGravityAccMag.std"  
* "tBodyAccJerkMag.mean"  
* "tBodyAccJerkMag.std"  
* "tBodyGyroMag.mean"  
* "tBodyGyroMag.std"  
* "tBodyGyroJerkMag.mean"  
* "tBodyGyroJerkMag.std"  
* "fBodyAcc.mean.X"  
* "fBodyAcc.mean.Y"  
* "fBodyAcc.mean.Z"  
* "fBodyAcc.std.X"  
* "fBodyAcc.std.Y"  
* "fBodyAcc.std.Z"  
* "fBodyAccJerk.mean.X"  
* "fBodyAccJerk.mean.Y"  
* "fBodyAccJerk.mean.Z"  
* "fBodyAccJerk.std.X"  
* "fBodyAccJerk.std.Y"  
* "fBodyAccJerk.std.Z"  
* "fBodyGyro.mean.X"  
* "fBodyGyro.mean.Y"  
* "fBodyGyro.mean.Z"  
* "fBodyGyro.std.X"  
* "fBodyGyro.std.Y"  
* "fBodyGyro.std.Z"  
* "fBodyAccMag.mean"  
* "fBodyAccMag.std"  
* "fBodyBodyAccJerkMag.mean"  
* "fBodyBodyAccJerkMag.std"  
* "fBodyBodyGyroMag.mean"  
* "fBodyBodyGyroMag.std"  
* "fBodyBodyGyroJerkMag.mean"  
* "fBodyBodyGyroJerkMag.std"  
