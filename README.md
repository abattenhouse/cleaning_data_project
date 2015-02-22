# README.md

This repo represents a solution to the Coursera "Getting and Cleaning Data" course project.

The project goal is to create a "tidy" dataset based on a subset of data from the
Human Activity Recognition Using Smartphones Data Set hosted at the UCI Machine
Learning Repository: [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The UCI HAR dataset contains smartphone sensor measurements for 30 volunteers performing
a variety of activities, such as walking and sitting. 
Multiple measurements of a given type are recorded for each subject and activity.
The data were divided into two sets, train and test, with subjects assigned
to one set or the other.

The tidy dataset for the course project consists of activity/subject average measurement
values for a subset of these UCI HAR sensor measurments.

## Project artifacts
Artifacts for this project are:

* **README.md** -- This file.
* **getdata\_projectfiles\_UCI\_HAR\_Dataset.zip** -- Zip archive of original
UCI HAR data, downloaded from the course web site.
* **Tidy\_UCI\_HAR\_subset.txt** -- The tidy data subset produced from the original
UCI HAR data.
* **run\_analysis.R** -- R script that processes the original UCI HAR data
and produces the tidy data subset.
* **CodeBook.md** -- Code book describing the format of the tidy data subset file.

## Running run\_analysis.R

The **run\_analysis.R** script contains all processing steps needed to transform the
data in **getdata\_projectfiles\_UCI\_HAR\_Dataset.zip** to produce the
**Tidy\_UCI\_HAR\_subset.txt** tidy data subset file.

The script should be run in a directory either containing the
**getdata\_projectfiles\_UCI\_HAR\_Dataset.zip** Zip archive, or containing a subdirectory
called **UCI HAR Dataset** obtained from extracting the Zip archive.

Note that **run\_analysis.R** uses the **rehsape2** R package. To install it, in R:

`install.packages("reshape2")`


## Data processing

An overview of the data processing performed is presented below. For a complete
description, see the **run\_analysis.R** script.

The UCI HAR train and test datasets each have three files:

1. **[type]\_X.txt** - the measurement set. Has one numeric column for each measurement feature
2. **[type]\_Y.txt** - the activity. Has a single integer column with the activity code for each measurements taken
3. **subject\_[type].txt** - the subject. Has a single integer column with the subject number (1-30) for each measurement

Each file in the train or test set has the same number of rows, one for each 
subject/activity measurement.

The UCI HAR data also includes two metadata files:

1. **activities.txt** -- Maps activity codes to activity descriptions
2. **features.txt** -- Provides a descriptive label for each of the 561 measurements
in the measurement sets.

To create the final tidy data subset, the following steps were performed:

1. Measurement labels were created based on the **features.txt** descriptions.
2. Measurements for test and training data were loaded and labeled appropriately.
3. Metadata was constructed for each measurement, including subject, set (train
or test) and activity code.
4. A measurement subset was created, including only measurements of mean or
standard deviation.
5. Metadata and measurment data were combined, and a descriptive activity
label added based on the **activities.txt** activity code/description mapping.
6. Multiple measurments for each activity/subject were averaged.

The final tidy dataset has 180 rows, one for each activity/subject combination, based
on 30 subjects and 6 activites. Each row contains 3 metadata and 86 data columns.
The metadata columns describe the activity/subject combination, and each data column
contains an average value for the feature measurements taken for that
activity/subject. Full details can be found in **CodeBook.md**.

## Citations

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
A Public Domain Dataset for Human Activity Recognition Using Smartphones. 
21th European Symposium on Artificial Neural Networks, Computational Intelligence 
and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.



