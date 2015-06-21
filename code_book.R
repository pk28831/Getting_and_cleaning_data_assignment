---
title: "Code_book"
author: "Peter Knapen"
date: "06/21/2015"
output: html_document
keep_md: TRUE
---

This is the code book for the program run_analysis.R

# Raw data
The raw data is copied from  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip to a "file getdata_projectfiles_UCI_HAR_Dataset.zip"  
A description of the file can be found on http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.  

The zipped file getdata_projectfiles_UCI_HAR_Dataset.zip is unzipped, resulting in 3 txt files and 2 directories
The build up of the files and directory structure and files in those directories can be found in the README.txt file. 
For our analysis the X_test.txt, X_train.txt, y_test.txt, y_train.txt, features.txt and lablels.txt are considered as raw data. As the data was already normalised between -1 and +1, it is dimensionless (no units).
The raw data set contains 2947 observations for the train dataset and 7352 observations for the test data set

# Tidy data set

The variables used in the tidy data set are a subset of the raw datat set. The tidy data set can be found in tidy_set.txt.  
The variables used in the this set are derived from the features.txt file:


```{r, echo=FALSE}
print(colNames2)
```


