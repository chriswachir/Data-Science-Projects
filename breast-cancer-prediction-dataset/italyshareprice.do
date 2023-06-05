cd "C:\Users\HP\Desktop\Kimanzi 2020"
insheet using itally_economic_data.csv
generate Month = m(2019m1) + _n-1
format Month %tm
tsset Month
generate time = m(2019 jan) + _n-1
format time %tm
tsset time
tsline itallyshareprices, title(" Italy Share prices from 2019 Jan to 2020 March")
codebook itallyshareprices
