# CodeBook

This code book describes the variables and the result for cleaning and transforming the FUCI HAR Datasets about smart phone usage.

## Loading Datasets

1- activityLabels 
	Loads 'activity_labels.txt'
2- features
	Loads 'features.txt'
3- XTest
	Loads 'X_test.txt' and removes rows that only have "mean" or "std"
4- yTest
	loads 'y_test.txt'
5- subjectTest
	Loads 'subject_test.txt'
6- XTrain
	Loads 'X_train.txt' and removes rows that only have "mean" or "std"
7- yTrain
	Loads 'y_train.txt'
8- subjectTrain
	Loads 'subject_train.txt'
	
## Variables

1- 'data' is the binding of data between test train data
2- 'dataLabels' is the column labels for 'data'
3-  'meltData' is the transformation of 'data' using 'melt' function
4- 'TidyData' is the result of tidying the 'meltData' using 'dcast' function. This is the data extracted for 'tidy_data.txt'