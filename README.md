##README 

This repository contains an example analysis on a Spotify Dataset uploaded on an open server on hugging face. The goal of this analysis was to answer the following questions:
Which factors are most strongly linked to danceability?
What is the single most influential variable in affecting a song's danceability?
Can average danceability across genres be effectively predicted using multiple linear regression modelling techniques?

If you are interesting in running this code please first download the datset.csv file. 

To see my Exploratory Data Analysis, some ggplot techniques and other pre-processing please run EDA SCRIPT PROJECT.R

To see an example of some clustering Anaysis please run Popularity Clustering Analysis.R

Correlation tables.R is a script used just to create a correlation table of all appropriate variables in the dataset

And finally, to see my multiple linear regression process and testing please run Danceability Regression Analysis.R

The key finding of this analysis, was a significant relationship between Danceability and Valence, Speechiness, Liveness and Mode. I was able to create a multiple linear regression between all of 
these variables (averaged by genre), with an Adjusted R-squared value of 0.6744. Valence was the most impactful on this figure, and some variables where shown to have no relation at all.
