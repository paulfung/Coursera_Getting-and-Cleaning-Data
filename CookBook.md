# Analysis of Collected Data

## The Data
* X_train.txt   
_Contains the training data that corresponds one-to-one sequentially and horizontally to the features in features.txt_
* y_train.txt   
_Contains the activities that corresponds sequentially and vertically to data from X_train.txt_
* subject_train.txt   
_Contains the subjects that corresponds sequentially and vertically to data from X_train.txt_
* X_test.txt   
_Contains the test data that corresponds one-to-one sequentially to the features in features.txt_
* y_test.txt   
_Contains the activities that corresponds sequentially and vertically to data from X_test.txt_
* subject_test.txt   
_Contains the subjects that corresponds sequentially and vertically to data from X_test.txt_
* activity_labels.txt   
_Maps the activity factors to the activity descriptions_
* features.txt   
_Contains the descriptions of the features_   
   
## The Variables  
As an example, the first variable in _X_train.txt_ __2.8858451e-001__ belongs to feature __tBodyAcc-mean()-X__ (first feature in _feature.txt_), and was performed by subject __1__ (first integer in _subject_train.txt_) when he was performing activity __5__ (first integer in _y_train.txt_), which is __STANDING__ (mapping from _activity_labels.txt_)

## Transformations / Cleaning   
* The inputs are merged in the following manner:   

Subject				    |	Activity	  |			features.txt (as column names)   
----------------- | ----------- | -------------------------------------
subject_train.txt	|	y_train.txt	|			X_train.txt   
subject_test.txt	|	y_test.txt	|			X_test.txt   

* The required features (those associated with __mean__ and __std__) and data are filtered in
* Averages of the resulting variables for each activity and each subject are then calculated   

