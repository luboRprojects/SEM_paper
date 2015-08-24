Welcome!
=========

In this repository you will find R scripts (analytical part) and LaTeX codes (professional typography). These scripts should have served as main analytical tool for SEM paper with prof. Belas and me. Back to these days we were collaborating with Steve, which is the reason for English notes. 

Unfortunately, we did not make it to the final version. You can consider this as open project. Feel free to make changes! If you don\`t have (yet!) personal account at Github, you will have to copy-paste codes separately or download the whole archive (button on the left). Otherwise, just clone codes to your computer. If you want to change this repository, please let me know. I will make you \`contributor\`. 

As the data is not my property, I cannot share it publicly here. Scripts are tailored to the original paper. For your next endeavours,  you will need to adjust working directory, variable names, rename plot labels, etc.

This folder contains these scripts:

1. sem\_prepare_data.R
  - data import for Factor analysis, Plotting and SEM, 
  - data processing to fully capture ordinal-data type 

2. sem\_visual.R
  - R code for preparing descriptive plot of Likert-type data,
  - there are not many combinations of grouping factors (i.e, gender) and manifest variables (questions from questionnaire),
  - I've prepared labels and indices for questions so it should not be tedious to toy around with combinations
 
3. sem\_factor_analysis.R
  - codes for Exploratory Factor Analysis,
  - several validity/reliability characteristics are calculated here

4. sem\_pretests.R
  - this file contains code for performing Confirmatory Factor Analysis (CFA),
  - some other statistics (AVE) obtained from CFA

5. sem\_lavaan.R
  - tree SEM models are described here,
  - results are detailed in summary function and even graphically (using `semPlot::semPaths`),
  - although it's possible to draw path diagram in R, results are extremely sloppy for such complicated models (hail to the TikZ!)
  
