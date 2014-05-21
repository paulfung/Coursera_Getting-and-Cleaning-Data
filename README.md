# How the Script Work?

## Importing Data

### Read and combine x_train.txt and x_test.txt
1. x_train.txt and x_test.txt are first imported; the 561 values on each line maps one-to-one sequentially to the 561 features in features.txt
2. The resulting data frames are then joined vertically   
_Note that the order has to be consistent.  In this case, train data is on top and test data is below_

### Read and combine y_train.txt and y_test.txt
1. Import y_train.txt and y_test.txt; these represent the activities preformed by the subjects
2. The imported activities are vertically joined and that the train activities is on top of the test activities

### Read and combine subject_train.txt and subject_test.txt
1. The same is performed to subject_train.txt and subject_test.txt   
_Now that we have the_ ___x/y/subject___ _data, we can combine them horizontally in the later steps because the first value in_ ___subject___ _corresponds to the first value in_ ___y___ _and that in turn corresponds to the first line in_ ___x___

### Read features.txt and activity_labels.txt
1. These will be used to provide the feature and activity names for the tidy data

## Subsetting Data

### Extract features and data that are related to mean and standard deviation
1. Using the imported features, create a features filter (logical vector).  This is done by searching "mean()" and "std()" in its strings   
_A TRUE mean that the feature is associated with mean or standard deviation_
2. The required features and x are then subset using this filter 

## Final Processing

### Combine the data into a table, sort and fixes the col/row names
1. Copy the filtered content from x into a tidyData dataframe
2. Set the filtered features as the column names of the tidyData
3. Calculate the means associated with each subject w.r.t their activities
4. Replace the activity numbers using the respective activity labels

### Output to file
1. Write the table to a tab delimited file