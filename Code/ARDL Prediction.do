
************ Reza Johari
*********** Prediction Do File
******** Gomrok
********01/09/1403


// cd "H:\RADrVesal\RA"


** Creating Export Estimation Data

* Sobat

use "Gomrok Data\DTA Data\export 1371" ,clear 

keep if country == "جمع"

forvalues i=1372/1393{
	
	append using "Gomrok Data\DTA Data\export `i'" , force
	keep if country == "جمع"
	
}

forvalues i=1395/1402{
	
	append using "Gomrok Data\DTA Data\export `i'" , force
	keep if country == "جمع"
	
}
append using "Gomrok Data\DTA Data\export 1394 country"
gen Exp_Imp = "export"

forvalues i=1371/1402{
	
	append using "Gomrok Data\DTA Data\import `i'" , force
	keep if country == "جمع"
	
	
}
replace Exp_Imp = "import" if Exp_Imp == ""

keep if country == "جمع"

keep year dollar Exp_Imp

merge n:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge n:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

keep if Exp_Imp == "export" | Exp_Imp == ""
fillmissing Exp_Imp
drop if year <1380 & year != .
drop H
sort Exp_Imp year

gen us_inflation = (us_cpi[_n] - us_cpi[_n-1])/ us_cpi[_n-1]
gen trade_growth = (dollar[_n] - dollar[_n-1]) / dollar[_n-1]

fillmissing us_inflation , with(previous)

keep year yearly_sii azad_growth_P2P real_gdp_growth_P2P inflation_P2P us_inflation trade_growth Exp_Imp
rename real_gdp_growth_P2P GDP_Growth
rename inflation_P2P inflation 
rename azad_growth_P2P Dollar_Growth


* Lags

tsset year 
gen lag_trade_growth = l.trade_growth
gen lag_us_inflation = l.us_inflation
gen lag_Dollar_Growth = l.Dollar_Growth
gen lag_inflation = l.inflation
gen lag_GDP_Growth = l.GDP_Growth
gen lag_sii = l.yearly_sii

* Multiple Varibles

gen GDP_gro_mult = lag_trade_growth * GDP_Growth
gen Dollar_Growth_mult = lag_trade_growth * Dollar_Growth
gen inflation_mult = lag_trade_growth * inflation
gen us_infl_mult = lag_trade_growth * us_inflation
gen sii_mult = lag_trade_growth * yearly_sii


* Multipling lags


gen lag_GDP_gro_mult = lag_trade_growth * lag_GDP_Growth
gen lag_Dollar_Growth_mult = lag_trade_growth * lag_Dollar_Growth
gen lag_inflation_mult = lag_trade_growth * lag_inflation
gen lag_us_infl_mult = lag_trade_growth * lag_us_inflation
gen lag_sii_mult = lag_trade_growth * lag_sii

fillmissing us_inflation , with(previous)

save "Gomrok Data\DTA Data\EstimationTotaldataexportSobat", replace



* Kahesh

use "Gomrok Data\DTA Data\export 1371" ,clear 

keep if country == "جمع"

forvalues i=1372/1393{
	
	append using "Gomrok Data\DTA Data\export `i'" , force
	keep if country == "جمع"
	
}

forvalues i=1395/1402{
	
	append using "Gomrok Data\DTA Data\export `i'" , force
	keep if country == "جمع"
	
}
append using "Gomrok Data\DTA Data\export 1394 country"
gen Exp_Imp = "export"

forvalues i=1371/1402{
	
	append using "Gomrok Data\DTA Data\import `i'" , force
	keep if country == "جمع"
	
	
}
replace Exp_Imp = "import" if Exp_Imp == ""

keep if country == "جمع"

keep year dollar Exp_Imp

merge n:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge n:1 year using  "Gomrok Data\DTA Data\P2PKahesh", nogen

keep if Exp_Imp == "export" | Exp_Imp == ""
fillmissing Exp_Imp

drop if year <1380 & year != .
drop H
sort Exp_Imp year

gen us_inflation = (us_cpi[_n] - us_cpi[_n-1])/ us_cpi[_n-1]
gen trade_growth = (dollar[_n] - dollar[_n-1]) / dollar[_n-1]
fillmissing us_inflation , with(previous)

keep year yearly_sii azad_growth_P2P real_gdp_growth_P2P inflation_P2P us_inflation trade_growth Exp_Imp
rename real_gdp_growth_P2P GDP_Growth
rename inflation_P2P inflation 
rename azad_growth_P2P Dollar_Growth



* Lags

tsset year 
gen lag_trade_growth = l.trade_growth
gen lag_us_inflation = l.us_inflation
gen lag_Dollar_Growth = l.Dollar_Growth
gen lag_inflation = l.inflation
gen lag_GDP_Growth = l.GDP_Growth
gen lag_sii = l.yearly_sii

* Multiple Varibles

gen GDP_gro_mult = lag_trade_growth * GDP_Growth
gen Dollar_Growth_mult = lag_trade_growth * Dollar_Growth
gen inflation_mult = lag_trade_growth * inflation
gen us_infl_mult = lag_trade_growth * us_inflation
gen sii_mult = lag_trade_growth * yearly_sii


* Multipling lags


gen lag_GDP_gro_mult = lag_trade_growth * lag_GDP_Growth
gen lag_Dollar_Growth_mult = lag_trade_growth * lag_Dollar_Growth
gen lag_inflation_mult = lag_trade_growth * lag_inflation
gen lag_us_infl_mult = lag_trade_growth * lag_us_inflation
gen lag_sii_mult = lag_trade_growth * lag_sii

fillmissing us_inflation , with(previous)

save "Gomrok Data\DTA Data\EstimationTotaldataexportKahesh", replace


* Afzayesh


* Kahesh

use "Gomrok Data\DTA Data\export 1371" ,clear 

keep if country == "جمع"

forvalues i=1372/1393{
	
	append using "Gomrok Data\DTA Data\export `i'" , force
	keep if country == "جمع"
	
}

forvalues i=1395/1402{
	
	append using "Gomrok Data\DTA Data\export `i'" , force
	keep if country == "جمع"
	
}
append using "Gomrok Data\DTA Data\export 1394 country"
gen Exp_Imp = "export"

forvalues i=1371/1402{
	
	append using "Gomrok Data\DTA Data\import `i'" , force
	keep if country == "جمع"
	
	
}
replace Exp_Imp = "import" if Exp_Imp == ""

keep if country == "جمع"

keep year dollar Exp_Imp

merge n:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge n:1 year using  "Gomrok Data\DTA Data\P2PAfzayesh", nogen

keep if Exp_Imp == "export" | Exp_Imp == ""
fillmissing Exp_Imp

drop if year <1380 & year != .
drop H
sort Exp_Imp year

gen us_inflation = (us_cpi[_n] - us_cpi[_n-1])/ us_cpi[_n-1]
gen trade_growth = (dollar[_n] - dollar[_n-1]) / dollar[_n-1]
fillmissing us_inflation , with(previous)

keep year yearly_sii azad_growth_P2P real_gdp_growth_P2P inflation_P2P us_inflation trade_growth Exp_Imp
rename real_gdp_growth_P2P GDP_Growth
rename inflation_P2P inflation 
rename azad_growth_P2P Dollar_Growth



* Lags

tsset year 
gen lag_trade_growth = l.trade_growth
gen lag_us_inflation = l.us_inflation
gen lag_Dollar_Growth = l.Dollar_Growth
gen lag_inflation = l.inflation
gen lag_GDP_Growth = l.GDP_Growth
gen lag_sii = l.yearly_sii

* Multiple Varibles

gen GDP_gro_mult = lag_trade_growth * GDP_Growth
gen Dollar_Growth_mult = lag_trade_growth * Dollar_Growth
gen inflation_mult = lag_trade_growth * inflation
gen us_infl_mult = lag_trade_growth * us_inflation
gen sii_mult = lag_trade_growth * yearly_sii


* Multipling lags


