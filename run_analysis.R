#To run this scriptt one have to copy the file in "UCI HAR Dataset" directory.
#It takes about 16s to run this script

run_analysis <- function(){
  
  # Read "features.txt" to get the list of measures variable used in the dataset
  features_txt <- read.table("features.txt")
  
   # Read the "test" data and associates the names to the different columns in lower case
  x_test <- read.table("test/X_test.txt")
  names(x_test) <- sapply(features_txt[2], function(elt) elt)
  #str(x_test)
  
  # Read the "y_test" data, representing the activities when the data was captured
  y_test <- read.table("test/Y_test.txt")
  names(y_test) <- c("Activities")
  #str(y_test)
  
  # Read the "subject_test" data, representing the number of the subjects who have passed the test
  subject_test <- read.table("test/subject_test.txt")
  names(subject_test) <- c("Subjects")
  
  # combined the different "test" data in one single data frame 
  tested <- cbind(subject_test, y_test, x_test)
  #str(tested)
  
  # Read the "x_train" data and associates the names to the different columns in lower case
  x_train <- read.table("train/X_train.txt")
  names(x_train) <- sapply(features_txt[2], function(elt) elt)
  #str(x_train)
  
  # Read the "y_train" data, representing the activities when the data was captured
  y_train <- read.table("train/Y_train.txt")
  names(y_train) <- c("Activities")
  #str(y_train)
  
  # Read the "subject_train" data, representing the number of the subjects who have passed the test
  subject_train <- read.table("train/subject_train.txt")
  names(subject_train) <- c("Subjects")
  #str(subject_train)
  
  # combined the different "train" data in one single data frame 
  trained <- cbind(subject_train, y_train, x_train)
  #str(trained)
  
  # combined the different data sets in one single data frame 
  run_analysis_dataset <- rbind (tested, trained)
  #print(names(run_analysis_dataset))
  
  # extract of the run_analysis_dataset the measures regarding the mean and standard deviations operations only
  searchStrings <- c("[Mm]ean","std")
  run_analysis_dataset_ext <- cbind( run_analysis_dataset[1:2],
                                     run_analysis_dataset[,grepl(paste(searchStrings,collapse="|"),names(run_analysis_dataset))])
  #print(names(run_analysis_dataset_ext))
  
  # associate the different types of activities instead of the numbers represnting them in the data sets 
  run_analysis_dataset_ext$Activities <- factor(run_analysis_dataset_ext$Activities, levels = c(1,2,3,4,5,6), ordered = T,
                                   labels = c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS", 
                                              "SITTING","STANDING", "LAYING"))
  #str(run_analysis_dataset)

  # create the tidy dataset, summrizing the mean per activity type for each subject
  tidy_dataset <- aggregate(run_analysis_dataset_ext[3:88],
            list( Subjects = run_analysis_dataset_ext$Subjects, Activities = run_analysis_dataset_ext$Activities), 
            mean)
  
  # Ordering the dataset per subject to get all the mean of each activity regarding one specific subject.
  tidy_dataset <- tidy_dataset[order(tidy_dataset$Subjects),]
  #str(tidy_dataset)
  #head(tidy_dataset[1:6],50)
  
  # Write the tidy dataset in the "tidy_dataset.txt" text file in "UCI HAR Dataset" directory 
  write.table(tidy_dataset, file = "tidy_dataset.txt", row.names  = FALSE)
}