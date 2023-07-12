## Codebook

The codebook provides information about the variables and data transformations performed by the script.

### Variables

1. **data_all**: The combined dataset containing the subject, activity, and feature variables from both the test and train sets.
2. **features_lst**: A vector of feature names extracted from the `features.txt` file.
3. **features_to_keep**: A subset of `features_lst` that includes only the features containing "mean" or "std" in their names.
4. **selected_vars**: A subset of `data_all` containing only the selected features (`features_to_keep`).
5. **activity_labels**: A data frame containing the activity labels read from the `activity_labels.txt` file.
6. **data_all_labels**: The labeled dataset obtained by merging `activity_labels` with `data_all` based on the "y" variable.
7. **aggregate_data**: The aggregated dataset obtained by grouping `data_all_labels` by activity and subject and calculating the mean for all other variables.

### Data Transformations

1. Reading Data:
  - The script reads the necessary files, including `features.txt`, `activity_labels.txt`, and the test and train data files (`X_test.txt`, `Y_test.txt`, `subject_test.txt`, `X_train.txt`, `Y_train.txt`, `subject_train.txt`).
- It constructs the file paths based on the directory structure and assigns appropriate variable names.

2. Combining Data:
  - The script combines the test and train datasets into a single dataset named `data_all`.

3. Feature Selection:
  - It reads the list of features from `features.txt`.
- It filters out only the features containing "mean" or "std" in their names, resulting in `features_to_keep`.
- It selects only the columns corresponding to the selected features in `data_all`, creating `selected_vars`.

4. Assigning Activity Labels:
  - The script reads the activity labels from `activity_labels.txt`.
- It merges the activity labels with `data_all` based on the "y" variable, resulting in `data_all_labels`.
- The "y" variable is replaced with meaningful activity labels.

5. Aggregating Data:
  - The script groups `data_all_labels` by activity and subject using `group_by`.
- It calculates the mean for all other variables using `summarise_all`, resulting in `aggregate_data`.

Please note that this codebook provides an overview of the variables and transformations in the script. For more detailed information about the dataset's specific variables and their meanings, please refer to the original UCI HAR Dataset documentation.
