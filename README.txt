---
title: "README"
author: "Peter Knapen"
date: "06/21/2015"
output: html_document
keep_md: TRUE
---

# Raw data
The raw data is copied from  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip to a "file getdata_projectfiles_UCI_HAR_Dataset.zip"  
A description of the file can be found on http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.  

The zipped file getdata_projectfiles_UCI_HAR_Dataset.zip is unzipped, resulting in 3 txt files and 2 directories
The build up of the files and directory structure and files in those directories can be found in the README.txt file. 
For our analysis the X_test.txt, X_train.txt, y_test.txt, y_train.txt, features.txt and lablels.txt are considered as raw data. As the data was already normalised between -1 and +1, it is dimensionless (no units).
The raw data set contains 2947 observations for the train dataset and 7352 observations for the test data set

#Tidy data set

## How I got from the raw data to the tidy_set.

Load the required data packages.  
Load the raw data from X_train.txt, y_train.txt, subject_train.txt, X_test.txt, y_test.txt, subject_txt.txt, features.txt and labels.txt.  
Give names to headers of data frames and vectors.  
Get one data set:  
        * combine subject_ and y_ to sub_act_ for test and train  
        * combine sub_act_ and X_ to test cq train  
        * combine test and train to complete set, 10299 observations of 563 variables  
Come to a reduced set:  
        * select only channels which gave a mean and std (standard deviation)  
        * change the names of the columns by replacing  
                + -mean\\() by Mean  
                + -std\\() by Stddev  
                + BodyBody by Body  
                + starting t by time  
                + starting f by freq  
                + Mag by Magnitude  
                + remove the - sign  
        * change the labels:  
                + change all to lower case  
                + change walkingupstairs in walkingUpstars  
                + change walkingdownstairs in wal;kingDownstairs  
        * replace avtivity number by activity string in new dataframe  
Come to a tidy set:  
        * group_by activity and subjectNummber and summarize the mean and write to tidy_set  
        * write tidy datatable to file tidy_set.txt   
        
Remark: the latest version of dplyr make it possible to summarize over more than one group by the command summarise_each. (works only with the English notation)
