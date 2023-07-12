# Script README

This script performs data processing and analysis on the UCI HAR Dataset. It reads the dataset, combines the data from the test and train sets, selects specific features, assigns activity labels to the Y values, and aggregates the data.

## Getting Started

To use this script, follow the steps below:

### Step 1: Reading Data

The following libraries are required:

```R
library(rstudioapi)
library(dplyr)
The script assumes that the dataset is located in the specified directory. It extracts the directory path and constructs the necessary file paths for reading the data. Make sure the dataset is present in the correct location.

Step 2: Collecting All Data Together
The script combines the test and train datasets. It reads the necessary files, assigns appropriate names to the variables, and merges the data.

Step 3: Feature Selection
The script selects specific features from the combined dataset. It reads the list of features and filters out only the ones containing "mean" or "std" in their names.

Step 4: Assigning Activity Labels
The script reads the activity labels file and assigns meaningful labels to the Y values in the dataset based on the provided labels.


Step 5: Aggregating Data
Finally, the script aggregates the labeled data by activity and subject, calculating the mean for all other variables.

File Structure
The script assumes the following file structure:

- Run_analysis.R
- README.Rmd
- data/
  - Dataset/
    - UCI HAR Dataset/
      - activity_labels.txt
      - features.txt
      - test/
        - X_test.txt
        - Y_test.txt
        - subject_test.txt
      - train/
        - X_train.txt
        - Y_train.txt
        - subject_train.txt
Usage
To run the script, execute the Run_analysis.R file. Make sure to set the working directory to the location where the script is located.