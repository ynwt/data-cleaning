##Getting and Cleaning Data Course Project

##Objective

This assignment to collect, work with, and clean the given data set and to produce a summarized tidy data set for use in further analysis.
Data source
Data collected from the accelerometers from the Samsung Galaxy S smartphone

## Original Data Source
* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip</a>

## Process
* Download given data and extract to the Data subfolder of working folder manually.
* Prepare the reproducible script which does the below 
<ol>
<li>Load data from both train and test data set for features, label and subject.</li>
<li>Load data for features names.</li>
<li>Set the appropriate feature names to feature data.</li>
<li>Row merge for training and testing data sets of features, label and subject separately.</li>
<li>Subset the features that only concern for this project, features with Mean and Std in feature name.</li>
<li>Column merge for selected features, label and subject data sets.</li>
<li>Join the result with activity data set by activity Id.</li>
<li>Summarized the result to calculate mean by Subject and Activity.</li>
<li> Save the summarized result to a file called tidy.txt</li>
</ol>

## Result
The output of this assignment is the so call tidy summarized data set of selective measures. Please refer to the tidy.txt file and codebook for detail.
