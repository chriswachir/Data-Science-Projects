cd "C:\Users\HP\Desktop\Kimanzi 2020"
insheet using USA.csv
sum  gdp_per_hour cpi shareprice price_index
correlate gdp_per_hour cpi shareprice price_index
regress gdp_per_hour cpi shareprice price_index
help hist
histogram gdp_per_hour
graph matrix gdp_per_hour cpi shareprice price_index, title("Scatter Matrix of economic indicators")
ttest gdp_per_hour == shareprice, unpaired