gen lag_GDP_gro_mult = lag_trade_growth * lag_GDP_Growth
gen lag_Dollar_Growth_mult = lag_trade_growth * lag_Dollar_Growth
gen lag_inflation_mult = lag_trade_growth * lag_inflation
gen lag_us_infl_mult = lag_trade_growth * lag_us_inflation
gen lag_sii_mult = lag_trade_growth * lag_sii

fillmissing us_inflation , with(previous)

save "Gomrok Data\DTA Data\EstimationTotaldataexportAfzayesh", replace





** Creating Import Estimation Data

* Sobat

use "Gomrok Data\DTA Data\export 1371" ,clear 

keep if country == "جمع"

forvalues i=1372/1393{
	
	append using "Gomrok Data\DTA Data\export `i'" , force
	keep if country == "جمع"
	
}

forvalues i=1395/1402{
	
	append using "Gomrok Data\DTA Data\export `i'" , force
	keep if country == "جمع"
	
}
append using "Gomrok Data\DTA Data\export 1394 country"
gen Exp_Imp = "export"

forvalues i=1371/1402{
	
	append using "Gomrok Data\DTA Data\import `i'" , force
	keep if country == "جمع"
	
	
}
replace Exp_Imp = "import" if Exp_Imp == ""

keep if country == "جمع"

keep year dollar Exp_Imp

merge n:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge n:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

keep if Exp_Imp == "import" | Exp_Imp == ""
fillmissing Exp_Imp

drop if year <1380
drop H
sort Exp_Imp year

gen us_inflation = (us_cpi[_n] - us_cpi[_n-1])/ us_cpi[_n-1]
gen trade_growth = (dollar[_n] - dollar[_n-1]) / dollar[_n-1]
fillmissing us_inflation , with(previous)

keep year yearly_sii azad_growth_P2P real_gdp_growth_P2P inflation_P2P us_inflation trade_growth Exp_Imp
rename real_gdp_growth_P2P GDP_Growth
rename inflation_P2P inflation 
rename azad_growth_P2P Dollar_Growth




* Lags

tsset year 
gen lag_trade_growth = l.trade_growth
gen lag_us_inflation = l.us_inflation
gen lag_Dollar_Growth = l.Dollar_Growth
gen lag_inflation = l.inflation
gen lag_GDP_Growth = l.GDP_Growth
gen lag_sii = l.yearly_sii

* Multiple Varibles

gen GDP_gro_mult = lag_trade_growth * GDP_Growth
gen Dollar_Growth_mult = lag_trade_growth * Dollar_Growth
gen inflation_mult = lag_trade_growth * inflation
gen us_infl_mult = lag_trade_growth * us_inflation
gen sii_mult = lag_trade_growth * yearly_sii


* Multipling lags


gen lag_GDP_gro_mult = lag_trade_growth * lag_GDP_Growth
gen lag_Dollar_Growth_mult = lag_trade_growth * lag_Dollar_Growth
gen lag_inflation_mult = lag_trade_growth * lag_inflation
gen lag_us_infl_mult = lag_trade_growth * lag_us_inflation
gen lag_sii_mult = lag_trade_growth * lag_sii

fillmissing us_inflation , with(previous)

save "Gomrok Data\DTA Data\EstimationTotaldataimportSobat", replace




* Kahesh

use "Gomrok Data\DTA Data\export 1371" ,clear 

keep if country == "جمع"

forvalues i=1372/1393{
	
	append using "Gomrok Data\DTA Data\export `i'" , force
	keep if country == "جمع"
	
}

forvalues i=1395/1402{
	
	append using "Gomrok Data\DTA Data\export `i'" , force
	keep if country == "جمع"
	
}
append using "Gomrok Data\DTA Data\export 1394 country"
gen Exp_Imp = "export"

forvalues i=1371/1402{
	
	append using "Gomrok Data\DTA Data\import `i'" , force
	keep if country == "جمع"
	
	
}
replace Exp_Imp = "import" if Exp_Imp == ""

keep if country == "جمع"

keep year dollar Exp_Imp

merge n:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge n:1 year using  "Gomrok Data\DTA Data\P2PKahesh", nogen

keep if Exp_Imp == "import" | Exp_Imp == ""
fillmissing Exp_Imp

drop if year <1380
drop H
sort Exp_Imp year

gen us_inflation = (us_cpi[_n] - us_cpi[_n-1])/ us_cpi[_n-1]
gen trade_growth = (dollar[_n] - dollar[_n-1]) / dollar[_n-1]
fillmissing us_inflation , with(previous)

keep year yearly_sii azad_growth_P2P real_gdp_growth_P2P inflation_P2P us_inflation trade_growth Exp_Imp
rename real_gdp_growth_P2P GDP_Growth
rename inflation_P2P inflation 
rename azad_growth_P2P Dollar_Growth




* Lags

tsset year 
gen lag_trade_growth = l.trade_growth
gen lag_us_inflation = l.us_inflation
gen lag_Dollar_Growth = l.Dollar_Growth
gen lag_inflation = l.inflation
gen lag_GDP_Growth = l.GDP_Growth
gen lag_sii = l.yearly_sii

* Multiple Varibles

gen GDP_gro_mult = lag_trade_growth * GDP_Growth
gen Dollar_Growth_mult = lag_trade_growth * Dollar_Growth
gen inflation_mult = lag_trade_growth * inflation
gen us_infl_mult = lag_trade_growth * us_inflation
gen sii_mult = lag_trade_growth * yearly_sii


* Multipling lags


gen lag_GDP_gro_mult = lag_trade_growth * lag_GDP_Growth
gen lag_Dollar_Growth_mult = lag_trade_growth * lag_Dollar_Growth
gen lag_inflation_mult = lag_trade_growth * lag_inflation
gen lag_us_infl_mult = lag_trade_growth * lag_us_inflation
gen lag_sii_mult = lag_trade_growth * lag_sii

fillmissing us_inflation , with(previous)

save "Gomrok Data\DTA Data\EstimationTotaldataimportKahesh", replace




* Afzayesh

use "Gomrok Data\DTA Data\export 1371" ,clear 

keep if country == "جمع"

forvalues i=1372/1393{
	
	append using "Gomrok Data\DTA Data\export `i'" , force
	keep if country == "جمع"
	
}

forvalues i=1395/1402{
	
	append using "Gomrok Data\DTA Data\export `i'" , force
	keep if country == "جمع"
	
}
append using "Gomrok Data\DTA Data\export 1394 country"
gen Exp_Imp = "export"

forvalues i=1371/1402{
	
	append using "Gomrok Data\DTA Data\import `i'" , force
	keep if country == "جمع"
	
	
}
replace Exp_Imp = "import" if Exp_Imp == ""

keep if country == "جمع"

keep year dollar Exp_Imp

merge n:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge n:1 year using  "Gomrok Data\DTA Data\P2PAfzayesh", nogen

keep if Exp_Imp == "import" | Exp_Imp == ""
fillmissing Exp_Imp

drop if year <1380
drop H
sort Exp_Imp year

gen us_inflation = (us_cpi[_n] - us_cpi[_n-1])/ us_cpi[_n-1]
gen trade_growth = (dollar[_n] - dollar[_n-1]) / dollar[_n-1]
fillmissing us_inflation , with(previous)

keep year yearly_sii azad_growth_P2P real_gdp_growth_P2P inflation_P2P us_inflation trade_growth Exp_Imp
rename real_gdp_growth_P2P GDP_Growth
rename inflation_P2P inflation 
rename azad_growth_P2P Dollar_Growth




* Lags

tsset year 
gen lag_trade_growth = l.trade_growth
gen lag_us_inflation = l.us_inflation
gen lag_Dollar_Growth = l.Dollar_Growth
gen lag_inflation = l.inflation
gen lag_GDP_Growth = l.GDP_Growth
gen lag_sii = l.yearly_sii

* Multiple Varibles

