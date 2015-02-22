# CodeBook.md

This file describes the format of the tidy data subset **Tidy\_UCI\_HAR\_subset.txt**.

The tidy dataset has 180 rows, one for each activity/subject combination, based
on 30 subjects and 6 activites. Each row contains 3 metadata and 86 data columns.
The metadata columns describe the activity/subject combination, and each data column
contains an average value for all the feature measurements taken for that
activity/subject.

# Metadata columns

Metadata columns (1-3) are:

1. **activity** -- descriptive activity label. One of: 
*LAYING, SITTING, STANDING, WALKING, WALKING\_DOWNSTAIRS, WALKING\_UPSTAIRS*
2. **subject** -- subject number (1-30).
3. **set** -- set subject was assigned to (*train* or *test*).

## Measurement data columns

Data columns (4-89) represent a subset of the mean and standard deviation
measurement features in the original UCI HAR **features.txt** feature set.
Specifically, any measurement label containing "mean" or "std" (not case sensitive)
was extracted. The resulting 86 tidy dataset measurement column names were derived from 
the UCI HAR feature labels by removing parentheses and substituting an underscore (**\_**) 
for any hypens (**-**) and commas (**,**).

Each data value is an average value for all
the feature measurements taken for the corresponding activity and subject.
Measurement units are described at the
Human Activity Recognition Using Smartphones Data Set hosted at the UCI Machine
Learning Repository: [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Data columns (4-89) are: 

4\. **tBodyAcc\_mean\_X**                   
5\. **tBodyAcc\_mean\_Y**                   
6\. **tBodyAcc\_mean\_Z**                   
7\. **tBodyAcc\_std\_X**                    
8\. **tBodyAcc\_std\_Y**                    
9\. **tBodyAcc\_std\_Z**                    
10\. **tGravityAcc\_mean\_X**                
11\. **tGravityAcc\_mean\_Y**                
12\. **tGravityAcc\_mean\_Z**                
13\. **tGravityAcc\_std\_X**                 
14\. **tGravityAcc\_std\_Y**                 
15\. **tGravityAcc\_std\_Z**                 
16\. **tBodyAccJerk\_mean\_X**               
17\. **tBodyAccJerk\_mean\_Y**               
18\. **tBodyAccJerk\_mean\_Z**               
19\. **tBodyAccJerk\_std\_X**                
20\. **tBodyAccJerk\_std\_Y**                
21\. **tBodyAccJerk\_std\_Z**                
22\. **tBodyGyro\_mean\_X**                  
23\. **tBodyGyro\_mean\_Y**                  
24\. **tBodyGyro\_mean\_Z**                  
25\. **tBodyGyro\_std\_X**                   
26\. **tBodyGyro\_std\_Y**                   
27\. **tBodyGyro\_std\_Z**                   
28\. **tBodyGyroJerk\_mean\_X**              
29\. **tBodyGyroJerk\_mean\_Y**              
30\. **tBodyGyroJerk\_mean\_Z**              
31\. **tBodyGyroJerk\_std\_X**               
32\. **tBodyGyroJerk\_std\_Y**               
33\. **tBodyGyroJerk\_std\_Z**               
34\. **tBodyAccMag\_mean**                  
35\. **tBodyAccMag\_std**                   
36\. **tGravityAccMag\_mean**               
37\. **tGravityAccMag\_std**                
38\. **tBodyAccJerkMag\_mean**              
39\. **tBodyAccJerkMag\_std**               
40\. **tBodyGyroMag\_mean**                 
41\. **tBodyGyroMag\_std**                  
42\. **tBodyGyroJerkMag\_mean**             
43\. **tBodyGyroJerkMag\_std**              
44\. **fBodyAcc\_mean\_X**                   
45\. **fBodyAcc\_mean\_Y**                   
46\. **fBodyAcc\_mean\_Z**                   
47\. **fBodyAcc\_std\_X**                    
48\. **fBodyAcc\_std\_Y**                    
49\. **fBodyAcc\_std\_Z**                    
50\. **fBodyAcc\_meanFreq\_X**               
51\. **fBodyAcc\_meanFreq\_Y**               
52\. **fBodyAcc\_meanFreq\_Z**               
53\. **fBodyAccJerk\_mean\_X**               
54\. **fBodyAccJerk\_mean\_Y**               
55\. **fBodyAccJerk\_mean\_Z**               
56\. **fBodyAccJerk\_std\_X**                
57\. **fBodyAccJerk\_std\_Y**                
58\. **fBodyAccJerk\_std\_Z**                
59\. **fBodyAccJerk\_meanFreq\_X**           
60\. **fBodyAccJerk\_meanFreq\_Y**           
61\. **fBodyAccJerk\_meanFreq\_Z**           
62\. **fBodyGyro\_mean\_X**                  
63\. **fBodyGyro\_mean\_Y**                  
64\. **fBodyGyro\_mean\_Z**                  
65\. **fBodyGyro\_std\_X**                   
66\. **fBodyGyro\_std\_Y**                   
67\. **fBodyGyro\_std\_Z**                   
68\. **fBodyGyro\_meanFreq\_X**              
69\. **fBodyGyro\_meanFreq\_Y**              
70\. **fBodyGyro\_meanFreq\_Z**              
71\. **fBodyAccMag\_mean**                  
72\. **fBodyAccMag\_std**                   
73\. **fBodyAccMag\_meanFreq**              
74\. **fBodyBodyAccJerkMag\_mean**          
75\. **fBodyBodyAccJerkMag\_std**           
76\. **fBodyBodyAccJerkMag\_meanFreq**      
77\. **fBodyBodyGyroMag\_mean**             
78\. **fBodyBodyGyroMag\_std**              
79\. **fBodyBodyGyroMag\_meanFreq**         
80\. **fBodyBodyGyroJerkMag\_mean**         
81\. **fBodyBodyGyroJerkMag\_std**          
82\. **fBodyBodyGyroJerkMag\_meanFreq**     
83\. **angletBodyAccMean\_gravity**         
84\. **angletBodyAccJerkMean\_gravityMean**
85\. **angletBodyGyroMean\_gravityMean**
86\. **angletBodyGyroJerkMean\_gravityMean**
87\. **angleX\_gravityMean**                
88\. **angleY\_gravityMean**                
89\. **angleZ\_gravityMean** 
