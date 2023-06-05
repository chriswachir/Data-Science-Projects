
***********************************************************
*      Author: SAMMY WAIYAKI                              *
*      Date: 25-11-2019                                   *
*                                                         *
*                                                         *
***********************************************************
/// settung location
cd "C:\Users\HP\Desktop\Data Science\breast-cancer-prediction-dataset"

// importing data to stata
insheet using breast_cancer_data.csv
br //browsing the data
describe // viewing data 
codebook // viewing data
list mean_radius diagnosis //viewing data

sort mean_radius // sorting ascending
br mean_radius // br sorted data
codebook mean_radius
codebook diagnosis
***** Data cleaning****
tab diagnosis, missing // looking for missing data 
duplicates report mean_radius // looking for duplicated records

sum mean_area, d // summary statistics

graph pie, over( diagnosis )plabel(_all percent) // visualiing pie chart
histogram mean_radius // visualizing histogram
graph box mean_area, over( diagnosis ) // visualizing box plots
kdensity mean_smoothness // visualiing density plots
scatter mean_radius mean_area // visualiing scatter plots
scatter mean_smoothness mean_texture

ttest mean_perimeter, by( diagnosis )// independent t test
help(logit)
***** LOGISTIC REGRESSION
logit diagnosis mean_radius mean_texture mean_perimeter mean_area mean_smoothness
