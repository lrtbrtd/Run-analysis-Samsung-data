### Run Analysis on Samsung Data


#####The script run_analysis.R is reading all the datasets available in "test" and "train" directory of "UCI HAR dataset". It does not process the raw data available in both "Inertia Signals" directories, as it was not the focus of the study. 
To run the script has to be put in the "UCI HAR Dataset" directory.

#####The different files read :
 - features.txt : to get all the variables available from the "x_test" and "x_train" datasets
 - test/X_test.txt : all the measures done on the "test" subjects
 - test/Y_test.txt : all the activities done by the "test" subjects
 - test/subject_test.txt : the ids of the subjects who were part of the "test" campaign
 - train/X_test.txt : all the measures done on the "train" subjects
 - train/Y_test.txt : all the activities done by the "train" subjects
 - train/subject_test.txt : the ids of the subjects who were part of the "train" campaign

#####For more information look at the README.txt file provided by "UCI HAR Dataset".

#####Scope of the script :
 * Read of the all the files required for the study
 * Concatene those files in one single dataset
 * Give the variable names to the different columns of the dataset
 * Extract from the signle dataset a subset including the Subjects, the Activities and all relevant "mean" and "std" measures 
 * Rename the activities by their names "WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING", "LAYING" for better undertsanding
 * Eventually extract a tidy dataset, which computes the mean of all measures for one Activity for one Subject
 * Ordering the tidy dataset per Subject to get all the measures regarding one subjet in consecutive rows
