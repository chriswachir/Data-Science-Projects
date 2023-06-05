insheet using covid19italy.csv
generate Date = d(22jan2020)+_n-1
format Date %td
tsset Date
tsline italycovid19cases
tsline italycovid19cases, title("Time series plot of covid-19 cases in Italy")
