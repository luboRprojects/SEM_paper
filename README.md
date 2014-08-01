Welcome!
=========

In this repository you will find R and TeX scripts for paper which is a collaboration of our research team. As the data is not of my property, I cannot make it public here. Write me an email if you are interested.

This folder contains these scripts:

1. sem_prepare_data.R
  - import  of data for Factor analysis, Plotting and SEM, 
  - data processing to fully capture ordinal-data type 

2. sem_visual.R
  - R code for preparing descriptive plot of Likert-type data,
  - there are not many combinations of grouping factors (i.e, gender) and manifest variables (questions from questionnaire),
  - I've prepared labels and indices for questions so it should not be tedious to toy around with combinations
 
3. factor_analysis.R
  - codes for Exploratory Factor Analysis,
  - several validity/reliability characteristics are calculated here

4. sem_pretests.R
  - this file contains code for performing Confirmatory Factor Analysis (CFA),
  - some other statistics (AVE) obtained from CFA


5. sem_lavaan.R
  - tree SEM models are described here,
  - results are probed in summary function and even graphically (using semPlot::semPaths function),
  - although it's possible to draw path diagram in R, results are extremely sloppy for such complicated models (hail to the TikZ!)
  