gen GDP_gro_mult = lag_trade_growth * GDP_Growth
gen Dollar_Growth_mult = lag_trade_growth * Dollar_Growth
gen inflation_mult = lag_trade_growth * inflation
gen us_infl_mult = lag_trade_growth * us_inflation
gen sii_mult = lag_trade_growth * yearly_sii


* Multipling lags


gen lag_GDP_gro_mult = lag_trade_growth * lag_GDP_Growth
gen lag_Dollar_Growth_mult = lag_trade_growth * lag_Dollar_Growth
gen lag_inflation_mult = lag_trade_growth * lag_inflation
gen lag_us_infl_mult = lag_trade_growth * lag_us_inflation
gen lag_sii_mult = lag_trade_growth * lag_sii

fillmissing us_inflation , with(previous)

save "Gomrok Data\DTA Data\EstimationTotaldataimportAfzayesh", replace





**** Making the Excel Ready

putexcel set "Results\Results", modify sheet("ARDL Estimation")
putexcel K2 = "Export"
putexcel K3 = "Train set"
putexcel F4 = "All Goods"
putexcel Q4 = "Manufacturing Food"
putexcel K4 = "Food"
putexcel E5 = "RMSE"
putexcel F5 = "RRMSE"
putexcel G5 = "MAPE"
putexcel J5 = "RMSE"
putexcel K5 = "RRMSE"
putexcel L5 = "MAPE"
putexcel P5 = "RMSE"
putexcel Q5 = "RRMSE"
putexcel R5 = "MAPE"
putexcel K15 = "Test set"
putexcel F17 = "All Goods"
putexcel K17 = "Food"
putexcel Q17 = "Manufacturing Food"
putexcel E17 = "RMSE"
putexcel F17 = "RRMSE"
putexcel G17 = "MAPE"
putexcel J17 = "RMSE"
putexcel K17 = "RRMSE"
putexcel L17 = "MAPE"
putexcel P17 = "RMSE"
putexcel Q17 = "RRMSE"
putexcel R17 = "MAPE"
putexcel D6 = "model1"
putexcel D7 = "model2"
putexcel D8 = "model3"
putexcel D9 = "model4"
putexcel D10 = "model5"
putexcel D18 = "model1"
putexcel D19 = "model2"
putexcel D20 = "model3"
putexcel D21 = "model4"
putexcel D22 = "model5"
putexcel F16 = "All Goods"
putexcel K16 = "Food"
putexcel Q16 = "Manufacturing Food"

* import

putexcel K25 = "Import"
putexcel K26 = "Train set"
putexcel F27 = "All Goods"
putexcel Q27 = "Manufacturing Food"
putexcel K27 = "Food"
putexcel E28 = "RMSE"
putexcel F28 = "RRMSE"
putexcel G28 = "MAPE"
putexcel J28 = "RMSE"
putexcel K28 = "RRMSE"
putexcel L28 = "MAPE"
putexcel P28 = "RMSE"
putexcel Q28 = "RRMSE"
putexcel R28 = "MAPE"
putexcel K35 = "Test set"
putexcel F36 = "All Goods"
putexcel K36 = "Food"
putexcel Q36 = "Manufacturing Food"
putexcel E37 = "RMSE"
putexcel F37 = "RRMSE"
putexcel G37 = "MAPE"
putexcel J37 = "RMSE"
putexcel K37 = "RRMSE"
putexcel L37 = "MAPE"
putexcel P37 = "RMSE"
putexcel Q37 = "RRMSE"
putexcel R37 = "MAPE"
putexcel D29 = "model1"
putexcel D30 = "model2"
putexcel D31 = "model3"
putexcel D32 = "model4"
putexcel D33 = "model5"
putexcel D38 = "model1"
putexcel D39 = "model2"
putexcel D40 = "model3"
putexcel D41 = "model4"
putexcel D42 = "model5"
putexcel F36 = "All Goods"
putexcel K36= "Food"
putexcel Q36 = "Manufacturing Food"




***** Globals

global model1 "lag_trade_growth"
global model2 "lag_trade_growth yearly_sii Dollar_Growth GDP_Growth inflation us_inflation"
global model3 "lag_trade_growth yearly_sii Dollar_Growth GDP_Growth inflation us_inflation sii_mult us_infl_mult inflation_mult Dollar_Growth_mult GDP_gro_mult"
global model4 "lag_trade_growth yearly_sii Dollar_Growth GDP_Growth inflation us_inflation lag_us_inflation lag_Dollar_Growth lag_inflation lag_GDP_Growth lag_sii"
global model5 "lag_trade_growth yearly_sii Dollar_Growth GDP_Growth inflation us_inflation sii_mult us_infl_mult inflation_mult Dollar_Growth_mult GDP_gro_mult lag_GDP_gro_mult lag_Dollar_Growth_mult lag_inflation_mult lag_us_infl_mult lag_sii_mult"


*** Starting the prediction for Total Data Goods

** for export

*** Models for Export based on total export goods


