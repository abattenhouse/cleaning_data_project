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

Data columns (4-89) are:

4\. **tBodyAcc_mean_X**                   
5\. **tBodyAcc_mean_Y**                   
6\. **tBodyAcc_mean_Z**                   
7\. **tBodyAcc_std_X**                    
8\. **tBodyAcc_std_Y**                    
9\. **tBodyAcc_std_Z**                    
10\. **tGravityAcc_mean_X**                
11\. **tGravityAcc_mean_Y**                
12\. **tGravityAcc_mean_Z**                
13\. **tGravityAcc_std_X**                 
14\. **tGravityAcc_std_Y**                 
15\. **tGravityAcc_std_Z**                 
16\. **tBodyAccJerk_mean_X**               
17\. **tBodyAccJerk_mean_Y**               
18\. **tBodyAccJerk_mean_Z**               
19\. **tBodyAccJerk_std_X**                
20\. **tBodyAccJerk_std_Y**                
21\. **tBodyAccJerk_std_Z**                
22\. **tBodyGyro_mean_X**                  
23\. **tBodyGyro_mean_Y**                  
24\. **tBodyGyro_mean_Z**                  
25\. **tBodyGyro_std_X**                   
26\. **tBodyGyro_std_Y**                   
27\. **tBodyGyro_std_Z**                   
28\. **tBodyGyroJerk_mean_X**              
29\. **tBodyGyroJerk_mean_Y**              
30\. **tBodyGyroJerk_mean_Z**              
31\. **tBodyGyroJerk_std_X**               
32\. **tBodyGyroJerk_std_Y**               
33\. **tBodyGyroJerk_std_Z**               
34\. **tBodyAccMag_mean**                  
35\. **tBodyAccMag_std**                   
36\. **tGravityAccMag_mean**               
37\. **tGravityAccMag_std**                
38\. **tBodyAccJerkMag_mean**              
39\. **tBodyAccJerkMag_std**               
40\. **tBodyGyroMag_mean**                 
41\. **tBodyGyroMag_std**                  
42\. **tBodyGyroJerkMag_mean**             
43\. **tBodyGyroJerkMag_std**              
44\. **fBodyAcc_mean_X**                   
45\. **fBodyAcc_mean_Y**                   
46\. **fBodyAcc_mean_Z**                   
47\. **fBodyAcc_std_X**                    
48\. **fBodyAcc_std_Y**                    
49\. **fBodyAcc_std_Z**                    
50\. **fBodyAcc_meanFreq_X**               
51\. **fBodyAcc_meanFreq_Y**               
52\. **fBodyAcc_meanFreq_Z**               
53\. **fBodyAccJerk_mean_X**               
54\. **fBodyAccJerk_mean_Y**               
55\. **fBodyAccJerk_mean_Z**               
56\. **fBodyAccJerk_std_X**                
57\. **fBodyAccJerk_std_Y**                
58\. **fBodyAccJerk_std_Z**                
59\. **fBodyAccJerk_meanFreq_X**           
60\. **fBodyAccJerk_meanFreq_Y**           
61\. **fBodyAccJerk_meanFreq_Z**           
62\. **fBodyGyro_mean_X**                  
63\. **fBodyGyro_mean_Y**                  
64\. **fBodyGyro_mean_Z**                  
65\. **fBodyGyro_std_X**                   
66\. **fBodyGyro_std_Y**                   
67\. **fBodyGyro_std_Z**                   
68\. **fBodyGyro_meanFreq_X**              
69\. **fBodyGyro_meanFreq_Y**              
70\. **fBodyGyro_meanFreq_Z**              
71\. **fBodyAccMag_mean**                  
72\. **fBodyAccMag_std**                   
73\. **fBodyAccMag_meanFreq**              
74\. **fBodyBodyAccJerkMag_mean**          
75\. **fBodyBodyAccJerkMag_std**           
76\. **fBodyBodyAccJerkMag_meanFreq**      
77\. **fBodyBodyGyroMag_mean**             
78\. **fBodyBodyGyroMag_std**              
79\. **fBodyBodyGyroMag_meanFreq**         
80\. **fBodyBodyGyroJerkMag_mean**         
81\. **fBodyBodyGyroJerkMag_std**          
82\. **fBodyBodyGyroJerkMag_meanFreq**     
83\. **angletBodyAccMean_gravity**         
84\. **angletBodyAccJerkMean_gravityMean** 
85\. **angletBodyGyroMean_gravityMean**    
86\. **angletBodyGyroJerkMean_gravityMean**
87\. **angleX_gravityMean**                
88\. **angleY_gravityMean**                
89\. **angleZ_gravityMean** 
