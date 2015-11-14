library(dplyr)

# read the files
activity_labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")
subject_test <- read.table("subject_test.txt")
subject_train <- read.table("subject_train.txt")
x_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
x_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")

# change colname of subject_test and subject_train into "subject"
colnames(subject_test) <- c("subject")
colnames(subject_train) <- c("subject")

# change colname of y_test and y_train into "activity_id"
colnames(y_test) <- c("activity_id")
colnames(y_train) <- c("activity_id")

# change colnames of activity_labels into "activity_id" and "activity"
colnames(activity_labels) <- c("activity_id", "activity")

# combine x-test, subject_test and y_test
df_test <- bind_cols(x_test, subject_test, y_test)

# combine x-train, subject_train and y_train
df_train <- bind_cols(x_train, subject_train, y_train)

# merge test and train data by adding rows to get one dataset for test and training data
df_test_train <- bind_rows(df_test, df_train)

# get rows from features to rename colnames in dataframe df_test_train
f_names <- as.character(features$V2)

# add the colnames for the last two cols as "subject" and "activity_id"
f_names <- c(f_names, "subject", "activity_id")

# change colnames from V.. into readable colnames
names(df_test_train) <- f_names

# look for colnames in f_names containing "mean()" or "std()" or "subject" or "activity_id"
y <- grepl("mean()|std()|subject|activity_id",f_names)

# get the required cols with data
df_m_std <- df_test_train[y]

# merge df_m_std and activity_labels to add the activities to the matching activity ids
mean_std <- merge(df_m_std, activity_labels, by = "activity_id", x.all = TRUE, sort = FALSE)

# drop col activity_id in mean_std
mean_std$activity_id <- NULL

# calculate average for each variable for each activity and each subject 
tidy_data_set <- aggregate(df_m_std, by=list(df_m_std$activity_id, df_m_std$subject), FUN=mean)
tidy_data_set$Group.1 <- NULL
tidy_data_set$Group.2 <- NULL

# store tidy_data_set to text-file
write.table(tidy_data_set, "tidy_data_set.txt", row.name=FALSE)
