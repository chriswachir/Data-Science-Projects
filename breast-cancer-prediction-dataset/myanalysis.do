cd "C:\Users\HP\Desktop\Kimanzi 2020"
insheet using covid_econ.csv
generate Date = d(22jan2020)+_n-1
format Date %td
tsset Date
br
describe
correlate vixhigh vixlow covid_19_cases
sum vixhigh vixlow covid_19_cases
regress vixhigh covid_19_cases
regress vixlow covid_19_cases
tsline vixhigh vixlow
ssc inst sparkline
sparkline vixhigh vixlow covid_19_cases Date
sparkline vixhigh vixlow covid_19_cases Date, title("Time series Plot of VIX high, VIX low, and COVID-19 cases")
tsline covid_19_cases
tsline covid_19_cases, title("Time series plot of US COVID-19 cases")
tsline vixhigh vixlow, title("Time series plot of VIX high and VIX low")
tsset Date
newey vixhigh, lag(0)
newey vixhigh, lag(15)
