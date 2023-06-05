## importing data 
bank_data <- read.csv(file.choose(), header = T)
View(bank_data)
attach(bank_data)

## exploration on the data
str(bank_data)
dim(bank_data)
Na_table <- table(is.na(bank_data))
Na_table

## descriptive statistics on the data
summary(bank_data)

## let us drop unwanted columns
library(dplyr)
bank_data1 <-select(bank_data, -c(1,2,3,4))
View(bank_data1)

## Exploratory data analysis using visualizations
library(ggplot2)
ggplot(data = bank_data1) +
  geom_bar(aes(x = default))
## distribution of eduation with target variable
ggplot(bank_data1, aes(eduction_level, ..count..)) + geom_bar(aes(fill = default), position = "dodge")

bins <- c(0,25,30,40,50,60)
age_cat <- c('<=26','26-30','30-40','40-50','50+')
bank_data1$age_bin <- cut(age, labels = age_cat, breaks = bins)

ggplot(bank_data1, aes(age_bin, ..count..)) + geom_bar(aes(fill = default), position = "dodge")

## creating income categories

income_bins = c(0,25,50,153)
income_cat <- c('low income', 'average income', 'high income')
bank_data1$income_category <-  cut(income, labels = income_cat, breaks = income_bins)

ggplot(bank_data1, aes(income_category, ..count..)) + geom_bar(aes(fill = default), position = "dodge")

## Distribution of numerical variables
## Histograms
qplot(age, geom = "histogram", main = 'histogram of Age')
qplot(income, geom = 'histogram', main = 'histogram of income')

## box plots
boxplot(age ~ default, main='box plot of age with target variable defaut', las = 1)
boxplot(income ~ default, main='box plot of income and target variable default', las=1)

bank_data2<- select(bank_data1, -c(10, 11))
View(bank_data2)

## building logistic and random forest models to predict defaulters
library(caret)
library(klaR)
trainIndex <- createDataPartition(bank_data2$default, p=0.80, list=FALSE)
train_set <- bank_data2[ trainIndex,]
test_set <- bank_data2[-trainIndex,]

##train logistic regression
fit <- glm(default~., data=train_set, family = binomial(link = 'logit'))
# make predictions
probabilities <- predict(fit, test_set[,1:8,], type = 'response')
predictions <- ifelse(probabilities > 0.5,'Yes','No')
# summarize results
table2 <- table(predictions, test_set$default)
table2
#accuracy of the logistic_modelprediction
accuracy <- (127+39)/(127+39+42+15)
accuracy

