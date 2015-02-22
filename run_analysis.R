
# Unzip the Human Activity Recognition dataset from UCI
unzip("getdata_projectfiles_UCI_HAR_Dataset.zip")

# change into the created folder
setwd("./UCI HAR Dataset")

# load the activity labels
activities <- read.table("activity_labels.txt", sep="", header=F)
names(activities) = c('code', 'activity')

# load the feature information (561 rows)
features_all <- read.table("features.txt", sep="", 
                           header=F, stringsAsFactors=F)
names(features_all) = c('column', 'text')

# tidy up the labels so they can be used as column names
features_all$feature <- gsub('[()]', '', features_all$text,    perl=T)
features_all$feature <- gsub('-',   '_', features_all$feature, perl=T)
features_all$feature <- gsub(',',   '_', features_all$feature, perl=T)

# The train and test datasets have three files
#   <type>_X.txt - the measurement set
#                  has one numeric column for each measurement feature
#   <type>_Y.txt - the activity
#                  has a single integer column with the activity code
#                  for the measurements taken
#   subject_<type>.txt - the subject
#                  has a single integer column with the subject
#                  number (1-30) for each measurement
# Each file in the train or test set has the same number of rows,
# one for each subject/activity measurement set

# load the training data
train_X_all <- read.table("./train/X_train.txt", sep="", header=F, col.names=features_all$feature)
train_Y     <- read.table("./train/Y_train.txt",         header=F, col.names='code')
train_subj  <- read.table("./train/subject_train.txt",   header=F, col.names='subject')
stopifnot(nrow(train_X_all) == nrow(train_Y))
stopifnot(nrow(train_X_all) == nrow(train_subj))

# load the test data
test_X_all <- read.table("./test/X_test.txt", sep="",   header=F, col.names=features_all$feature)
test_Y     <- read.table("./test/Y_test.txt",           header=F, col.names='code')
test_subj  <- read.table("./test/subject_test.txt",     header=F, col.names='subject')
stopifnot(nrow(test_X_all) == nrow(test_Y))
stopifnot(nrow(test_X_all) == nrow(test_subj))

# consolodate measurement metadata (subject, source set, activity code, activity name)
meta_train  <- data.frame(subject=train_subj$subject, set='train', code=train_Y$code)
meta_test   <- data.frame(subject=test_subj$subject, set='test', code=test_Y$code)

# combine measurements and metadata into one data frame each
meta_all <- rbind( meta_train,   meta_test)
data_all <- rbind( train_X_all, test_X_all)
stopifnot( nrow(meta_all) == nrow(train_Y) + nrow(test_Y))
stopifnot( nrow(data_all) == nrow(train_Y) + nrow(test_Y))

# create a feature subset that only includes mean and std labels
features <- features_all[ grep('([Mm]ean|[Ss]td)', features_all$feature), ]

# create data subset with only measurements for mean/std 
data_subset <- data_all[, features$feature]

# combine the metadata with measurement data
data_cmb <- cbind( meta_all, data_subset )
stopifnot( nrow(data_all) == nrow(train_Y) + nrow(test_Y))

merged <- merge(activities, data_cmb, by.x='code', by.y='code', sort=F, all.y=T)

# turn into a tall, skinny data frame using melt from reshape2
# there will be one row for every measure.vars value
library(reshape2)
melted <- melt(merged, id=c("activity", names(meta_all)),
               measure.vars=features$feature)

# create tidy data set with average of each measurement for each activty and subject.
# also note which set (train or test) subject belongs to.
# uses dcast function from reshape2.
tidy <- dcast(melted, activity + subject + set ~ variable, mean)

# write out the tidy data set
write.table(tidy, file="../Tidy_UCI_HAR_subset.txt", sep="\t", row.names=F, col.names=T)


