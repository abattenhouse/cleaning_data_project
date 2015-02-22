library(reshape2)

# Name of directory where UCI HAR files are located.
# By default this is the directory name created when the .zip archive
# is decompressed
DATADIR="./UCI HAR Dataset"

# Unzip the Human Activity Recognition dataset from UCI, if needed
if (!file.exists(DATADIR)) { 
    unzip("getdata_projectfiles_UCI_HAR_Dataset.zip")
}

# Load the activity labels
activities <- read.table(sprintf("%s/activity_labels.txt",DATADIR), sep="", header=F)
names(activities) = c('code', 'activity')

# Load the feature information (561 rows)
features_all <- read.table(sprintf("%s/features.txt",DATADIR), stringsAsFactors=F)
names(features_all) = c('column', 'text')

# Tidy up the feature labels so they can be used as column names
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

# Load the training data
train_X_all <- read.table(sprintf("%s/train/X_train.txt",DATADIR),       header=F, col.names=features_all$feature)
train_Y     <- read.table(sprintf("%s/train/Y_train.txt",DATADIR),       header=F, col.names='code')
train_subj  <- read.table(sprintf("%s/train/subject_train.txt",DATADIR), header=F, col.names='subject')
stopifnot(nrow(train_X_all) == nrow(train_Y))
stopifnot(nrow(train_X_all) == nrow(train_subj))

# Load the test data
test_X_all <- read.table(sprintf("%s/test/X_test.txt",DATADIR),       header=F, col.names=features_all$feature)
test_Y     <- read.table(sprintf("%s/test/Y_test.txt",DATADIR),       header=F, col.names='code')
test_subj  <- read.table(sprintf("%s/test/subject_test.txt",DATADIR), header=F, col.names='subject')
stopifnot(nrow(test_X_all) == nrow(test_Y))
stopifnot(nrow(test_X_all) == nrow(test_subj))

# Consolodate measurement metadata (subject, source set, activity code, activity name)
meta_train  <- data.frame(subject=train_subj$subject, set='train', code=train_Y$code)
meta_test   <- data.frame(subject=test_subj$subject,  set='test',  code=test_Y$code)

# Combine measurements and metadata into one data frame each
meta_all <- rbind( meta_train,   meta_test)
data_all <- rbind( train_X_all, test_X_all)
stopifnot( nrow(meta_all) == nrow(train_Y) + nrow(test_Y))
stopifnot( nrow(data_all) == nrow(train_Y) + nrow(test_Y))

# Create a feature subset that only includes mean and std labels
features <- features_all[ grep('([Mm]ean|[Ss]td)', features_all$feature), ]

# Create data subset with only measurements for mean/std features
data_subset <- data_all[, features$feature]

# Combine the metadata with measurement data
data_cmb <- cbind( meta_all, data_subset )
stopifnot( nrow(data_all) == nrow(train_Y) + nrow(test_Y))

# Add descriptive activity labels using merge
merged <- merge(activities, data_cmb, by.x='code', by.y='code', sort=F, all.y=T)
stopifnot( all(!is.na(merged$activity)) ) # ensure all codes mapped to labels

# Turn into a tall, skinny data frame using melt from reshape2
# There will be one row for every measure.vars value
melted <- melt(merged, id=c("activity", names(meta_all)),
               measure.vars=features$feature)

# Create tidy data set with average of each measurement for each activty and subject.
# Also note which set (train or test) subject belongs to.
# Uses dcast function from reshape2.
tidy <- dcast(melted, activity + subject + set ~ variable, mean)

# Write out the tidy data set
write.table(tidy, file="Tidy_UCI_HAR_subset.txt", row.names=F, col.names=T)


