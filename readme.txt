
For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'readme.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'X_train.txt': Training set.

- 'y_train.txt': Training labels.

- 'X_test.txt': Test set.

- 'y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

How the data fit together
==========================
The data set is like a bunch of lego bricks

1. On top is the features table with 561 observations and 2 variables. These 561 observations (rows) contain practically the variables names (colnames) for the X_test table which has 2947 obs and 561 variables

2. The same story works for features table and x_train table.

3. These two tables are to combine to get one unit with descriptive colnames and observations. One for X-test and one for x_train

4. The subject_test table with 2947 obs and 1 var contains the ids of the test persons who carried out the experiment. Each observation of the X_test table belongs to one id (observation) of the subject_test table to know which measurement belongs to which person.

5. The y_test table with 2947 obs and 1 var contains the activity ids. Each measurement in x_test corresponds to one activity id in y_test.

6. The 6 obs and 2 vars of the activity_labels table correspond to the y_test table to give the ids a readable name

These information is visualized in the ER.pdf to make the relations clear

How it works
============

# read the files
# change colname of subject_test and subject_train into "subject"
# change colname of y_test and y_train into "activity_id"
# change colnames of activity_labels into "activity_id" and "activity"
# combine x-test, subject_test and y_test
# combine x-train, subject_train and y_train
# merge test and train data by adding rows to get one dataset for test and training data
# get rows from features to rename colnames in dataframe df_test_train
# add the colnames for the last two cols as "subject" and "activity_id"
# change colnames from V.. into readable colnames
# look for colnames in f_names containing "mean()" or "std()" or "subject" or "activity_id"
# get the required cols with data
# merge df_m_std and activity_labels to add the activities to the matching activity ids
# drop col activity_id in mean_std
# calculate average for each variable for each activity and each subject
# store tidy_data_set to text-file


