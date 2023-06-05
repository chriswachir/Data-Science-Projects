cd "C:\Users\HP\Desktop\Kimanzi 2020"
insheet using covid_econ.csv
br
generate Date = d(22jan2020) + _n-1
format Date %td
tsset Date
list
br
tsset Date
tsline covid_19_cases
codebook
help scatter
graph twoway scatter covid_19_cases vixhigh
twoway scatter vixhigh covid_19_cases
describe vixclose vixlow vixhigh vixopen
help cor
correlate covid_19_cases vixhigh
sum d vixhigh vixlow covid_19_cases
help hist
histogram vixopen
histogram vixhigh
regress vixhigh covid_19_cases
ssc inst sparkline
sparkline vixhigh vixlow covid_19_cases
