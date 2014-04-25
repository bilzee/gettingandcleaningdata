gettingandcleaningdata
======================

##Peer Assessment: Getting and Cleaning Data

###Requirements
* In addition to the R Base Package, the data.table package is required to be installed and loaded to the working environment. The code required to achieve this is in the script run_analysis.R. If the package is not installed and loaded, the commands required are: 
install.packages("data.table")
library(data.table)
* The script could be run in the typical RGUI, or preferably in RStudio which gives more flexibility to run the script. In either environments, the script could simply be copied and pasted after the preliminaries (below) , then exectued.

###Preliminaries 
* Select a working directory in the R running environment
* Download the data [1] from the address (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ) and unzip in the working directory such that the folder "UCI HAR Dataset" (name unchanged) is in the working directory 

###Note
* Coursera submission platform does not accept submission of .csv file, therefore the csv out files have been saved as .txt. To inspect the submitted tidy datasets (as required by the instructions of the assessment), the text files must be opened and saved (save as) .csv file. (In notepad, goto: File > Save As > "Save as type" = "All Files" > make the extension ".csv")
* Data in the folders, "train/Inertia Signals" and "test/Inertia Signals" was not read into the dataset because none of the variables is applicable to the instructions of the Peer Assessment i.e. they do not apparently contain Mean and Standard Deviation values.
* Variables with measuring Mean and Standard Deviation were identified by their titles which contain "mean()" and "std()" respectively; as indicated in the "features.txt" file.
* Descriptive names for activities were extracted from the file activity_labels.txt because those names are descriptive enough, and legibly written. 

###Input to Script
* The unzipped folder "UCI HAR Dataset"  in the working directory

###Executing Script (after Preliminaries)
* Method 1 (RGUI or RStudio): Copy and paste entire script to command line, then press return
* Method 2 (RStudio): Cpen the script "run_analysis.R" select all the code by pressing "ctrl A". The second set is to press "ctrl enter" or click the "Run" button at the top right of script editor window. 

###Output from Script (in working directory)
* "tidy.csv": Extracts only the measurements on the mean and standard deviation for each measurement. Labels the data set with descriptive activity names. 
* "tidySummary.csv": Tidy data set, derived from "tidy.csv" with the average of each variable for each activity and each subject.

###Reference
* [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