local q=6
local p=18
forvalues i=1/5 {
    
    use "Gomrok Data\DTA Data\EstimationTotaldataexportSobat",clear
    keep if year < 1403
	reg trade_growth ${model`i'}  if year < 1400
	predict prediction

	** Train coefs
	gen diff_train = trade_growth - prediction if year < 1400
	gen diff2_train = diff_train ^ 2
	egen diff2_train_sum = sum(diff2_train)
	egen n_train = count(diff2_train) 
	egen y_mean_train = mean(trade_growth)  if year < 1400

	gen diff_der_train = abs(diff_train / trade_growth)
	egen diff_der_train_sum = sum(diff_der_train)

	gen RMSE_train = sqrt(diff2_train_sum / n_train)
	gen RRMSE_train = RMSE_train / y_mean_train
	gen MAPE_train = (diff_der_train_sum / n_train) * 100


	** test coefs

	gen diff_test = trade_growth - prediction if year >= 1400
	gen diff2_test = diff_test ^ 2
	egen diff2_test_sum = sum(diff2_test)
	egen n_test = count(diff2_test)
	egen y_mean_test = mean(trade_growth) if year >=1400

	gen diff_der_test = abs(diff_test / trade_growth)
	egen diff_der_test_sum = sum(diff_der_test)

	gen RMSE_test = sqrt(diff2_test_sum / n_test)
	gen RRMSE_test = RMSE_test / y_mean_test
	gen MAPE_test = (diff_der_test_sum / n_test) * 100

	fillmissing RMSE_train RRMSE_train MAPE_train RMSE_test RRMSE_test MAPE_test
	
	scalar RMSE_train = RMSE_train
	scalar RRMSE_train = RRMSE_train
	scalar MAPE_train = MAPE_train
	scalar RMSE_test = RMSE_test
	scalar RRMSE_test = RRMSE_test
	scalar MAPE_test = MAPE_test

	putexcel set "Results\Results", modify sheet("ARDL Estimation")
	putexcel E`q' = RMSE_train
	putexcel F`q' = RRMSE_train
	putexcel G`q' = MAPE_train
	putexcel E`p' = RMSE_test
	putexcel F`p' = RRMSE_test
	putexcel G`p' = MAPE_test

local q= `q' + 1
local p = `p' + 1	
}


* Import


local q=29
local p=38
forvalues i=1/5 {
    
    use "Gomrok Data\DTA Data\EstimationTotaldataimportSobat",clear
    keep if year < 1403
	reg trade_growth ${model`i'}  if year < 1400
	predict prediction

	** Train coefs
	gen diff_train = trade_growth - prediction if year < 1400
	gen diff2_train = diff_train ^ 2
	egen diff2_train_sum = sum(diff2_train)
	egen n_train = count(diff2_train) 
	egen y_mean_train = mean(trade_growth)  if year < 1400

	gen diff_der_train = abs(diff_train / trade_growth)
	egen diff_der_train_sum = sum(diff_der_train)

	gen RMSE_train = sqrt(diff2_train_sum / n_train)
	gen RRMSE_train = RMSE_train / y_mean_train
	gen MAPE_train = (diff_der_train_sum / n_train) * 100


	** test coefs

	gen diff_test = trade_growth - prediction if year >= 1400
	gen diff2_test = diff_test ^ 2
	egen diff2_test_sum = sum(diff2_test)
	egen n_test = count(diff2_test)
	egen y_mean_test = mean(trade_growth) if year >=1400

	gen diff_der_test = abs(diff_test / trade_growth)
	egen diff_der_test_sum = sum(diff_der_test)

	gen RMSE_test = sqrt(diff2_test_sum / n_test)
	gen RRMSE_test = RMSE_test / y_mean_test
	gen MAPE_test = (diff_der_test_sum / n_test) * 100

	fillmissing RMSE_train RRMSE_train MAPE_train RMSE_test RRMSE_test MAPE_test
	
	scalar RMSE_train = RMSE_train
	scalar RRMSE_train = RRMSE_train
	scalar MAPE_train = MAPE_train
	scalar RMSE_test = RMSE_test
	scalar RRMSE_test = RRMSE_test
	scalar MAPE_test = MAPE_test

	putexcel set "Results\Results", modify sheet("ARDL Estimation")
	putexcel E`q' = RMSE_train
	putexcel F`q' = RRMSE_train
	putexcel G`q' = MAPE_train
	putexcel E`p' = RMSE_test
	putexcel F`p' = RRMSE_test
	putexcel G`p' = MAPE_test

local q= `q' + 1
local p = `p' + 1	
}


*** Food

*Export

use "Gomrok Data\DTA Data\unified\Import Data unified", clear
append using "Gomrok Data\DTA Data\unified\export Data unified"

gen food = 1 if substr(ISIC3, 1, 2) == "01" |substr(ISIC3, 1, 2) == "05" | substr(ISIC3, 1, 2) == "15"

keep if Exp_Imp == "export" & food == 1

collapse (sum) dollar (firstnm) Exp_Imp , by(year)

merge n:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge n:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

keep if year >=1380

drop if year <1380
drop H
drop if year == .
sort year

gen us_inflation = (us_cpi[_n] - us_cpi[_n-1])/ us_cpi[_n-1]
gen trade_growth = (dollar[_n] - dollar[_n-1]) / dollar[_n-1]
fillmissing us_inflation , with(previous)

keep year yearly_sii azad_growth_P2P real_gdp_growth_P2P inflation_P2P us_inflation trade_growth Exp_Imp
rename real_gdp_growth_P2P GDP_Growth
rename inflation_P2P inflation 
rename azad_growth_P2P Dollar_Growth




* Lags

tsset year 
gen lag_trade_growth = l.trade_growth
gen lag_us_inflation = l.us_inflation
gen lag_Dollar_Growth = l.Dollar_Growth
gen lag_inflation = l.inflation
gen lag_GDP_Growth = l.GDP_Growth
gen lag_sii = l.yearly_sii

* Multiple Varibles

gen GDP_gro_mult = lag_trade_growth * GDP_Growth
gen Dollar_Growth_mult = lag_trade_growth * Dollar_Growth
gen inflation_mult = lag_trade_growth * inflation
gen us_infl_mult = lag_trade_growth * us_inflation
gen sii_mult = lag_trade_growth * yearly_sii


* Multipling lags


gen lag_GDP_gro_mult = lag_trade_growth * lag_GDP_Growth
gen lag_Dollar_Growth_mult = lag_trade_growth * lag_Dollar_Growth
gen lag_inflation_mult = lag_trade_growth * lag_inflation
gen lag_us_infl_mult = lag_trade_growth * lag_us_inflation
gen lag_sii_mult = lag_trade_growth * lag_sii


save "Gomrok Data\DTA Data\EstimationfoodexportSobat", replace



*Import

use "Gomrok Data\DTA Data\unified\Import Data unified", clear
append using "Gomrok Data\DTA Data\unified\export Data unified"

gen food = 1 if substr(ISIC3, 1, 2) == "01" |substr(ISIC3, 1, 2) == "05" | substr(ISIC3, 1, 2) == "15"

keep if Exp_Imp == "import" & food == 1

collapse (sum) dollar (firstnm) Exp_Imp , by(year)

merge n:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge n:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

keep if year >=1380

drop if year <1380
drop H
drop if year == .
sort year

gen us_inflation = (us_cpi[_n] - us_cpi[_n-1])/ us_cpi[_n-1]
gen trade_growth = (dollar[_n] - dollar[_n-1]) / dollar[_n-1]
fillmissing us_inflation , with(previous)

keep year yearly_sii azad_growth_P2P real_gdp_growth_P2P inflation_P2P us_inflation trade_growth Exp_Imp
rename real_gdp_growth_P2P GDP_Growth
rename inflation_P2P inflation 
rename azad_growth_P2P Dollar_Growth


* Lags

tsset year 
gen lag_trade_growth = l.trade_growth
gen lag_us_inflation = l.us_inflation
gen lag_Dollar_Growth = l.Dollar_Growth
gen lag_inflation = l.inflation
gen lag_GDP_Growth = l.GDP_Growth
gen lag_sii = l.yearly_sii

* Multiple Varibles

gen GDP_gro_mult = lag_trade_growth * GDP_Growth
gen Dollar_Growth_mult = lag_trade_growth * Dollar_Growth
gen inflation_mult = lag_trade_growth * inflation
gen us_infl_mult = lag_trade_growth * us_inflation
gen sii_mult = lag_trade_growth * yearly_sii


* Multipling lags


gen lag_GDP_gro_mult = lag_trade_growth * lag_GDP_Growth
gen lag_Dollar_Growth_mult = lag_trade_growth * lag_Dollar_Growth
gen lag_inflation_mult = lag_trade_growth * lag_inflation
gen lag_us_infl_mult = lag_trade_growth * lag_us_inflation
gen lag_sii_mult = lag_trade_growth * lag_sii


save "Gomrok Data\DTA Data\EstimationfoodimportSobat", replace



*** Starting the prediction for Food

** for export

*** Models for Export based on Food

local q=6
local p=18
forvalues i=1/5 {
    
    use "Gomrok Data\DTA Data\EstimationfoodexportSobat",clear
    keep if year < 1403
	reg trade_growth ${model`i'}  if year < 1400
	predict prediction

	** Train coefs
	gen diff_train = trade_growth - prediction if year < 1400
	gen diff2_train = diff_train ^ 2
	egen diff2_train_sum = sum(diff2_train)
	egen n_train = count(diff2_train) 
	egen y_mean_train = mean(trade_growth)  if year < 1400

	gen diff_der_train = abs(diff_train / trade_growth)
	egen diff_der_train_sum = sum(diff_der_train)

	gen RMSE_train = sqrt(diff2_train_sum / n_train)
	gen RRMSE_train = RMSE_train / y_mean_train
	gen MAPE_train = (diff_der_train_sum / n_train) * 100


	** test coefs

	gen diff_test = trade_growth - prediction if year >= 1400
	gen diff2_test = diff_test ^ 2
	egen diff2_test_sum = sum(diff2_test)
	egen n_test = count(diff2_test)
	egen y_mean_test = mean(trade_growth) if year >=1400

	gen diff_der_test = abs(diff_test / trade_growth)
	egen diff_der_test_sum = sum(diff_der_test)

	gen RMSE_test = sqrt(diff2_test_sum / n_test)
	gen RRMSE_test = RMSE_test / y_mean_test
	gen MAPE_test = (diff_der_test_sum / n_test) * 100

	fillmissing RMSE_train RRMSE_train MAPE_train RMSE_test RRMSE_test MAPE_test
	
	scalar RMSE_train = RMSE_train
	scalar RRMSE_train = RRMSE_train
	scalar MAPE_train = MAPE_train
	scalar RMSE_test = RMSE_test
	scalar RRMSE_test = RRMSE_test
	scalar MAPE_test = MAPE_test

	putexcel set "Results\Results", modify sheet("ARDL Estimation")
	putexcel J`q' = RMSE_train
	putexcel K`q' = RRMSE_train
	putexcel L`q' = MAPE_train
	putexcel J`p' = RMSE_test
	putexcel K`p' = RRMSE_test
	putexcel L`p' = MAPE_test

local q= `q' + 1
local p = `p' + 1	
}


* Import

local q=29
local p=38
forvalues i=1/5 {
    
    use "Gomrok Data\DTA Data\EstimationfoodimportSobat",clear
    keep if year < 1403
	reg trade_growth ${model`i'}  if year < 1400
	predict prediction

	** Train coefs
	gen diff_train = trade_growth - prediction if year < 1400
	gen diff2_train = diff_train ^ 2
	egen diff2_train_sum = sum(diff2_train)
	egen n_train = count(diff2_train) 
	egen y_mean_train = mean(trade_growth)  if year < 1400

	gen diff_der_train = abs(diff_train / trade_growth)
	egen diff_der_train_sum = sum(diff_der_train)

	gen RMSE_train = sqrt(diff2_train_sum / n_train)
	gen RRMSE_train = RMSE_train / y_mean_train
	gen MAPE_train = (diff_der_train_sum / n_train) * 100


	** test coefs

	gen diff_test = trade_growth - prediction if year >= 1400
	gen diff2_test = diff_test ^ 2
	egen diff2_test_sum = sum(diff2_test)
	egen n_test = count(diff2_test)
	egen y_mean_test = mean(trade_growth) if year >=1400

	gen diff_der_test = abs(diff_test / trade_growth)
	egen diff_der_test_sum = sum(diff_der_test)

	gen RMSE_test = sqrt(diff2_test_sum / n_test)
	gen RRMSE_test = RMSE_test / y_mean_test
	gen MAPE_test = (diff_der_test_sum / n_test) * 100

	fillmissing RMSE_train RRMSE_train MAPE_train RMSE_test RRMSE_test MAPE_test
	
	scalar RMSE_train = RMSE_train
	scalar RRMSE_train = RRMSE_train
	scalar MAPE_train = MAPE_train
	scalar RMSE_test = RMSE_test
	scalar RRMSE_test = RRMSE_test
	scalar MAPE_test = MAPE_test

	putexcel set "Results\Results", modify sheet("ARDL Estimation")
	putexcel J`q' = RMSE_train
	putexcel K`q' = RRMSE_train
	putexcel L`q' = MAPE_train
	putexcel J`p' = RMSE_test
	putexcel K`p' = RRMSE_test
	putexcel L`p' = MAPE_test

local q= `q' + 1
local p = `p' + 1	
}




*** Food Manufacturing

*Export

use "Gomrok Data\DTA Data\unified\Import Data unified", clear
append using "Gomrok Data\DTA Data\unified\export Data unified"

gen food_man = 1 if  substr(ISIC3, 1, 2) == "15"  & ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554"

keep if Exp_Imp == "export" & food_man == 1

collapse (sum) dollar (firstnm) Exp_Imp , by(year)

merge n:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge n:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

keep if year >=1380

drop if year <1380
drop H
drop if year == .
sort year


gen us_inflation = (us_cpi[_n] - us_cpi[_n-1])/ us_cpi[_n-1]
gen trade_growth = (dollar[_n] - dollar[_n-1]) / dollar[_n-1]
fillmissing us_inflation , with(previous)

keep year yearly_sii azad_growth_P2P real_gdp_growth_P2P inflation_P2P us_inflation trade_growth Exp_Imp
rename real_gdp_growth_P2P GDP_Growth
rename inflation_P2P inflation 
rename azad_growth_P2P Dollar_Growth


* Lags

tsset year 
gen lag_trade_growth = l.trade_growth
gen lag_us_inflation = l.us_inflation
gen lag_Dollar_Growth = l.Dollar_Growth
gen lag_inflation = l.inflation
gen lag_GDP_Growth = l.GDP_Growth
gen lag_sii = l.yearly_sii

* Multiple Varibles

gen GDP_gro_mult = lag_trade_growth * GDP_Growth
gen Dollar_Growth_mult = lag_trade_growth * Dollar_Growth
gen inflation_mult = lag_trade_growth * inflation
gen us_infl_mult = lag_trade_growth * us_inflation
gen sii_mult = lag_trade_growth * yearly_sii


* Multipling lags


gen lag_GDP_gro_mult = lag_trade_growth * lag_GDP_Growth
gen lag_Dollar_Growth_mult = lag_trade_growth * lag_Dollar_Growth
gen lag_inflation_mult = lag_trade_growth * lag_inflation
gen lag_us_infl_mult = lag_trade_growth * lag_us_inflation
gen lag_sii_mult = lag_trade_growth * lag_sii


save "Gomrok Data\DTA Data\EstimationfoodmanuexportSobat", replace



*Import

use "Gomrok Data\DTA Data\unified\Import Data unified", clear
append using "Gomrok Data\DTA Data\unified\export Data unified"

gen food_man = 1 if substr(ISIC3, 1, 2) == "15"

keep if Exp_Imp == "import" & food_man == 1

collapse (sum) dollar (firstnm) Exp_Imp , by(year)

merge n:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge n:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

keep if year >=1380

drop if year <1380
drop H
drop if year == .
sort year

gen us_inflation = (us_cpi[_n] - us_cpi[_n-1])/ us_cpi[_n-1]
gen trade_growth = (dollar[_n] - dollar[_n-1]) / dollar[_n-1]
fillmissing us_inflation , with(previous)

keep year yearly_sii azad_growth_P2P real_gdp_growth_P2P inflation_P2P us_inflation trade_growth Exp_Imp
rename real_gdp_growth_P2P GDP_Growth
rename inflation_P2P inflation 
rename azad_growth_P2P Dollar_Growth



* Lags

tsset year 
gen lag_trade_growth = l.trade_growth
gen lag_us_inflation = l.us_inflation
gen lag_Dollar_Growth = l.Dollar_Growth
gen lag_inflation = l.inflation
gen lag_GDP_Growth = l.GDP_Growth
gen lag_sii = l.yearly_sii

* Multiple Varibles

gen GDP_gro_mult = lag_trade_growth * GDP_Growth
gen Dollar_Growth_mult = lag_trade_growth * Dollar_Growth
gen inflation_mult = lag_trade_growth * inflation
gen us_infl_mult = lag_trade_growth * us_inflation
gen sii_mult = lag_trade_growth * yearly_sii


* Multipling lags


gen lag_GDP_gro_mult = lag_trade_growth * lag_GDP_Growth
gen lag_Dollar_Growth_mult = lag_trade_growth * lag_Dollar_Growth
gen lag_inflation_mult = lag_trade_growth * lag_inflation
gen lag_us_infl_mult = lag_trade_growth * lag_us_inflation
gen lag_sii_mult = lag_trade_growth * lag_sii


save "Gomrok Data\DTA Data\EstimationfoodmanuimportSobat", replace


*** Starting the prediction for Food

** for export

*** Models for Export based on Food

local q=6
local p=18
forvalues i=1/5 {
    
    use "Gomrok Data\DTA Data\EstimationfoodmanuexportSobat",clear
    keep if year < 1403
	reg trade_growth ${model`i'}  if year < 1400
	predict prediction

	** Train coefs
	gen diff_train = trade_growth - prediction if year < 1400
	gen diff2_train = diff_train ^ 2
	egen diff2_train_sum = sum(diff2_train)
	egen n_train = count(diff2_train) 
	egen y_mean_train = mean(trade_growth)  if year < 1400

	gen diff_der_train = abs(diff_train / trade_growth)
	egen diff_der_train_sum = sum(diff_der_train)

	gen RMSE_train = sqrt(diff2_train_sum / n_train)
	gen RRMSE_train = RMSE_train / y_mean_train
	gen MAPE_train = (diff_der_train_sum / n_train) * 100


	** test coefs

	gen diff_test = trade_growth - prediction if year >= 1400
	gen diff2_test = diff_test ^ 2
	egen diff2_test_sum = sum(diff2_test)
	egen n_test = count(diff2_test)
	egen y_mean_test = mean(trade_growth) if year >=1400

	gen diff_der_test = abs(diff_test / trade_growth)
	egen diff_der_test_sum = sum(diff_der_test)

	gen RMSE_test = sqrt(diff2_test_sum / n_test)
	gen RRMSE_test = RMSE_test / y_mean_test
	gen MAPE_test = (diff_der_test_sum / n_test) * 100

	fillmissing RMSE_train RRMSE_train MAPE_train RMSE_test RRMSE_test MAPE_test
	
	scalar RMSE_train = RMSE_train
	scalar RRMSE_train = RRMSE_train
	scalar MAPE_train = MAPE_train
	scalar RMSE_test = RMSE_test
	scalar RRMSE_test = RRMSE_test
	scalar MAPE_test = MAPE_test

	putexcel set "Results\Results", modify sheet("ARDL Estimation")
	putexcel P`q' = RMSE_train
	putexcel Q`q' = RRMSE_train
	putexcel R`q' = MAPE_train
	putexcel P`p' = RMSE_test
	putexcel Q`p' = RRMSE_test
	putexcel R`p' = MAPE_test

local q= `q' + 1
local p = `p' + 1	
}


* Import

local q=29
local p=38
forvalues i=1/5 {
    
    use "Gomrok Data\DTA Data\EstimationfoodmanuimportSobat",clear
    keep if year < 1403
	
	reg trade_growth ${model`i'}  if year < 1400
	predict prediction

	** Train coefs
	gen diff_train = trade_growth - prediction if year < 1400
	gen diff2_train = diff_train ^ 2
	egen diff2_train_sum = sum(diff2_train)
	egen n_train = count(diff2_train) 
	egen y_mean_train = mean(trade_growth)  if year < 1400

	gen diff_der_train = abs(diff_train / trade_growth)
	egen diff_der_train_sum = sum(diff_der_train)

	gen RMSE_train = sqrt(diff2_train_sum / n_train)
	gen RRMSE_train = RMSE_train / y_mean_train
	gen MAPE_train = (diff_der_train_sum / n_train) * 100


	** test coefs

	gen diff_test = trade_growth - prediction if year >= 1400
	gen diff2_test = diff_test ^ 2
	egen diff2_test_sum = sum(diff2_test)
	egen n_test = count(diff2_test)
	egen y_mean_test = mean(trade_growth) if year >=1400

	gen diff_der_test = abs(diff_test / trade_growth)
	egen diff_der_test_sum = sum(diff_der_test)

	gen RMSE_test = sqrt(diff2_test_sum / n_test)
	gen RRMSE_test = RMSE_test / y_mean_test
	gen MAPE_test = (diff_der_test_sum / n_test) * 100

	fillmissing RMSE_train RRMSE_train MAPE_train RMSE_test RRMSE_test MAPE_test
	
	scalar RMSE_train = RMSE_train
	scalar RRMSE_train = RRMSE_train
	scalar MAPE_train = MAPE_train
	scalar RMSE_test = RMSE_test
	scalar RRMSE_test = RRMSE_test
	scalar MAPE_test = MAPE_test

	putexcel set "Results\Results", modify sheet("ARDL Estimation")
	putexcel P`q' = RMSE_train
	putexcel Q`q' = RRMSE_train
	putexcel R`q' = MAPE_train
	putexcel P`p' = RMSE_test
	putexcel Q`p' = RRMSE_test
	putexcel R`p' = MAPE_test

local q= `q' + 1
local p = `p' + 1	
}






*******Export Prediction

**** Prediction Export Sobat Tahrim

global model2 "lag_trade_growth yearly_sii Dollar_Growth GDP_Growth inflation us_inflation"

use "Gomrok Data\DTA Data\EstimationTotaldataexportSobat",clear
    
fillmissing Exp_Imp

reg trade_growth $model2 if year < 1402
predict prediction1

replace trade_growth = prediction1 if year == 1403


***
tsset year 
replace lag_trade_growth = l.trade_growth

reg trade_growth $model2 if year < 1402
predict prediction2

replace trade_growth = prediction2 if year == 1404


***
tsset year 
replace lag_trade_growth = l.trade_growth


reg trade_growth $model2 if year < 1402
predict prediction3

replace trade_growth = prediction3 if year == 1405

rename trade_growth trade_growth_export_Sobat
keep year trade_growth_export_Sobat

save "Gomrok Data\DTA Data\tradegrowthexportsobat", replace



**** Prediction Export Kahesh Tahrim

global model2 "lag_trade_growth yearly_sii Dollar_Growth GDP_Growth inflation us_inflation"

use "Gomrok Data\DTA Data\EstimationTotaldataexportKahesh",clear
    
fillmissing Exp_Imp

reg trade_growth $model2 if year < 1402
predict prediction1

replace trade_growth = prediction1 if year == 1403


***
tsset year 
replace lag_trade_growth = l.trade_growth

reg trade_growth $model2 if year < 1402
predict prediction2

replace trade_growth = prediction2 if year == 1404


***
tsset year 
replace lag_trade_growth = l.trade_growth


reg trade_growth $model2 if year < 1402
predict prediction3

replace trade_growth = prediction3 if year == 1405

rename trade_growth trade_growth_export_Kahesh
keep year trade_growth_export_Kahesh

save "Gomrok Data\DTA Data\tradegrowthexportKahesh", replace



**** Prediction Export Afzayesh Tahrim

global model2 "lag_trade_growth yearly_sii Dollar_Growth GDP_Growth inflation us_inflation"

use "Gomrok Data\DTA Data\EstimationTotaldataexportAfzayesh",clear
    
fillmissing Exp_Imp

reg trade_growth $model2 if year < 1402
predict prediction1

replace trade_growth = prediction1 if year == 1403


***
tsset year 
replace lag_trade_growth = l.trade_growth

reg trade_growth $model2 if year < 1402
predict prediction2

replace trade_growth = prediction2 if year == 1404


***
tsset year 
replace lag_trade_growth = l.trade_growth


reg trade_growth $model2 if year < 1402
predict prediction3

replace trade_growth = prediction3 if year == 1405

rename trade_growth trade_growth_export_Afzayesh
keep year trade_growth_export_Afzayesh

save "Gomrok Data\DTA Data\tradegrowthexportAfzayesh", replace




*******Import Prediction


**** Prediction Import Sobat Tahrim

global model2 "lag_trade_growth yearly_sii Dollar_Growth GDP_Growth inflation us_inflation"

use "Gomrok Data\DTA Data\EstimationTotaldataimportSobat",clear
    
fillmissing Exp_Imp

reg trade_growth $model2 if year < 1402
predict prediction1

replace trade_growth = prediction1 if year == 1403


***
tsset year 
replace lag_trade_growth = l.trade_growth

reg trade_growth $model2 if year < 1402
predict prediction2

replace trade_growth = prediction2 if year == 1404


***
tsset year 
replace lag_trade_growth = l.trade_growth


reg trade_growth $model2 if year < 1402
predict prediction3

replace trade_growth = prediction3 if year == 1405

rename trade_growth trade_growth_import_Sobat
keep year trade_growth_import_Sobat

save "Gomrok Data\DTA Data\tradegrowthimportsobat", replace



**** Prediction Import Kahesh Tahrim

global model2 "lag_trade_growth yearly_sii Dollar_Growth GDP_Growth inflation us_inflation"

use "Gomrok Data\DTA Data\EstimationTotaldataimportKahesh",clear
    
fillmissing Exp_Imp

reg trade_growth $model2 if year < 1402
predict prediction1

replace trade_growth = prediction1 if year == 1403


***
tsset year 
replace lag_trade_growth = l.trade_growth

reg trade_growth $model2 if year < 1402
predict prediction2

replace trade_growth = prediction2 if year == 1404


***
tsset year 
replace lag_trade_growth = l.trade_growth


reg trade_growth $model2 if year < 1402
predict prediction3

replace trade_growth = prediction3 if year == 1405

rename trade_growth trade_growth_import_Kahesh
keep year trade_growth_import_Kahesh

save "Gomrok Data\DTA Data\tradegrowthimportKahesh", replace



**** Prediction Export Afzayesh Tahrim

global model2 "lag_trade_growth yearly_sii Dollar_Growth GDP_Growth inflation us_inflation"

use "Gomrok Data\DTA Data\EstimationTotaldataimportAfzayesh",clear
    
fillmissing Exp_Imp

reg trade_growth $model2 if year < 1402
predict prediction1

replace trade_growth = prediction1 if year == 1403


***
tsset year 
replace lag_trade_growth = l.trade_growth

reg trade_growth $model2 if year < 1402
predict prediction2

replace trade_growth = prediction2 if year == 1404


***
tsset year 
replace lag_trade_growth = l.trade_growth


reg trade_growth $model2 if year < 1402
predict prediction3

replace trade_growth = prediction3 if year == 1405

rename trade_growth trade_growth_import_Afzayesh
keep year trade_growth_import_Afzayesh

save "Gomrok Data\DTA Data\tradegrowthimportAfzayesh", replace




*** Total Export Goods

* Export

use "Gomrok Data\DTA Data\cleaned\Aggregategoodstrade", clear

replace Total_Excel_dollar = Total_Excel_dollar /1000000000

sort year


keep if Exp_Imp == "export"
keep year Total_Excel_dollar

save "Gomrok Data\DTA Data\totalgoodsexport", replace


* Import

use "Gomrok Data\DTA Data\cleaned\Aggregategoodstrade", clear

replace Total_Excel_dollar = Total_Excel_dollar /1000000000

sort year


keep if Exp_Imp == "import"
keep year Total_Excel_dollar

save "Gomrok Data\DTA Data\totalgoodsimport", replace


*** Share of Manufacturing Food

* Export

use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

gen food = 1 if substr(ISIC3, 1, 2) == "15" & ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554"

gen excel_total = dollar if country == "جمع"
fillmissing excel_total , by(year Exp_Imp)

egen food_trade = sum(dollar) if food ==1 & country!="جمع" ,by(year Exp_Imp)

collapse (firstnm) excel_total food_trade, by(year Exp_Imp)

gen share_food_trade = (food_trade / excel_total) *100
replace food_trade = food_trade / 1000000000


keep if Exp_Imp == "export"
keep year share_food_trade food_trade
rename share_food_trade share_food_export
rename food_trade food_export

save "Gomrok Data\DTA Data\sharefoodexport", replace


* Import

use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

gen food = 1 if substr(ISIC3, 1, 2) == "15" & ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554"

gen excel_total = dollar if country == "جمع"
fillmissing excel_total , by(year Exp_Imp)

egen food_trade = sum(dollar) if food ==1 & country!="جمع" ,by(year Exp_Imp)

collapse (firstnm) excel_total food_trade, by(year Exp_Imp)

gen share_food_trade = (food_trade / excel_total) *100
replace food_trade = food_trade / 1000000000


keep if Exp_Imp == "import"
keep year share_food_trade food_trade
rename share_food_trade share_food_import
rename food_trade food_import

save "Gomrok Data\DTA Data\sharefoodimport", replace


**** Export Results
use "Gomrok Data\DTA Data\tradegrowthexportsobat", clear
merge 1:1 year using "Gomrok Data\DTA Data\tradegrowthexportKahesh", nogen
merge 1:1 year using "Gomrok Data\DTA Data\tradegrowthexportAfzayesh", nogen
merge 1:1 year using "Gomrok Data\DTA Data\totalgoodsexport", nogen
merge 1:1 year using "Gomrok Data\DTA Data\sharefoodexport" ,nogen

drop if year < 1381
drop if year == .

fillmissing share_food_export , with(previous)

rename Total_Excel_dollar Total_Excel_dollar_sobat
gen Total_Excel_dollar_Kahesh = Total_Excel_dollar_sobat
gen Total_Excel_dollar_Afzayesh = Total_Excel_dollar_sobat

rename food_export food_export_sobat
gen food_export_Kahesh = food_export_sobat
gen food_export_Afzayesh = food_export_sobat

*Sobat
gen totalgoodsexportSobat  = (1 +trade_growth_export_Sobat[_n]) * Total_Excel_dollar_sobat[_n-1] if Total_Excel_dollar_sobat[_n] == .
replace Total_Excel_dollar_sobat = totalgoodsexportSobat if Total_Excel_dollar_sobat == .


replace totalgoodsexportSobat  = (1 +trade_growth_export_Sobat[_n]) * Total_Excel_dollar_sobat[_n-1] if Total_Excel_dollar_sobat[_n] == .
replace Total_Excel_dollar_sobat = totalgoodsexportSobat if Total_Excel_dollar_sobat == .

replace totalgoodsexportSobat  = (1 +trade_growth_export_Sobat[_n]) * Total_Excel_dollar_sobat[_n-1] if Total_Excel_dollar_sobat[_n] == .
replace Total_Excel_dollar_sobat = totalgoodsexportSobat if Total_Excel_dollar_sobat == .

*Kahesh
gen totalgoodsexportKahesh  = (1 +trade_growth_export_Kahesh[_n]) * Total_Excel_dollar_Kahesh[_n-1] if Total_Excel_dollar_Kahesh[_n] == .
replace Total_Excel_dollar_Kahesh = totalgoodsexportKahesh if Total_Excel_dollar_Kahesh == .


replace totalgoodsexportKahesh  = (1 +trade_growth_export_Kahesh[_n]) * Total_Excel_dollar_Kahesh[_n-1] if Total_Excel_dollar_Kahesh[_n] == .
replace Total_Excel_dollar_Kahesh = totalgoodsexportKahesh if Total_Excel_dollar_Kahesh == .

replace totalgoodsexportKahesh  = (1 +trade_growth_export_Kahesh[_n]) * Total_Excel_dollar_Kahesh[_n-1] if Total_Excel_dollar_Kahesh[_n] == .
replace Total_Excel_dollar_Kahesh = totalgoodsexportKahesh if Total_Excel_dollar_Kahesh == .



*Afzayesh

gen totalgoodsexportAfzayesh = (1 +trade_growth_export_Afzayesh[_n]) * Total_Excel_dollar_Afzayesh[_n-1] if Total_Excel_dollar_Afzayesh[_n] == .
replace Total_Excel_dollar_Afzayesh = totalgoodsexportAfzayesh if Total_Excel_dollar_Afzayesh == .


replace totalgoodsexportAfzayesh  = (1 +trade_growth_export_Afzayesh[_n]) * Total_Excel_dollar_Afzayesh[_n-1] if Total_Excel_dollar_Afzayesh[_n] == .
replace Total_Excel_dollar_Afzayesh = totalgoodsexportAfzayesh if Total_Excel_dollar_Afzayesh == .

replace totalgoodsexportAfzayesh  = (1 +trade_growth_export_Afzayesh[_n]) * Total_Excel_dollar_Afzayesh[_n-1] if Total_Excel_dollar_Afzayesh[_n] == .
replace Total_Excel_dollar_Afzayesh = totalgoodsexportAfzayesh if Total_Excel_dollar_Afzayesh == .

replace food_export_sobat = (share_food_export * Total_Excel_dollar_sobat) / 100 if food_export_sobat == .
replace food_export_Kahesh = (share_food_export * Total_Excel_dollar_Kahesh) / 100 if food_export_Kahesh == .
replace food_export_Afzayesh = (share_food_export * Total_Excel_dollar_Afzayesh) / 100 if food_export_Afzayesh == .

keep year food_export_sobat food_export_Kahesh food_export_Afzayesh Total_Excel_dollar_sobat Total_Excel_dollar_Kahesh Total_Excel_dollar_Afzayesh

set scheme economist
graph set window fontface "XB Niloofar"

label var food_export_sobat "صادرات در ثبات تحریم"
label var food_export_Kahesh "صادرات با کاهش  تحریم"
label var food_export_Afzayesh "صادرات با افزایش تحریم"


label var Total_Excel_dollar_sobat "صادرات در ثبات تحریم"
label var Total_Excel_dollar_Kahesh "صادرات با کاهش  تحریم"
label var Total_Excel_dollar_Afzayesh "صادرات با افزایش تحریم"


putexcel set "Results\Results", modify sheet("Prediction")
twoway (line food_export_sobat year) (line food_export_Kahesh year) (line food_export_Afzayesh year), ytitle(صادرات (میلیارد دلار)) ytitle() yscale(titlegap(2)) xtitle(سال) xtitle() xscale(titlegap(2)) title(پیش بینی صادرات صنعت خوراکی برای سه سناریوی تحریمی,size(medium) position(12)) legend(rows(2) position(1) size(small))
graph export "Results\graphs\Totals\export prediction.png", replace
putexcel (A4) = image(Results\graphs\Totals\export prediction) 

putexcel set "Results\Results", modify sheet("Prediction")
twoway (line Total_Excel_dollar_sobat year) (line Total_Excel_dollar_Kahesh year) (line Total_Excel_dollar_Afzayesh year), ytitle(صادرات (میلیارد دلار)) ytitle() yscale(titlegap(2)) xtitle(سال) xtitle() xscale(titlegap(2)) title(پیش بینی صادرات کل کالاها برای سه سناریوی تحریمی,size(medium) position(12)) legend(rows(2) position(1) size(small))
graph export "Results\graphs\Totals\export prediction.png", replace
putexcel (A30) = image(Results\graphs\Totals\export prediction) 





**** Import Results
use "Gomrok Data\DTA Data\tradegrowthimportsobat", clear
merge 1:1 year using "Gomrok Data\DTA Data\tradegrowthimportKahesh", nogen
merge 1:1 year using "Gomrok Data\DTA Data\tradegrowthimportAfzayesh", nogen
merge 1:1 year using "Gomrok Data\DTA Data\totalgoodsimport", nogen
merge 1:1 year using "Gomrok Data\DTA Data\sharefoodimport" ,nogen

drop if year < 1381
drop if year == .

fillmissing share_food_import , with(previous)

rename Total_Excel_dollar Total_Excel_dollar_sobat
gen Total_Excel_dollar_Kahesh = Total_Excel_dollar_sobat
gen Total_Excel_dollar_Afzayesh = Total_Excel_dollar_sobat

rename food_import food_import_sobat
gen food_import_Kahesh = food_import_sobat
gen food_import_Afzayesh = food_import_sobat

*Sobat
gen totalgoodsimportSobat  = (1 +trade_growth_import_Sobat[_n]) * Total_Excel_dollar_sobat[_n-1] if Total_Excel_dollar_sobat[_n] == .
replace Total_Excel_dollar_sobat = totalgoodsimportSobat if Total_Excel_dollar_sobat == .


replace totalgoodsimportSobat  = (1 +trade_growth_import_Sobat[_n]) * Total_Excel_dollar_sobat[_n-1] if Total_Excel_dollar_sobat[_n] == .
replace Total_Excel_dollar_sobat = totalgoodsimportSobat if Total_Excel_dollar_sobat == .

replace totalgoodsimportSobat  = (1 +trade_growth_import_Sobat[_n]) * Total_Excel_dollar_sobat[_n-1] if Total_Excel_dollar_sobat[_n] == .
replace Total_Excel_dollar_sobat = totalgoodsimportSobat if Total_Excel_dollar_sobat == .

*Kahesh
gen totalgoodsimportKahesh  = (1 +trade_growth_import_Kahesh[_n]) * Total_Excel_dollar_Kahesh[_n-1] if Total_Excel_dollar_Kahesh[_n] == .
replace Total_Excel_dollar_Kahesh = totalgoodsimportKahesh if Total_Excel_dollar_Kahesh == .


replace totalgoodsimportKahesh  = (1 +trade_growth_import_Kahesh[_n]) * Total_Excel_dollar_Kahesh[_n-1] if Total_Excel_dollar_Kahesh[_n] == .
replace Total_Excel_dollar_Kahesh = totalgoodsimportKahesh if Total_Excel_dollar_Kahesh == .

replace totalgoodsimportKahesh  = (1 +trade_growth_import_Kahesh[_n]) * Total_Excel_dollar_Kahesh[_n-1] if Total_Excel_dollar_Kahesh[_n] == .
replace Total_Excel_dollar_Kahesh = totalgoodsimportKahesh if Total_Excel_dollar_Kahesh == .



*Afzayesh

gen totalgoodsimportAfzayesh = (1 +trade_growth_import_Afzayesh[_n]) * Total_Excel_dollar_Afzayesh[_n-1] if Total_Excel_dollar_Afzayesh[_n] == .
replace Total_Excel_dollar_Afzayesh = totalgoodsimportAfzayesh if Total_Excel_dollar_Afzayesh == .


replace totalgoodsimportAfzayesh  = (1 +trade_growth_import_Afzayesh[_n]) * Total_Excel_dollar_Afzayesh[_n-1] if Total_Excel_dollar_Afzayesh[_n] == .
replace Total_Excel_dollar_Afzayesh = totalgoodsimportAfzayesh if Total_Excel_dollar_Afzayesh == .

replace totalgoodsimportAfzayesh  = (1 +trade_growth_import_Afzayesh[_n]) * Total_Excel_dollar_Afzayesh[_n-1] if Total_Excel_dollar_Afzayesh[_n] == .
replace Total_Excel_dollar_Afzayesh = totalgoodsimportAfzayesh if Total_Excel_dollar_Afzayesh == .

replace food_import_sobat = (share_food_import * Total_Excel_dollar_sobat) / 100 if food_import_sobat == .
replace food_import_Kahesh = (share_food_import * Total_Excel_dollar_Kahesh) / 100 if food_import_Kahesh == .
replace food_import_Afzayesh = (share_food_import * Total_Excel_dollar_Afzayesh) / 100 if food_import_Afzayesh == .

keep year food_import_sobat food_import_Kahesh food_import_Afzayesh Total_Excel_dollar_sobat Total_Excel_dollar_Kahesh Total_Excel_dollar_Afzayesh

set scheme economist
graph set window fontface "XB Niloofar"

label var food_import_sobat "واردات در ثبات تحریم"
label var food_import_Kahesh "واردات با کاهش  تحریم"
label var food_import_Afzayesh "واردات با افزایش تحریم"


label var Total_Excel_dollar_sobat "واردات در ثبات تحریم"
label var Total_Excel_dollar_Kahesh "واردات با کاهش  تحریم"
label var Total_Excel_dollar_Afzayesh "واردات با افزایش تحریم"


putexcel set "Results\Results", modify sheet("Prediction")
twoway (line food_import_sobat year) (line food_import_Kahesh year) (line food_import_Afzayesh year), ytitle(واردات (میلیارد دلار)) ytitle() yscale(titlegap(2)) xtitle(سال) xtitle() xscale(titlegap(2)) title(پیش بینی واردات صنعت خوراکی برای سه سناریوی تحریمی,size(medium) position(12)) legend(rows(2) position(1) size(small))
graph export "Results\graphs\Totals\export prediction.png", replace
putexcel (M4) = image(Results\graphs\Totals\export prediction) 



putexcel set "Results\Results", modify sheet("Prediction")
twoway (line Total_Excel_dollar_sobat year) (line Total_Excel_dollar_Kahesh year) (line Total_Excel_dollar_Afzayesh year), ytitle(واردات (میلیارد دلار)) ytitle() yscale(titlegap(2)) xtitle(سال) xtitle() xscale(titlegap(2)) title(پیش بینی واردات کل کالاها برای سه سناریوی تحریمی,size(medium) position(12)) legend(rows(2) position(1) size(small))
graph export "Results\graphs\Totals\export prediction.png", replace
putexcel (M30) = image(Results\graphs\Totals\export prediction) 




