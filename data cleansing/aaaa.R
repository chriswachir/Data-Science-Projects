## importing data 
data <- read.csv(file.choose(), header = T)
View(head(data, n = 5))
str(data)
dim(data)
library(summarytools)
library(lifecycle)
summarytools::freq(data$neighbourhood_group, order = "freq")
summarytools::freq(data$room_type, order = "freq")

### Univeriate functions 
mean(data$price)
median(data$price)
var(data$price)
sqrt(var(data$price))

mean(data$availability_365)
median(data$availability_365)
var(data$availability_365)
sqrt(var(data$availability_365))



### triming white spaces. 
library(stringr)
data$name <- str_trim(data$name)
data$host_name <- str_trim(data$host_name)
data$neighbourhood_group <- str_trim(data$neighbourhood_group)
data$neighbourhood <- str_trim(data$neighbourhood)
data$room_type <- str_trim(data$room_type)
data$last_review <- str_trim(data$last_review)

###visualizations to detect outliers.

hist(data$price)
boxplot(data$price)

hist(data$minimum_nights)
boxplot(data$minimum_nights)

hist(data$number_of_reviews)
boxplot(data$number_of_reviews)

hist(data$reviews_per_month)
boxplot(data$reviews_per_month)

hist(data$calculated_host_listings_count)
boxplot(data$calculated_host_listings_count)

hist(data$availability_365)
boxplot(data$availability_365)

### Replacing outliers in the data with median

column1<-boxplot.stats(data$price)$out;
data$price[data$price %in% column1]<-median(data$price)

column2<-boxplot.stats(data$minimum_nights)$out;
data$minimum_nights[data$minimum_nights %in% column2]<-median(data$minimum_nights)

column3<-boxplot.stats(data$number_of_reviews)$out;
data$number_of_reviews[data$number_of_reviews %in% column3]<-median(data$number_of_reviews)

column4<-boxplot.stats(data$reviews_per_month)$out;
data$reviews_per_month[data$reviews_per_month %in% column4]<-median(data$reviews_per_month)

column5<-boxplot.stats(data$calculated_host_listings_count)$out;
data$calculated_host_listings_count[data$calculated_host_listings_count %in% column5]<-median(data$calculated_host_listings_count)

column6<-boxplot.stats(data$availability_365)$out;
data$availability_365[data$availability_365 %in% column6]<-median(data$availability_365)

### Missing values. 
sum(is.na(data))
data1 <-na.omit(data)
dim(data1)

### Checking for duplicates
sum(duplicated(data1))
table(duplicated(data1$id))

