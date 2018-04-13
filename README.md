# Assignment Explanation

## Step 1 : Reading .txt files
### All the relevant txt files are read, so that we have data from test 
### and train sets, including subjects, activity numbers, and numeric data 
### for each variable.

## Step 2 : Merging data sets
### What we need is one data set, so after renaming the second columns of 
### test and train data sets (just to ensure that we can successfully bind them), 
### two sets are merged into one called "dataset".

## Step 3 : Renaming feature variables
### Current names of variables are not descriptive, therefore it is difficult 
### to understand. Consequently, using feature names extracted from features.txt, 
### we rename the variables.

## Step 4 : Extracting specific variables
### We only need mean and standard deviation for each measurement, so we can
### use grep() function to find variables including "mean" and "std". However,
### meanFreq() should be excluded. Using the list of numbers we get, a new data
### frame is created, only including variables that we need.

## Step 5 : Calculating the average of each variable for each activity and each subject
### Here I use for() loop, so I can calculate each value and fill it into the empty
### Avg data frame I just create.

## Step 6 : Creating the independent data frame.
### This is simple, since we only need to bind subject, newact, and Avg together.
### Also, do not forget to name the variables descriptively.
