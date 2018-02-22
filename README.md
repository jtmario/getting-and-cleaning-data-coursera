# Getting and Cleaning Data

A Project for the Coursera Getting and Cleaning Data course

## Getting Started

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Prerequisites

Download the data for the project from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Unzip in your working directory an run a file run_analysis.R. A file tiny.txt will be created.


### The R scrip

The R scrip will implement the following steps

1. Read only the required features - that´s contain mean and standard deviation (std)
2. Load the datasets
3. Merge datasets
4. Remane columns
5. Create a independent tidy data set with the average of each variable for each activity and each subject and save on tidy.txt

For more details, see the Code book.

