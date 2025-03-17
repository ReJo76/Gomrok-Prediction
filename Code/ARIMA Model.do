

// New Data

macro drop _all
global bkgrnd_c "255 255 255"


#d ;
global graph_opts 
    //title("لگاریتم هزینه سرانه حقیقی خانوار", size(medium) color(black)) 
    //xtitle("", size(medsmall) color(black) m(medsmall) place(middle) ) 
    //ytitle("", size(medium) color(black)) 
    //xlabel(1385(2)1405, labsize(medsmall) labcolor(black) angle(0) grid glcolor(gs14) glw(thin) glp(dash) notick) 
    //ylabel(, labsize(medsmall) labcolor(black) angle(0) grid glcolor(gs14) glw(medthin) glp(dash) tick) 
	//yscale( lw(medium) lc(dknavy) )
	//xscale(lw(medium) lc(dknavy))
    //legend(order(2 3 4)  label(2 "وضع موجود") label(3 "خوشبینانه") label(4 "بدبینانه") c(1) si(medsmall) ring(0) pos(11) symx(*0.5) region(style(none))) 
	graphr(c($bkgrnd_c)) plotr(c($bkgrnd_c))
	;
#d cr

global lp0 lw(thick) lp(solid) lc(ltblue)		//actual data line
global lp1 lw(thick) lp(solid) lc(navy)			//current scenario
global lp2 lw(thick) lp(solid) lc(green)		//optimistic scenario
global lp3 lw(thick) lp(solid) lc(red)			//pessimistic scenario

set scheme s2color
graph set window fontface "F_Mitra"

//cd "H:\RADrVesal\RA"

// ARIMA Model Prediction


/*
**# All Export Data

// Dickey Fuller Test for All Export Data

use "Gomrok Data\DTA Data\cleaned\Aggregategoodstrade", clear

keep if Exp_Imp == "export"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
replace  Total_Excel_dollar = Total_Excel_dollar / 1000000000

putexcel set "Results\ARIMA", replace sheet("dfuller export total", replace)
twoway (line Total_Excel_dollar year ,${lp0}) ,xtitle(سال) ytitle(ارزش دلاری(میلیارد دلار)) title(صادرات کل کالاها, position(1)) xlabel(1370(5)1400, labsize(small))  ylabel(, labsize(small)) name(totexp, replace)  xscale(titlegap(2)) yscale(titlegap(2)) $graph_opts
graph export "Results\graphs\ARIMA\Total Export Over Time.png", replace
putexcel (A4) = image(Results\graphs\ARIMA\Total Export Over Time)

putexcel A2 = "This Section Presents dickey fuller test", font(bold)

putexcel set "Results\ARIMA", modify sheet("dfuller export total")
ac Total_Excel_dollar ,ytitle(همبستگی برای داده های صادرات) title(نمودار همبستگی برای داده های صادرت, position(1)) xtitle(لگ) note(بازه اطمینان 95 درصد)
graph export "Results\graphs\ARIMA\ AC graph for Total Export Data.png", replace
putexcel A34 = image(Results\graphs\ARIMA\ AC graph for Total Export Data)
putexcel A32 = "AC Graph For Total Export Data", font(bold)



putexcel set "Results\ARIMA", modify sheet("dfuller export total")
pac Total_Excel_dollar ,ytitle(همبستگی جزیی برای داده های صادرات) title(نمودار همبستگی جزیی برای داده های صادرت, position(1)) xtitle(لگ) note(بازه اطمینان 95 درصد)
graph export "Results\graphs\ARIMA\ PAC graph for Total Export Data.png", replace
putexcel M34 = image(Results\graphs\ARIMA\ PAC graph for Total Export Data)
putexcel M32 = "PAC Graph For Total Export Data", font(bold)


putexcel A64 = "Here I Present the Dickey fuller test results", font(bold)
putexcel B65 = "Test Statistics"
putexcel C65 = "1% criteria"
putexcel D65 = "5% criteria"
putexcel E65 = "10% criteria"
putexcel F65 = "MacKinnon approximate p-value"
putexcel G65 = "number of observations"
putexcel H65 = "lags"

putexcel A66 = "Dfuller with Trend"
dfuller Total_Excel_dollar,trend regress 
putexcel B66 = matrix(r(Zt))
putexcel C66 = matrix(r(cv_1))
putexcel D66 = matrix(r(cv_5))
putexcel E66 = matrix(r(cv_10))
putexcel F66 = matrix(r(p))
putexcel G66 = matrix(r(N))
putexcel H66 = matrix(r(lags))

putexcel A67 = "Dfuller without constant"
dfuller Total_Excel_dollar,noconstant regress 
putexcel B67 = matrix(r(Zt))
putexcel C67 = matrix(r(cv_1))
putexcel D67 = matrix(r(cv_5))
putexcel E67 = matrix(r(cv_10))
putexcel F67 = matrix(r(p))
putexcel G67 = matrix(r(N))
putexcel H67 = matrix(r(lags))

putexcel A68 = "Dfuller with drift"
dfuller Total_Excel_dollar,drift regress 
putexcel B68 = matrix(r(Zt))
putexcel C68 = matrix(r(cv_1))
putexcel D68 = matrix(r(cv_5))
putexcel E68 = matrix(r(cv_10))
putexcel F68 = matrix(r(p))
putexcel G68 = matrix(r(N))
putexcel H68 = matrix(r(lags))

putexcel A69 = "Dfuller with lags and trend"
dfuller Total_Excel_dollar,trend regress lags(3)
putexcel B69 = matrix(r(Zt))
putexcel C69 = matrix(r(cv_1))
putexcel D69 = matrix(r(cv_5))
putexcel E69 = matrix(r(cv_10))
putexcel F69 = matrix(r(p))
putexcel G69 = matrix(r(N))
putexcel H69 = matrix(r(lags))


putexcel A71 = "Here I Present the dickey fuller result for one difference", font(bold)


putexcel A73 = "Here I Present the Dickey fuller test results"
putexcel B73 = "Test Statistics"
putexcel C73 = "1% criteria"
putexcel D73 = "5% criteria"
putexcel E73 = "10% criteria"
putexcel F73 = "MacKinnon approximate p-value"
putexcel G73 = "number of observations"
putexcel H73 = "lags"


putexcel A74 = "Dfuller with trend for one difference of export"
dfuller d.Total_Excel_dollar, trend regress
putexcel B74 = matrix(r(Zt))
putexcel C74 = matrix(r(cv_1))
putexcel D74 = matrix(r(cv_5))
putexcel E74 = matrix(r(cv_10))
putexcel F74 = matrix(r(p))
putexcel G74 = matrix(r(N))
putexcel H74 = matrix(r(lags))


putexcel A75 = "Dfuller without constant for one difference of export"
dfuller d.Total_Excel_dollar, noconstant regress
putexcel B75 = matrix(r(Zt))
putexcel C75 = matrix(r(cv_1))
putexcel D75 = matrix(r(cv_5))
putexcel E75 = matrix(r(cv_10))
putexcel F75= matrix(r(p))
putexcel G75 = matrix(r(N))
putexcel H75 = matrix(r(lags))

putexcel A76 = "Dfuller with drift for one difference of export"
dfuller d.Total_Excel_dollar, drift regress
putexcel B76 = matrix(r(Zt))
putexcel C76 = matrix(r(cv_1))
putexcel D76 = matrix(r(cv_5))
putexcel E76 = matrix(r(cv_10))
putexcel F76= matrix(r(p))
putexcel G76 = matrix(r(N))
putexcel H76 = matrix(r(lags))


putexcel A77 = "Dfuller with lag for one difference of export"
dfuller d.Total_Excel_dollar, trend lags(3) regress
putexcel B77 = matrix(r(Zt))
putexcel C77 = matrix(r(cv_1))
putexcel D77 = matrix(r(cv_5))
putexcel E77 = matrix(r(cv_10))
putexcel F77= matrix(r(p))
putexcel G77 = matrix(r(N))
putexcel H77 = matrix(r(lags))


putexcel A80 = "This Section Presents dickey fuller test for one difference of export data", font(bold)

putexcel set "Results\ARIMA", modify sheet("dfuller export total")
ac d.Total_Excel_dollar ,ytitle(همبستگی برای داده های صادرات) title(نمودار همبستگی برای داده های صادرت, position(1)) xtitle(لگ) note(بازه اطمینان 95 درصد) $graph_opts
graph export "Results\graphs\ARIMA\ AC graph for One difference Export Data.png", replace
putexcel A84 = image(Results\graphs\ARIMA\ AC graph for One difference Export Data)
putexcel A82 = "AC Graph For One difference Export Data", font(bold)



putexcel set "Results\ARIMA", modify sheet("dfuller export total")
pac d.Total_Excel_dollar ,ytitle(همبستگی جزیی برای داده های صادرات) title(نمودار همبستگی جزیی برای داده های صادرت, position(1)) xtitle(لگ) note(بازه اطمینان 95 درصد)
graph export "Results\graphs\ARIMA\ PAC graph for One difference Export Data.png", replace
putexcel M84 = image(Results\graphs\ARIMA\ PAC graph for One difference Export Data)
putexcel M82 = "PAC Graph For One difference Export Data", font(bold)




*** ARIMA Models


putexcel set "Results\ARIMA", modify sheet("Choosing Model Export Total")
putexcel A2 = "This Sheet Presents Different Criterias to choose a Good model for prediction", font(bold)
putexcel A3 = "These criterias include AIC, BIC, Log Liklelihood, Sigma", font(bold)
putexcel A4 = "The Numbers are transformed into billion"

putexcel A5 = "ARIMA model without exogenous Variables", font(bold)
putexcel B7 = "Sigma"
putexcel C7 = "Number of Observations"
putexcel D7 = "ll (null)"
putexcel E7 = "log likelihood (model)"
putexcel F7 = "df"
putexcel G7 = "AIC"
putexcel H7 = "BIC"

// Error Putexcel 
putexcel I7 = "Mean of residuals"
putexcel J7 = "Min of residuals(billion)"
putexcel K7 = "Max of residuals(billion)"
putexcel L7 = "Portmanteau test for white noise"
putexcel M7 = "eigenvalue of ma1"
putexcel N7 = "eigenvalue of ma2"
putexcel O7 = "eigenvalue of ma3"
putexcel P7 = "eigenvalue of ma4"
putexcel Q7 = "eigenvalue of ma5"
putexcel R7 = "eigenvalue of ma6"
putexcel S7 = "eigenvalue of ma7"
putexcel T7 = "eigenvalue of ma8"
putexcel U7 = "eigenvalue of ar1"
putexcel V7 = "eigenvalue of ar2"


*Without Exogenous Variables

local m=8
* AR = 0

putexcel A6 = "Ar = 0"

forvalues q = 1/8 {
	arima Total_Excel_dollar , arima(0,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))	
	
	drop error
local m = `m' + 1
}

* AR = 1
putexcel A16 = "AR = 1"
local m=17
forvalues q = 0/6 {
	arima Total_Excel_dollar , arima(1,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	estat aroots
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}


* AR = 2
putexcel A24 = "AR = 2"
local m=25
forvalues q = 0/6 {
	arima Total_Excel_dollar , arima(2,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}

** Models with exogenous Variables


putexcel A32 = "Models With Exogenous Variables"
putexcel A33 = "Models with some Macro Variables"

local m=35
putexcel A34 = "AR = 0"
* AR = 0
forvalues q = 1/7 {
	arima Total_Excel_dollar azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P, arima(0,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))	
	drop error
local m = `m' + 1
}

putexcel A42 = "AR = 1"
* AR = 1
local m=43

forvalues q = 0/6 {
	arima Total_Excel_dollar azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P, arima(1,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



putexcel A50 = "AR = 2"
* AR = 2
local m=51
forvalues q = 0/1 {
	arima Total_Excel_dollar azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P, arima(2,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}


** With First lag of Variables

putexcel A54 = "Models with One lag of Variables", font(bold)

putexcel A55 = "AR = 0"
local m=56
* AR = 0
forvalues q = 1/5 {
	arima Total_Excel_dollar l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P, arima(0,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))	
	drop error
local m = `m' + 1
}

putexcel A61 = "AR = 1"
* AR = 1
local m=62

forvalues q = 0/5 {
	arima Total_Excel_dollar l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P, arima(1,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



putexcel A68 = "AR = 2"
* AR = 2
local m=69
forvalues q = 0/1 {
	arima Total_Excel_dollar azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P, arima(2,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}

** Models with second lag of Variables


putexcel A73 = "Models with Second lag of Variables", font(bold)

putexcel A74 = "AR = 0"
local m=75
* AR = 0
forvalues q = 1/6 {
	arima Total_Excel_dollar l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P, arima(0,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))	
	drop error
local m = `m' + 1
}


putexcel A82 = "AR = 1"
* AR = 1
local m=83

forvalues q = 0/0 {
	arima Total_Excel_dollar l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P, arima(1,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



putexcel A85 = "AR = 2"
* AR = 2
local m=86
forvalues q = 0/1 {
	arima Total_Excel_dollar l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P, arima(2,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}




***** Predictions

*** Train and Test Split
putexcel set "Results\ARIMA", modify sheet("Choosing Model Export Total")
putexcel A95 = "This Part Presents Predictions based on Selected Models", font(bold)
putexcel A97 = "This Part Splits Data into Train and test and Presents RMSE, RRMSE and MAPE"
putexcel A98= "Last Three years are considered Test"


use "Gomrok Data\DTA Data\cleaned\Aggregategoodstrade", clear

keep if Exp_Imp == "export"
//drop if year >= 1403
merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
replace  Total_Excel_dollar = Total_Excel_dollar / 1000000000

arima Total_Excel_dollar l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P if year < 1400 , arima(0,1,3)
global cmdline = e(cmdline)
putexcel A100 = "$cmdline"

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Export"

gen error_percent = ((fdollar - Total_Excel_dollar) / Total_Excel_dollar) * 100

putexcel set "Results\ARIMA", modify sheet("Choosing Model Export Total")
twoway (line Total_Excel_dollar year) (line fdollar year) (line error_percent year, yaxis(2)) , legend(on label(1 "داده واقعی صادرات کل کالاها") label(2 "داده پیش بینی شده") label(3 "اختلاف درصدی داده واقعی و پیش بینی محور دوم"))  xlabel(, grid)  ytitle(صادرات کل کالاها, axis(1)) ytitle(اختلاف درصدی داده واقعی و پیش بینی, axis(2)) title(نمودار پیش بینی دو گروه تمرین و تست) $graph_opts 
graph export "Results\graphs\ARIMA\ Train Test Diff1 Lag2 Ma3 Total Export.png", replace
putexcel B104 = image(Results\graphs\ARIMA\ Train Test Diff1 Lag2 Ma3 Total Export)
putexcel B102 = " Train Test Diff1 Lag2 Ma3 Total Export", font(bold)


** Train coefs
gen diff_train = Total_Excel_dollar - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(Total_Excel_dollar)  if year < 1400

gen diff_der_train = abs(diff_train / Total_Excel_dollar)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = Total_Excel_dollar - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(Total_Excel_dollar) if year >=1400

gen diff_der_test = abs(diff_test / Total_Excel_dollar)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Export Total")

putexcel C136 = "RMSE_train"
putexcel D136 = "RRMSE_train"
putexcel E136 = "MAPE_train"
putexcel F136 = "RMSE_test"
putexcel G136 = "RRMSE_test"
putexcel H136 = "MAPE_test"

putexcel C137 = RMSE_train
putexcel D137 = RRMSE_train
putexcel E137 = MAPE_train
putexcel F137 = RMSE_test
putexcel G137 = RRMSE_test
putexcel H137 = MAPE_test







*** Now Predicting on the entire data

putexcel set "Results\ARIMA", modify sheet("Choosing Model Export Total")
putexcel A139 = "Here I Present The Predictions based on Selected Model for three years after", font(bold)

use "Gomrok Data\DTA Data\cleaned\Aggregategoodstrade", clear

keep if Exp_Imp == "export"
//drop if year >= 1403
merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

rename azad_growth_P2P Sobat_azad_growth_P2P
rename liquidity_growth_P2P Sobat_liquidity_growth_P2P
rename real_gdp_growth_P2P Sobat_real_gdp_growth_P2P
rename budget_P2P Sobat_budget_P2P
rename inflation_P2P Sobat_inflation_P2P
rename yearly_sii Sobat_yearly_sii

merge 1:1 year using  "Gomrok Data\DTA Data\P2PAfzayesh", nogen
rename azad_growth_P2P Afzayesh_azad_growth_P2P
rename liquidity_growth_P2P Afzayesh_liquidity_growth_P2P
rename real_gdp_growth_P2P Afzayesh_real_gdp_growth_P2P
rename budget_P2P Afzayesh_budget_P2P
rename inflation_P2P Afzayesh_inflation_P2P
rename yearly_sii Afzayesh_yearly_sii

merge 1:1 year using  "Gomrok Data\DTA Data\P2PKahesh", nogen
rename azad_growth_P2P Kahesh_azad_growth_P2P
rename liquidity_growth_P2P Kahesh_liquidity_growth_P2P
rename real_gdp_growth_P2P Kahesh_real_gdp_growth_P2P
rename budget_P2P Kahesh_budget_P2P
rename inflation_P2P Kahesh_inflation_P2P
rename yearly_sii Kahesh_yearly_sii

tsset year
replace  Total_Excel_dollar = Total_Excel_dollar / 1000000000

arima Total_Excel_dollar l2.Sobat_azad_growth_P2P l2.Sobat_yearly_sii l2.Sobat_real_gdp_growth_P2P l2.Sobat_inflation_P2P , arima(0,1,3)
global cmdline = e(cmdline)
putexcel A141 = "$cmdline"

* Check for White noise, Normality of residuals

predict error_Sobat, resid

putexcel A143 = "Pvalue of normality tests"
putexcel B144 = "Shapiro–Wilk test for normality"
putexcel C144 = "Skewness test for normality"
putexcel D144 = "kurtosis test for normality"

swilk error_Sobat
putexcel B145 = matrix(r(p))


sktest error_Sobat
putexcel C145 = matrix(r(p_skew))
putexcel D145 = matrix(r(p_kurt))

putexcel A147 = "The test to chenk residuals being white noise"
putexcel B148 = "Q statistics"
putexcel C148 = "P Value"

wntestq error_Sobat
putexcel B149 = matrix(r(stat))
putexcel C149 = matrix(r(p))

histogram error_Sobat, normal ytitle(چگالی) xtitle(باقیمانده کل داده های صادرات) title(نرمال بودن جز خطا برای مدل با لگ دوم متغیرها و میانگین متحرک 3)  $graph_opts 
graph export "Results\graphs\ARIMA\ Histogram Normality residuals Diff1 Lag2 Ma3 Total Export.png", replace
putexcel B152 = image(Results\graphs\ARIMA\ Histogram Normality residuals Diff1 Lag2 Ma3 Total Export)
putexcel B151 = " Histogram Normality residuals Diff1 Lag2 Ma3 Total Export", font(bold)

qnorm error_Sobat, ytitle(باقیمانده کل داده های صادرات) xtitle(معکوس نرمال) title(نمودار ناپارامترک مقایسه با توزیع نرمال مدل با دو لگ و میانگین متحرک 3) $graph_opts 
graph export "Results\graphs\ARIMA\ QQNorm Normality residuals Diff1 Lag2 Ma3 Total Export.png", replace
putexcel O152 = image(Results\graphs\ARIMA\ QQNorm Normality residuals Diff1 Lag2 Ma3 Total Export)
putexcel O151 = " QQNorm Normality residuals Diff1 Lag2 Ma3 Total Export", font(bold)


*** Finally the prediction graph
putexcel A186 = "Here I Present The pridection Trends for three scenarios"
putexcel A187 = "In this case because we are using second lag of variables there is little difference between scenarios"

arima Total_Excel_dollar l2.Sobat_azad_growth_P2P l2.Sobat_yearly_sii l2.Sobat_real_gdp_growth_P2P l2.Sobat_inflation_P2P , arima(0,1,3)
tsappend , add(3)
predict fdollar_Sobat if tin(1380, 1405), y dynamic(y(1403))
label var fdollar_Sobat "forcasted Dollar Export Sobat"

arima Total_Excel_dollar l2.Kahesh_azad_growth_P2P l2.Kahesh_yearly_sii l2.Kahesh_real_gdp_growth_P2P l2.Kahesh_inflation_P2P , arima(0,1,3)
tsappend , add(3)
predict fdollar_Kahesh if tin(1380, 1405), y dynamic(y(1403))
label var fdollar_Kahesh "forcasted Dollar Export Kahesh"


arima Total_Excel_dollar l2.Afzayesh_azad_growth_P2P l2.Afzayesh_yearly_sii l2.Afzayesh_real_gdp_growth_P2P l2.Afzayesh_inflation_P2P , arima(0,1,3)
tsappend , add(3)
predict fdollar_Afzayesh if tin(1380, 1405), y dynamic(y(1403))
label var fdollar_Afzayesh "forcasted Dollar Export Afzayesh"

putexcel set "Results\ARIMA", modify sheet("Choosing Model Export Total")
twoway (line Total_Excel_dollar year,${lp0} lw(thin)) (line fdollar_Sobat year,${lp1} lw(thin)) (line fdollar_Kahesh year,${lp2} lw(thin))  (line fdollar_Afzayesh year ,${lp3} lw(thin))  , legend(on label(1 "داده واقعی صادرات کل کالاها") label(2 "داده پیش بینی شده با فرض ثبات")  label(3 "داده پیش بینی شده با فرض کاهش تحریم")   label(4 "داده پیش بینی شده با فرض افزایش تحریم") size(small))  xlabel(, grid)  ytitle(صادرات کل کالاها, axis(1)) title(نمودار پیش بینی برای سه سناریو) $graph_opts 
graph export "Results\graphs\ARIMA\ Prediction Diff1 Lag2 Ma3 Total Export.png", replace
putexcel B189 = image(Results\graphs\ARIMA\ Prediction Diff1 Lag2 Ma3 Total Export)
putexcel B188 = " Prediction Diff1 Lag2 Ma3 Total Export", font(bold)





**# All Import Data
// Import 

use "Gomrok Data\DTA Data\cleaned\Aggregategoodstrade", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
replace  Total_Excel_dollar = Total_Excel_dollar / 1000000000

putexcel set "Results\ARIMA", modify sheet("dfuller import total", replace)
twoway (line Total_Excel_dollar year ,${lp0}) ,xtitle(سال) ytitle(ارزش دلاری(میلیارد دلار)) title(واردات کل کالاها, position(1)) xlabel(1370(5)1400, labsize(small))  ylabel(, labsize(small)) name(totexp, replace)  xscale(titlegap(2)) yscale(titlegap(2)) $graph_opts
graph export "Results\graphs\ARIMA\Total Import Over Time.png", replace
putexcel (A4) = image(Results\graphs\ARIMA\Total Import Over Time)

putexcel A2 = "This Section Presents dickey fuller test for total import data", font(bold)

putexcel set "Results\ARIMA", modify sheet("dfuller import total")
ac Total_Excel_dollar ,ytitle(همبستگی برای داده های واردات) title(نمودار همبستگی برای داده های واردات, position(1)) xtitle(لگ) note(بازه اطمینان 95 درصد)
graph export "Results\graphs\ARIMA\ AC graph for Total Import Data.png", replace
putexcel A36 = image(Results\graphs\ARIMA\ AC graph for Total Import Data)
putexcel A34 = "AC Graph For Total Import Data", font(bold)



putexcel set "Results\ARIMA", modify sheet("dfuller import total")
pac Total_Excel_dollar ,ytitle(همبستگی جزیی برای داده های واردات) title(نمودار همبستگی جزیی برای داده های واردات, position(1)) xtitle(لگ) note(بازه اطمینان 95 درصد)
graph export "Results\graphs\ARIMA\ PAC graph for Total Import Data.png", replace
putexcel M36 = image(Results\graphs\ARIMA\ PAC graph for Total Import Data)
putexcel M34 = "PAC Graph For Total Import Data", font(bold)


putexcel A68 = "Here I Present the Dickey fuller test results for Import Total Data", font(bold)
putexcel B69 = "Test Statistics"
putexcel C69 = "1% criteria"
putexcel D69= "5% criteria"
putexcel E69 = "10% criteria"
putexcel F69= "MacKinnon approximate p-value"
putexcel G69= "number of observations"
putexcel H69= "lags"

putexcel A70 = "Dfuller with Trend"
dfuller Total_Excel_dollar,trend regress 
putexcel B70 = matrix(r(Zt))
putexcel C70 = matrix(r(cv_1))
putexcel D70 = matrix(r(cv_5))
putexcel E70 = matrix(r(cv_10))
putexcel F70 = matrix(r(p))
putexcel G70 = matrix(r(N))
putexcel H70 = matrix(r(lags))

putexcel A71 = "Dfuller without constant"
dfuller Total_Excel_dollar,noconstant regress 
putexcel B71 = matrix(r(Zt))
putexcel C71 = matrix(r(cv_1))
putexcel D71 = matrix(r(cv_5))
putexcel E71 = matrix(r(cv_10))
putexcel F71 = matrix(r(p))
putexcel G71 = matrix(r(N))
putexcel H71 = matrix(r(lags))

putexcel A72 = "Dfuller with drift"
dfuller Total_Excel_dollar,drift regress 
putexcel B72 = matrix(r(Zt))
putexcel C72 = matrix(r(cv_1))
putexcel D72 = matrix(r(cv_5))
putexcel E72 = matrix(r(cv_10))
putexcel F72 = matrix(r(p))
putexcel G72 = matrix(r(N))
putexcel H72 = matrix(r(lags))

putexcel A73 = "Dfuller with lags and trend"
dfuller Total_Excel_dollar,trend regress lags(3)
putexcel B73 = matrix(r(Zt))
putexcel C73 = matrix(r(cv_1))
putexcel D73 = matrix(r(cv_5))
putexcel E73 = matrix(r(cv_10))
putexcel F73 = matrix(r(p))
putexcel G73 = matrix(r(N))
putexcel H73 = matrix(r(lags))


putexcel A75 = "Here I Present the dickey fuller result for one difference", font(bold)


putexcel A76 = "Here I Present the Dickey fuller test results"
putexcel B76 = "Test Statistics"
putexcel C76 = "1% criteria"
putexcel D76 = "5% criteria"
putexcel E76 = "10% criteria"
putexcel F76 = "MacKinnon approximate p-value"
putexcel G76 = "number of observations"
putexcel H76 = "lags"


putexcel A77 = "Dfuller with trend for one difference of export"
dfuller d.Total_Excel_dollar, trend regress
putexcel B77 = matrix(r(Zt))
putexcel C77 = matrix(r(cv_1))
putexcel D77 = matrix(r(cv_5))
putexcel E77 = matrix(r(cv_10))
putexcel F77 = matrix(r(p))
putexcel G77 = matrix(r(N))
putexcel H77 = matrix(r(lags))

putexcel A78 = "Dfuller without constant for one difference of export"
dfuller d.Total_Excel_dollar, noconstant regress
putexcel B78 = matrix(r(Zt))
putexcel C78 = matrix(r(cv_1))
putexcel D78 = matrix(r(cv_5))
putexcel E78 = matrix(r(cv_10))
putexcel F78= matrix(r(p))
putexcel G78 = matrix(r(N))
putexcel H78 = matrix(r(lags))

putexcel A79 = "Dfuller with drift for one difference of export"
dfuller d.Total_Excel_dollar, drift regress
putexcel B79 = matrix(r(Zt))
putexcel C79 = matrix(r(cv_1))
putexcel D79 = matrix(r(cv_5))
putexcel E79 = matrix(r(cv_10))
putexcel F79= matrix(r(p))
putexcel G79 = matrix(r(N))
putexcel H79 = matrix(r(lags))


putexcel A80 = "Dfuller with lag for one difference of export"
dfuller d.Total_Excel_dollar, trend lags(3) regress
putexcel B80 = matrix(r(Zt))
putexcel C80 = matrix(r(cv_1))
putexcel D80 = matrix(r(cv_5))
putexcel E80 = matrix(r(cv_10))
putexcel F80= matrix(r(p))
putexcel G80 = matrix(r(N))
putexcel H80 = matrix(r(lags))


putexcel A84 = "This Section Presents ACF & PACF for one difference of import data", font(bold)

putexcel set "Results\ARIMA", modify sheet("dfuller import total")
ac d.Total_Excel_dollar ,ytitle(همبستگی برای داده های واردات) title(نمودار همبستگی برای داده های واردات, position(1)) xtitle(لگ) note(بازه اطمینان 95 درصد)
graph export "Results\graphs\ARIMA\ AC graph for One difference Import Data.png", replace
putexcel A88 = image(Results\graphs\ARIMA\ AC graph for One difference Import Data)
putexcel A86 = "AC Graph For One difference Import Data", font(bold)



putexcel set "Results\ARIMA", modify sheet("dfuller import total")
pac d.Total_Excel_dollar ,ytitle(همبستگی جزیی برای داده های واردات) title(نمودار همبستگی جزیی برای داده های واردات, position(1)) xtitle(لگ) note(بازه اطمینان 95 درصد)
graph export "Results\graphs\ARIMA\ PAC graph for One difference Import Data.png", replace
putexcel M88 = image(Results\graphs\ARIMA\ PAC graph for One difference Import Data)
putexcel M86 = "PAC Graph For One difference Import Data", font(bold)




*** ARIMA Models


putexcel set "Results\ARIMA", modify sheet("Choosing Model Import Total")
putexcel A2 = "This Sheet Presents Different Criterias to choose a Good model for prediction for Import Total Data", font(bold)
putexcel A3 = "These criterias include AIC, BIC, Log Liklelihood, Sigma", font(bold)
putexcel A4 = "The Numbers are transformed into billion"

putexcel A5 = "ARIMA model without exogenous Variables", font(bold)
putexcel B7 = "Sigma"
putexcel C7 = "Number of Observations"
putexcel D7 = "ll (null)"
putexcel E7 = "log likelihood (model)"
putexcel F7 = "df"
putexcel G7 = "AIC"
putexcel H7 = "BIC"

// Error Putexcel 
putexcel I7 = "Mean of residuals"
putexcel J7 = "Min of residuals(billion)"
putexcel K7 = "Max of residuals(billion)"
putexcel L7 = "Portmanteau test for white noise"
putexcel M7 = "eigenvalue of ma1"
putexcel N7 = "eigenvalue of ma2"
putexcel O7 = "eigenvalue of ma3"
putexcel P7 = "eigenvalue of ma4"
putexcel Q7 = "eigenvalue of ma5"
putexcel R7 = "eigenvalue of ma6"
putexcel S7 = "eigenvalue of ma7"
putexcel T7 = "eigenvalue of ma8"
putexcel U7 = "eigenvalue of ar1"
putexcel V7 = "eigenvalue of ar2"


*Without Exogenous Variables

local m=8
* AR = 0

putexcel A6 = "Ar = 0"

forvalues q = 1/8 {
	arima Total_Excel_dollar , arima(0,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))	
	
	drop error
local m = `m' + 1
}

* AR = 1
putexcel A16 = "AR = 1"
local m=17
forvalues q = 0/0{
	arima Total_Excel_dollar , arima(1,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	estat aroots
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}


* AR = 2
putexcel A20 = "AR = 2"
local m=21
forvalues q = 0/5 {
	arima Total_Excel_dollar , arima(2,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}

** Models with exogenous Variables


putexcel A28 = "Models With Exogenous Variables"
putexcel A29 = "Models with some Macro Variables"

local m=32
putexcel A31 = "AR = 0"
* AR = 0
forvalues q = 1/7 {
	arima Total_Excel_dollar azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P, arima(0,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))	
	drop error
local m = `m' + 1
}

putexcel A42 = "AR = 1"
* AR = 1
local m=43

forvalues q = 0/6 {
	arima Total_Excel_dollar azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P, arima(1,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



putexcel A51 = "AR = 2"
* AR = 2
local m=52
forvalues q = 0/1 {
	arima Total_Excel_dollar azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P, arima(2,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}


** With First lag of Variables

putexcel A56 = "Models with One lag of Variables", font(bold)

putexcel A57 = "AR = 0"
local m=58
* AR = 0
forvalues q = 1/6 {
	arima Total_Excel_dollar l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P, arima(0,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))	
	drop error
local m = `m' + 1
}

putexcel A65 = "AR = 1"
* AR = 1
local m=66

forvalues q = 0/5 {
	arima Total_Excel_dollar l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P, arima(1,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



putexcel A73 = "AR = 2"
* AR = 2
local m=74
forvalues q = 0/1 {
	arima Total_Excel_dollar azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P, arima(2,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}

** Models with second lag of Variables


putexcel A77 = "Models with Second lag of Variables", font(bold)

putexcel A78 = "AR = 0"
local m=79
* AR = 0
forvalues q = 1/6 {
	arima Total_Excel_dollar l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P, arima(0,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))	
	drop error
local m = `m' + 1
}


putexcel A86 = "AR = 1"
* AR = 1
local m=87

forvalues q = 0/5 {
	arima Total_Excel_dollar l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P, arima(1,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



putexcel A94 = "AR = 2"
* AR = 2
local m=95
forvalues q = 0/3 {
	arima Total_Excel_dollar l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P, arima(2,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}


***** Predictions

*** Train and Test Split
putexcel set "Results\ARIMA", modify sheet("Choosing Model Import Total")
putexcel A95 = "This Part Presents Predictions based on Selected Models", font(bold)
putexcel A97 = "This Part Splits Data into Train and test and Presents RMSE, RRMSE and MAPE"
putexcel A98= "Last Three years are considered Test"


** Model lag1 Ma1 AR0
use "Gomrok Data\DTA Data\cleaned\Aggregategoodstrade", clear

keep if Exp_Imp == "import"
//drop if year >= 1403
merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
replace  Total_Excel_dollar = Total_Excel_dollar / 1000000000

arima Total_Excel_dollar l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P if year < 1400 , arima(0,1,1)
global cmdline = e(cmdline)
putexcel A100 = "$cmdline"

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

gen error_percent = ((fdollar - Total_Excel_dollar) / Total_Excel_dollar) * 100

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import Total")
twoway (line Total_Excel_dollar year) (line fdollar year) (line error_percent year, yaxis(2)) , legend(on label(1 "داده واقعی واردات کل کالاها") label(2 "داده پیش بینی شده") label(3 "اختلاف درصدی داده واقعی و پیش بینی محور دوم"))  xlabel(, grid)  ytitle(واردات کل کالاها, axis(1)) ytitle(اختلاف درصدی داده واقعی و پیش بینی, axis(2)) title(نمودار پیش بینی دو گروه تمرین و تست) $graph_opts 
graph export "Results\graphs\ARIMA\ Train Test Diff1 Lag2 Ma3 Total Import.png", replace
putexcel B104 = image(Results\graphs\ARIMA\ Train Test Diff1 Lag2 Ma3 Total Import)
putexcel B102 = " Train Test Diff1 Lag1 Ma1 Total Import", font(bold)


** Train coefs
gen diff_train = Total_Excel_dollar - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(Total_Excel_dollar)  if year < 1400

gen diff_der_train = abs(diff_train / Total_Excel_dollar)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = Total_Excel_dollar - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(Total_Excel_dollar) if year >=1400

gen diff_der_test = abs(diff_test / Total_Excel_dollar)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import Total")

putexcel C136 = "RMSE_train"
putexcel D136 = "RRMSE_train"
putexcel E136 = "MAPE_train"
putexcel F136 = "RMSE_test"
putexcel G136 = "RRMSE_test"
putexcel H136 = "MAPE_test"

putexcel C137 = RMSE_train
putexcel D137 = RRMSE_train
putexcel E137 = MAPE_train
putexcel F137 = RMSE_test
putexcel G137 = RRMSE_test
putexcel H137 = MAPE_test




** Model lag1 Ma2 AR0
use "Gomrok Data\DTA Data\cleaned\Aggregategoodstrade", clear

keep if Exp_Imp == "import"
//drop if year >= 1403
merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
replace  Total_Excel_dollar = Total_Excel_dollar / 1000000000

arima Total_Excel_dollar l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P if year < 1400 , arima(0,1,2)
global cmdline = e(cmdline)
putexcel Q100 = "$cmdline"

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

gen error_percent = ((fdollar - Total_Excel_dollar) / Total_Excel_dollar) * 100

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import Total")
twoway (line Total_Excel_dollar year) (line fdollar year) (line error_percent year, yaxis(2)) , legend(on label(1 "داده واقعی واردات کل کالاها") label(2 "داده پیش بینی شده") label(3 "اختلاف درصدی داده واقعی و پیش بینی محور دوم"))  xlabel(, grid)  ytitle(واردات کل کالاها, axis(1)) ytitle(اختلاف درصدی داده واقعی و پیش بینی, axis(2)) title(نمودار پیش بینی دو گروه تمرین و تست) $graph_opts 
graph export "Results\graphs\ARIMA\ Train Test Diff1 Lag2 Ma3 Total Import.png", replace
putexcel Q104 = image(Results\graphs\ARIMA\ Train Test Diff1 Lag2 Ma3 Total Import)
putexcel Q102 = " Train Test Diff1 Lag1 Ma2 Total Import", font(bold)


** Train coefs
gen diff_train = Total_Excel_dollar - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(Total_Excel_dollar)  if year < 1400

gen diff_der_train = abs(diff_train / Total_Excel_dollar)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = Total_Excel_dollar - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(Total_Excel_dollar) if year >=1400

gen diff_der_test = abs(diff_test / Total_Excel_dollar)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import Total")

putexcel R136 = "RMSE_train"
putexcel S136 = "RRMSE_train"
putexcel T136 = "MAPE_train"
putexcel U136 = "RMSE_test"
putexcel V136 = "RRMSE_test"
putexcel W136 = "MAPE_test"

putexcel R137 = RMSE_train
putexcel S137 = RRMSE_train
putexcel T137 = MAPE_train
putexcel U137 = RMSE_test
putexcel V137 = RRMSE_test
putexcel W137 = MAPE_test






** Model lag1 Ma2 AR1
use "Gomrok Data\DTA Data\cleaned\Aggregategoodstrade", clear

keep if Exp_Imp == "import"
//drop if year >= 1403
merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
replace  Total_Excel_dollar = Total_Excel_dollar / 1000000000

arima Total_Excel_dollar l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P if year < 1400 , arima(1,1,1)
global cmdline = e(cmdline)
putexcel AE100 = "$cmdline"

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

gen error_percent = ((fdollar - Total_Excel_dollar) / Total_Excel_dollar) * 100

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import Total")
twoway (line Total_Excel_dollar year) (line fdollar year) (line error_percent year, yaxis(2)) , legend(on label(1 "داده واقعی واردات کل کالاها") label(2 "داده پیش بینی شده") label(3 "اختلاف درصدی داده واقعی و پیش بینی محور دوم"))  xlabel(, grid)  ytitle(واردات کل کالاها, axis(1)) ytitle(اختلاف درصدی داده واقعی و پیش بینی, axis(2)) title(نمودار پیش بینی دو گروه تمرین و تست) $graph_opts 
graph export "Results\graphs\ARIMA\ Train Test Diff1 Lag2 Ma3 Total Import.png", replace
putexcel AE104 = image(Results\graphs\ARIMA\ Train Test Diff1 Lag2 Ma3 Total Import)
putexcel AE102 = " Train Test Diff1 Lag1 ma2 ar1 Total Import", font(bold)


** Train coefs
gen diff_train = Total_Excel_dollar - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(Total_Excel_dollar)  if year < 1400

gen diff_der_train = abs(diff_train / Total_Excel_dollar)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = Total_Excel_dollar - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(Total_Excel_dollar) if year >=1400

gen diff_der_test = abs(diff_test / Total_Excel_dollar)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import Total")

putexcel AG136 = "RMSE_train"
putexcel AH136 = "RRMSE_train"
putexcel AI136 = "MAPE_train"
putexcel AJ136 = "RMSE_test"
putexcel AK136 = "RRMSE_test"
putexcel AL136 = "MAPE_test"

putexcel AG137 = RMSE_train
putexcel AH137 = RRMSE_train
putexcel AI137 = MAPE_train
putexcel AJ137 = RMSE_test
putexcel AK137 = RRMSE_test
putexcel AL137 = MAPE_test



** Model lag2 Ma3 AR0
use "Gomrok Data\DTA Data\cleaned\Aggregategoodstrade", clear

keep if Exp_Imp == "import"
//drop if year >= 1403
merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
replace  Total_Excel_dollar = Total_Excel_dollar / 1000000000

arima Total_Excel_dollar l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P if year < 1400 , arima(0,1,3)
global cmdline = e(cmdline)
putexcel AT100 = "$cmdline"

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

gen error_percent = ((fdollar - Total_Excel_dollar) / Total_Excel_dollar) * 100

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import Total")
twoway (line Total_Excel_dollar year) (line fdollar year) (line error_percent year, yaxis(2)) , legend(on label(1 "داده واقعی واردات کل کالاها") label(2 "داده پیش بینی شده") label(3 "اختلاف درصدی داده واقعی و پیش بینی محور دوم"))  xlabel(, grid)  ytitle(واردات کل کالاها, axis(1)) ytitle(اختلاف درصدی داده واقعی و پیش بینی, axis(2)) title(نمودار پیش بینی دو گروه تمرین و تست) $graph_opts 
graph export "Results\graphs\ARIMA\ Train Test Diff1 Lag2 Ma3 Total Import.png", replace
putexcel AT104 = image(Results\graphs\ARIMA\ Train Test Diff1 Lag2 Ma3 Total Import)
putexcel AT102 = " Train Test Diff1 Lag2 Ma3 Total Import", font(bold)


** Train coefs
gen diff_train = Total_Excel_dollar - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(Total_Excel_dollar)  if year < 1400

gen diff_der_train = abs(diff_train / Total_Excel_dollar)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = Total_Excel_dollar - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(Total_Excel_dollar) if year >=1400

gen diff_der_test = abs(diff_test / Total_Excel_dollar)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import Total")

putexcel AW136 = "RMSE_train"
putexcel AX136 = "RRMSE_train"
putexcel AY136 = "MAPE_train"
putexcel AZ136 = "RMSE_test"
putexcel BA136 = "RRMSE_test"
putexcel BB136 = "MAPE_test"

putexcel AW137 = RMSE_train
putexcel AX137 = RRMSE_train
putexcel AY137 = MAPE_train
putexcel AZ137 = RMSE_test
putexcel BA137 = RRMSE_test
putexcel BB137 = MAPE_test


/*
*** Now Predicting on the entire data

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import Total")
putexcel A139 = "Here I Present The Predictions based on Selected Model for three years after", font(bold)

use "Gomrok Data\DTA Data\cleaned\Aggregategoodstrade", clear

keep if Exp_Imp == "import"
//drop if year >= 1403
merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

rename azad_growth_P2P Sobat_azad_growth_P2P
rename liquidity_growth_P2P Sobat_liquidity_growth_P2P
rename real_gdp_growth_P2P Sobat_real_gdp_growth_P2P
rename budget_P2P Sobat_budget_P2P
rename inflation_P2P Sobat_inflation_P2P
rename yearly_sii Sobat_yearly_sii

merge 1:1 year using  "Gomrok Data\DTA Data\P2PAfzayesh", nogen
rename azad_growth_P2P Afzayesh_azad_growth_P2P
rename liquidity_growth_P2P Afzayesh_liquidity_growth_P2P
rename real_gdp_growth_P2P Afzayesh_real_gdp_growth_P2P
rename budget_P2P Afzayesh_budget_P2P
rename inflation_P2P Afzayesh_inflation_P2P
rename yearly_sii Afzayesh_yearly_sii

merge 1:1 year using  "Gomrok Data\DTA Data\P2PKahesh", nogen
rename azad_growth_P2P Kahesh_azad_growth_P2P
rename liquidity_growth_P2P Kahesh_liquidity_growth_P2P
rename real_gdp_growth_P2P Kahesh_real_gdp_growth_P2P
rename budget_P2P Kahesh_budget_P2P
rename inflation_P2P Kahesh_inflation_P2P
rename yearly_sii Kahesh_yearly_sii

tsset year
replace  Total_Excel_dollar = Total_Excel_dollar / 1000000000

arima Total_Excel_dollar l2.Sobat_azad_growth_P2P l2.Sobat_yearly_sii l2.Sobat_real_gdp_growth_P2P l2.Sobat_inflation_P2P , arima(0,1,3)
global cmdline = e(cmdline)
putexcel A141 = "$cmdline"

* Check for White noise, Normality of residuals

predict error_Sobat, resid

putexcel A143 = "Pvalue of normality tests"
putexcel B144 = "Shapiro–Wilk test for normality"
putexcel C144 = "Skewness test for normality"
putexcel D144 = "kurtosis test for normality"

swilk error_Sobat
putexcel B145 = matrix(r(p))


sktest error_Sobat
putexcel C145 = matrix(r(p_skew))
putexcel D145 = matrix(r(p_kurt))

putexcel A147 = "The test to chenk residuals being white noise"
putexcel B148 = "Q statistics"
putexcel C148 = "P Value"

wntestq error_Sobat
putexcel B149 = matrix(r(stat))
putexcel C149 = matrix(r(p))

histogram error_Sobat, normal ytitle(چگالی) xtitle(باقیمانده کل داده های صادرات) title(نرمال بودن جز خطا برای مدل با لگ دوم متغیرها و میانگین متحرک 3)  $graph_opts 
graph export "Results\graphs\ARIMA\ Histogram Normality residuals Diff1 Lag2 Ma3 Total Export.png", replace
putexcel B152 = image(Results\graphs\ARIMA\ Histogram Normality residuals Diff1 Lag2 Ma3 Total Export)
putexcel B151 = " Histogram Normality residuals Diff1 Lag2 Ma3 Total Export", font(bold)

qnorm error_Sobat, ytitle(باقیمانده کل داده های صادرات) xtitle(معکوس نرمال) title(نمودار ناپارامترک مقایسه با توزیع نرمال مدل با دو لگ و میانگین متحرک 3) $graph_opts
graph export "Results\graphs\ARIMA\ QQNorm Normality residuals Diff1 Lag2 Ma3 Total Export.png", replace
putexcel O152 = image(Results\graphs\ARIMA\ QQNorm Normality residuals Diff1 Lag2 Ma3 Total Export)
putexcel O151 = " QQNorm Normality residuals Diff1 Lag2 Ma3 Total Export", font(bold)


*** Finally the prediction graph
putexcel A186 = "Here I Present The pridection Trends for three scenarios"
putexcel A187 = "In this case because we are using second lag of variables there is little difference between scenarios"

arima Total_Excel_dollar l2.Sobat_azad_growth_P2P l2.Sobat_yearly_sii l2.Sobat_real_gdp_growth_P2P l2.Sobat_inflation_P2P , arima(0,1,3)
tsappend , add(3)
predict fdollar_Sobat if tin(1380, 1405), y dynamic(y(1403))
label var fdollar_Sobat "forcasted Dollar Export Sobat"

arima Total_Excel_dollar l2.Kahesh_azad_growth_P2P l2.Kahesh_yearly_sii l2.Kahesh_real_gdp_growth_P2P l2.Kahesh_inflation_P2P , arima(0,1,3)
tsappend , add(3)
predict fdollar_Kahesh if tin(1380, 1405), y dynamic(y(1403))
label var fdollar_Kahesh "forcasted Dollar Export Kahesh"


arima Total_Excel_dollar l2.Afzayesh_azad_growth_P2P l2.Afzayesh_yearly_sii l2.Afzayesh_real_gdp_growth_P2P l2.Afzayesh_inflation_P2P , arima(0,1,3)
tsappend , add(3)
predict fdollar_Afzayesh if tin(1380, 1405), y dynamic(y(1403))
label var fdollar_Afzayesh "forcasted Dollar Export Afzayesh"

putexcel set "Results\ARIMA", modify sheet("Choosing Model Export Total")
twoway (line Total_Excel_dollar year,${lp0} lw(thin)) (line fdollar_Sobat year,${lp1} lw(thin)) (line fdollar_Kahesh year,${lp2} lw(thin))  (line fdollar_Afzayesh year ,${lp3} lw(thin))  , legend(on label(1 "داده واقعی صادرات کل کالاها") label(2 "داده پیش بینی شده با فرض ثبات")  label(3 "داده پیش بینی شده با فرض کاهش تحریم")   label(4 "داده پیش بینی شده با فرض افزایش تحریم") size(small))  xlabel(, grid)  ytitle(صادرات کل کالاها, axis(1)) title(نمودار پیش بینی برای سه سناریو) $graph_opts 
graph export "Results\graphs\ARIMA\ Prediction Diff1 Lag2 Ma3 Total Export.png", replace
putexcel B189 = image(Results\graphs\ARIMA\ Prediction Diff1 Lag2 Ma3 Total Export)
putexcel B188 = " Prediction Diff1 Lag2 Ma3 Total Export", font(bold)

*/




**# All Food Export

*** All Food Export Data Predictions


use "Gomrok Data\DTA Data\cleaned\Aggregatefooddata", clear

keep if Exp_Imp == "export"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year

putexcel set "Results\ARIMA", modify sheet("dfuller export food", replace)
twoway (line food_trade year ,${lp0}) ,xtitle(سال) ytitle(ارزش دلاری(میلیارد دلار)) title(صادرات کل خوراکی ها, position(1)) xlabel(1370(5)1400, labsize(small))  ylabel(, labsize(small)) name(totexp, replace)  xscale(titlegap(2)) yscale(titlegap(2)) $graph_opts
graph export "Results\graphs\ARIMA\Total Food Export Over Time.png", replace
putexcel (A4) = image(Results\graphs\ARIMA\Total Food Export Over Time)

putexcel A2 = "This Section Presents dickey fuller test for total food export data", font(bold)

putexcel set "Results\ARIMA", modify sheet("dfuller export food")
ac food_trade ,ytitle(همبستگی برای داده های صادرات کل غذا) title(نمودار همبستگی برای داده های صادرات کل غذا, position(1)) xtitle(لگ) note(بازه اطمینان 95 درصد)
graph export "Results\graphs\ARIMA\ AC graph for Total Food Export Data.png", replace
putexcel A36 = image(Results\graphs\ARIMA\ AC graph for Total Food Export Data)
putexcel A34 = "AC Graph For Total Food Export Data", font(bold)



putexcel set "Results\ARIMA", modify sheet("dfuller export food")
pac food_trade ,ytitle(همبستگی جزیی برای داده های صادرات کل غذا) title(نمودار همبستگی جزیی برای داده های صادرات کل غذا, position(1)) xtitle(لگ) note(بازه اطمینان 95 درصد)
graph export "Results\graphs\ARIMA\ PAC graph for Total Food Export Data.png", replace
putexcel M36 = image(Results\graphs\ARIMA\ PAC graph for Total Food Export Data)
putexcel M34 = "PAC Graph For Total Food Export Data", font(bold)


putexcel A68 = "Here I Present the Dickey fuller test results for Export Total Food Data", font(bold)
putexcel B69 = "Test Statistics"
putexcel C69 = "1% criteria"
putexcel D69= "5% criteria"
putexcel E69 = "10% criteria"
putexcel F69= "MacKinnon approximate p-value"
putexcel G69= "number of observations"
putexcel H69= "lags"

putexcel A70 = "Dfuller with Trend"
dfuller food_trade,trend regress 
putexcel B70 = matrix(r(Zt))
putexcel C70 = matrix(r(cv_1))
putexcel D70 = matrix(r(cv_5))
putexcel E70 = matrix(r(cv_10))
putexcel F70 = matrix(r(p))
putexcel G70 = matrix(r(N))
putexcel H70 = matrix(r(lags))

putexcel A71 = "Dfuller without constant"
dfuller food_trade,noconstant regress 
putexcel B71 = matrix(r(Zt))
putexcel C71 = matrix(r(cv_1))
putexcel D71 = matrix(r(cv_5))
putexcel E71 = matrix(r(cv_10))
putexcel F71 = matrix(r(p))
putexcel G71 = matrix(r(N))
putexcel H71 = matrix(r(lags))

putexcel A72 = "Dfuller with drift"
dfuller food_trade,drift regress lags(3)
putexcel B72 = matrix(r(Zt))
putexcel C72 = matrix(r(cv_1))
putexcel D72 = matrix(r(cv_5))
putexcel E72 = matrix(r(cv_10))
putexcel F72 = matrix(r(p))
putexcel G72 = matrix(r(N))
putexcel H72 = matrix(r(lags))

putexcel A73 = "Dfuller with lags and trend"
dfuller food_trade,trend regress lags(3)
putexcel B73 = matrix(r(Zt))
putexcel C73 = matrix(r(cv_1))
putexcel D73 = matrix(r(cv_5))
putexcel E73 = matrix(r(cv_10))
putexcel F73 = matrix(r(p))
putexcel G73 = matrix(r(N))
putexcel H73 = matrix(r(lags))

putexcel A74 = "Dfuller with drift and lags"
dfuller food_trade,drift regress lags(3)
putexcel B74 = matrix(r(Zt))
putexcel C74 = matrix(r(cv_1))
putexcel D74 = matrix(r(cv_5))
putexcel E74 = matrix(r(cv_10))
putexcel F74= matrix(r(p))
putexcel G74= matrix(r(N))
putexcel H74 = matrix(r(lags))

putexcel A75 = "Here I Present the dickey fuller result for one difference", font(bold)


putexcel A76 = "Here I Present the Dickey fuller test results"
putexcel B76 = "Test Statistics"
putexcel C76 = "1% criteria"
putexcel D76 = "5% criteria"
putexcel E76 = "10% criteria"
putexcel F76 = "MacKinnon approximate p-value"
putexcel G76 = "number of observations"
putexcel H76 = "lags"


putexcel A77 = "Dfuller with trend for one difference of export"
dfuller d.food_trade, trend regress
putexcel B77 = matrix(r(Zt))
putexcel C77 = matrix(r(cv_1))
putexcel D77 = matrix(r(cv_5))
putexcel E77 = matrix(r(cv_10))
putexcel F77 = matrix(r(p))
putexcel G77 = matrix(r(N))
putexcel H77 = matrix(r(lags))

putexcel A78 = "Dfuller without constant for one difference of export"
dfuller d.food_trade, noconstant regress
putexcel B78 = matrix(r(Zt))
putexcel C78 = matrix(r(cv_1))
putexcel D78 = matrix(r(cv_5))
putexcel E78 = matrix(r(cv_10))
putexcel F78= matrix(r(p))
putexcel G78 = matrix(r(N))
putexcel H78 = matrix(r(lags))

putexcel A79 = "Dfuller with drift for one difference of export"
dfuller d.food_trade, drift regress
putexcel B79 = matrix(r(Zt))
putexcel C79 = matrix(r(cv_1))
putexcel D79 = matrix(r(cv_5))
putexcel E79 = matrix(r(cv_10))
putexcel F79= matrix(r(p))
putexcel G79 = matrix(r(N))
putexcel H79 = matrix(r(lags))


putexcel A80 = "Dfuller with lag for one difference of export"
dfuller d.food_trade, trend lags(3) regress
putexcel B80 = matrix(r(Zt))
putexcel C80 = matrix(r(cv_1))
putexcel D80 = matrix(r(cv_5))
putexcel E80 = matrix(r(cv_10))
putexcel F80= matrix(r(p))
putexcel G80 = matrix(r(N))
putexcel H80 = matrix(r(lags))


putexcel A84 = "This Section Presents ACF & PACF for one difference of import data", font(bold)

putexcel set "Results\ARIMA", modify sheet("dfuller export food")
ac d.food_trade ,ytitle(همبستگی برای داده های صادرات غذا) title(نمودار همبستگی برای داده های صادرات غذا, position(1)) xtitle(لگ) note(بازه اطمینان 95 درصد)
graph export "Results\graphs\ARIMA\ AC graph for One difference Food Export Data.png", replace
putexcel A88 = image(Results\graphs\ARIMA\ AC graph for One difference Food Export Data)
putexcel A86 = "AC Graph For One difference Food Export Data", font(bold)



putexcel set "Results\ARIMA", modify sheet("dfuller export food")
pac d.food_trade ,ytitle(همبستگی جزیی برای داده های صادرات غذا) title(نمودار همبستگی جزیی برای داده های صادرات غذا, position(1)) xtitle(لگ) note(بازه اطمینان 95 درصد)
graph export "Results\graphs\ARIMA\ PAC graph for One difference Food Export Data.png", replace
putexcel M88 = image(Results\graphs\ARIMA\ PAC graph for One difference Food Export Data)
putexcel M86 = "PAC Graph For One difference Food Export Data", font(bold)




*** ARIMA Models


putexcel set "Results\ARIMA", modify sheet("Choosing Model Export allFood")
putexcel A2 = "This Sheet Presents Different Criterias to choose a Good model for prediction for Export Total Food Data", font(bold)
putexcel A3 = "These criterias include AIC, BIC, Log Liklelihood, Sigma", font(bold)
putexcel A4 = "The Numbers are transformed into billion"

putexcel A5 = "ARIMA model without exogenous Variables", font(bold)
putexcel B7 = "Sigma"
putexcel C7 = "Number of Observations"
putexcel D7 = "ll (null)"
putexcel E7 = "log likelihood (model)"
putexcel F7 = "df"
putexcel G7 = "AIC"
putexcel H7 = "BIC"

// Error Putexcel 
putexcel I7 = "Mean of residuals"
putexcel J7 = "Min of residuals(billion)"
putexcel K7 = "Max of residuals(billion)"
putexcel L7 = "Portmanteau test for white noise"
putexcel M7 = "eigenvalue of ma1"
putexcel N7 = "eigenvalue of ma2"
putexcel O7 = "eigenvalue of ma3"
putexcel P7 = "eigenvalue of ma4"
putexcel Q7 = "eigenvalue of ma5"
putexcel R7 = "eigenvalue of ma6"
putexcel S7 = "eigenvalue of ma7"
putexcel T7 = "eigenvalue of ma8"
putexcel U7 = "eigenvalue of ar1"
putexcel V7 = "eigenvalue of ar2"
putexcel W7 = "eigenvalue of ar3"
putexcel X7 = "eigenvalue of ar4"
putexcel Z7 = "eigenvalue of ar5"


*Without Exogenous Variables

local m=8
* AR = 0

putexcel A6 = "Ar = 0"

forvalues q = 1/10 {
	arima food_trade , arima(0,0,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))	
	
	drop error
local m = `m' + 1
}

* AR = 1
putexcel A19 = "AR = 1"
local m=20
forvalues q = 0/10{
	arima food_trade , arima(1,0,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	estat aroots
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}


* AR = 2
putexcel A30 = "AR = 2"
local m=31
forvalues q = 0/2 {
	arima food_trade , arima(2,0,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}


* AR = 3
putexcel A35 = "AR = 3"
local m=36
forvalues q = 0/2 {
	arima food_trade , arima(3,0,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



* AR = 4
putexcel A40 = "AR = 4"
local m=41
forvalues q = 0/0 {
	arima food_trade , arima(4,0,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}




* AR = 5
putexcel A43 = "AR = 5"
local m=44
forvalues q = 0/0 {
	arima food_trade , arima(5,0,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



** Models with exogenous Variables


putexcel A48 = "Models With Exogenous Variables"
putexcel A49 = "Models with some Macro Variables"

local m=52
putexcel A51 = "AR = 0"
* AR = 0
forvalues q = 1/6 {
	arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P, arima(0,0,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))	
	drop error
local m = `m' + 1
}

putexcel A59 = "AR = 1"
* AR = 1
local m=60

forvalues q = 0/2 {
	arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P, arima(1,0,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



putexcel A65 = "AR = 2"
* AR = 2
local m=66
forvalues q = 0/2 {
	arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P, arima(2,0,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}




putexcel A70 = "AR = 3"
* AR = 3
local m=71
forvalues q = 0/1 {
	arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P, arima(3,0,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



putexcel A74 = "AR = 4"
* AR = 4
local m=75
forvalues q = 0/1 {
	arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P, arima(4,0,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}




putexcel A79 = "AR = 5"
* AR = 5
local m=80
forvalues q = 0/1 {
	arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P, arima(5,0,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}






** With First lag of Variables

putexcel A84 = "Models with One lag of Variables", font(bold)

putexcel A85 = "AR = 0"
local m=86
* AR = 0
forvalues q = 1/7 {
	arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P, arima(0,0,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))	
	drop error
local m = `m' + 1
}

putexcel A94 = "AR = 1"
* AR = 1
local m=95

forvalues q = 0/5 {
	arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P, arima(1,0,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



putexcel A103 = "AR = 2"
* AR = 2
local m=104
forvalues q = 0/2 {
	arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P, arima(2,0,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}


putexcel A108 = "AR = 3"
* AR = 3
local m=109
forvalues q = 0/1 {
	arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P, arima(3,0,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



putexcel A112 = "AR = 4"
* AR = 4
local m=113
forvalues q = 0/1 {
	arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P, arima(4,0,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



putexcel A117 = "AR = 5"
* AR = 5
local m=118
forvalues q = 0/1 {
	arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P, arima(5,0,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}




** Models with second lag of Variables


putexcel A122 = "Models with Second lag of Variables", font(bold)

putexcel A123 = "AR = 0"
local m=124
* AR = 0
forvalues q = 1/6 {
	arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P, arima(0,0,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))	
	drop error
local m = `m' + 1
}


putexcel A131 = "AR = 1"
* AR = 1
local m=132

forvalues q = 0/6 {
	arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P, arima(1,0,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



putexcel A140 = "AR = 2"
* AR = 2
local m=141
forvalues q = 0/2 {
	arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P, arima(2,0,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}




putexcel A145 = "AR = 3"
* AR = 3
local m=146
forvalues q = 0/2 {
	arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P, arima(3,0,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}





putexcel A150 = "AR = 4"
* AR = 4
local m=151
forvalues q = 0/2 {
	arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P, arima(4,0,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}




putexcel A155 = "AR = 5"
* AR = 5
local m=156
forvalues q = 0/2 {
	arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P, arima(5,0,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



*** Prediction For All Food Export
/*
use "Gomrok Data\DTA Data\cleaned\Aggregatefooddata", clear

keep if Exp_Imp == "export"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PAfzayesh", nogen

tsset year



drop if year >= 1403

arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P if year < 1401 , arima(4, 0, 0)
display e(sigma)
global cmdline = e(cmdline)

putexcel A8 = "$cmdline"
putexcel B8 = matrix(e(sigma))

estat ic
ereturn list

putexcel C8 = matrix(r(S))

predict error, residuals
summarize error
putexcel I8 = matrix(r(mean))
putexcel J8 = matrix(r(min))
putexcel K8 = matrix(r(max))

// tsline error , yline(1.42e+07   )

wntestq error
putexcel L8 = matrix(r(p))

estat aroots
putexcel M8 = matrix(r(Modulus_ma))

tsappend , add(3)
predict fdollar, y dynamic(y(1401))
label var fdollar "forcasted Dollar Export"

gen error_percent = ((fdollar - food_trade) / food_trade) * 100

twoway (line food_trade year) (line fdollar year) (line error_percent year, yaxis(2)) ,  xlabel(, grid)

drop error_percent
drop fdollar

* ARIMA Model with Exogenous variables
drop if year >=1403


// arima Total_Excel_dollar l.azad_growth_P2P, arima(0,1,6)
arima Total_Excel_dollar l.azad_growth_P2P , arima(0,1,2)

estat ic
predict error, residuals
summarize error

predict prediction
summarize prediction


tsline error , yline(1.42e+07   )

wntestq error

estat aroots

tsappend , add(3)

predict fdollar, y dynamic(y(1403))
label var fdollar "forcasted Dollar Export"


gen error_percent = ((fdollar - Total_Excel_dollar) / Total_Excel_dollar) * 100

twoway (line Total_Excel_dollar year) (line fdollar year) (line error_percent year, yaxis(2)) ,  xlabel(, grid)

*/




**# All Food Import 


*** All Food Import Data

use "Gomrok Data\DTA Data\cleaned\Aggregatefooddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year

putexcel set "Results\ARIMA", modify sheet("dfuller import food", replace)
twoway (line food_trade year ,${lp0}) ,xtitle(سال) ytitle(ارزش دلاری(میلیارد دلار)) title(واردات کل خوراکی ها, position(1)) xlabel(1370(5)1400, labsize(small))  ylabel(, labsize(small)) name(totexp, replace)  xscale(titlegap(2)) yscale(titlegap(2)) $graph_opts
graph export "Results\graphs\ARIMA\Total Food Import Over Time.png", replace
putexcel (A4) = image(Results\graphs\ARIMA\Total Food Import Over Time)

putexcel A2 = "This Section Presents dickey fuller test for total food import data", font(bold)

putexcel set "Results\ARIMA", modify sheet("dfuller import food")
ac food_trade ,ytitle(همبستگی برای داده های واردات کل غذا) title(نمودار همبستگی برای داده های واردات کل غذا, position(1)) xtitle(لگ) note(بازه اطمینان 95 درصد)
graph export "Results\graphs\ARIMA\ AC graph for Total Food Import Data.png", replace
putexcel A36 = image(Results\graphs\ARIMA\ AC graph for Total Food Import Data)
putexcel A34 = "AC Graph For Total Food Import Data", font(bold)



putexcel set "Results\ARIMA", modify sheet("dfuller import food")
pac food_trade ,ytitle(همبستگی جزیی برای داده های واردات کل غذا) title(نمودار همبستگی جزیی برای داده های واردات کل غذا, position(1)) xtitle(لگ) note(بازه اطمینان 95 درصد)
graph export "Results\graphs\ARIMA\ PAC graph for Total Food Import Data.png", replace
putexcel M36 = image(Results\graphs\ARIMA\ PAC graph for Total Food Import Data)
putexcel M34 = "PAC Graph For Total Food Import Data", font(bold)


putexcel A68 = "Here I Present the Dickey fuller test results for Import Total Food Data", font(bold)
putexcel B69 = "Test Statistics"
putexcel C69 = "1% criteria"
putexcel D69= "5% criteria"
putexcel E69 = "10% criteria"
putexcel F69= "MacKinnon approximate p-value"
putexcel G69= "number of observations"
putexcel H69= "lags"

putexcel A70 = "Dfuller with Trend"
dfuller food_trade,trend regress 
putexcel B70 = matrix(r(Zt))
putexcel C70 = matrix(r(cv_1))
putexcel D70 = matrix(r(cv_5))
putexcel E70 = matrix(r(cv_10))
putexcel F70 = matrix(r(p))
putexcel G70 = matrix(r(N))
putexcel H70 = matrix(r(lags))

putexcel A71 = "Dfuller without constant"
dfuller food_trade,noconstant regress 
putexcel B71 = matrix(r(Zt))
putexcel C71 = matrix(r(cv_1))
putexcel D71 = matrix(r(cv_5))
putexcel E71 = matrix(r(cv_10))
putexcel F71 = matrix(r(p))
putexcel G71 = matrix(r(N))
putexcel H71 = matrix(r(lags))

putexcel A72 = "Dfuller with drift"
dfuller food_trade,drift regress lags(3)
putexcel B72 = matrix(r(Zt))
putexcel C72 = matrix(r(cv_1))
putexcel D72 = matrix(r(cv_5))
putexcel E72 = matrix(r(cv_10))
putexcel F72 = matrix(r(p))
putexcel G72 = matrix(r(N))
putexcel H72 = matrix(r(lags))

putexcel A73 = "Dfuller with lags and trend"
dfuller food_trade,trend regress lags(3)
putexcel B73 = matrix(r(Zt))
putexcel C73 = matrix(r(cv_1))
putexcel D73 = matrix(r(cv_5))
putexcel E73 = matrix(r(cv_10))
putexcel F73 = matrix(r(p))
putexcel G73 = matrix(r(N))
putexcel H73 = matrix(r(lags))

putexcel A74 = "Dfuller with drift and lags"
dfuller food_trade,drift regress lags(3)
putexcel B74 = matrix(r(Zt))
putexcel C74 = matrix(r(cv_1))
putexcel D74 = matrix(r(cv_5))
putexcel E74 = matrix(r(cv_10))
putexcel F74= matrix(r(p))
putexcel G74= matrix(r(N))
putexcel H74 = matrix(r(lags))

putexcel A75 = "Here I Present the dickey fuller result for one difference", font(bold)


putexcel A76 = "Here I Present the Dickey fuller test results"
putexcel B76 = "Test Statistics"
putexcel C76 = "1% criteria"
putexcel D76 = "5% criteria"
putexcel E76 = "10% criteria"
putexcel F76 = "MacKinnon approximate p-value"
putexcel G76 = "number of observations"
putexcel H76 = "lags"


putexcel A77 = "Dfuller with trend for one difference of export"
dfuller d.food_trade, trend regress
putexcel B77 = matrix(r(Zt))
putexcel C77 = matrix(r(cv_1))
putexcel D77 = matrix(r(cv_5))
putexcel E77 = matrix(r(cv_10))
putexcel F77 = matrix(r(p))
putexcel G77 = matrix(r(N))
putexcel H77 = matrix(r(lags))

putexcel A78 = "Dfuller without constant for one difference of export"
dfuller d.food_trade, noconstant regress
putexcel B78 = matrix(r(Zt))
putexcel C78 = matrix(r(cv_1))
putexcel D78 = matrix(r(cv_5))
putexcel E78 = matrix(r(cv_10))
putexcel F78= matrix(r(p))
putexcel G78 = matrix(r(N))
putexcel H78 = matrix(r(lags))

putexcel A79 = "Dfuller with drift for one difference of export"
dfuller d.food_trade, drift regress
putexcel B79 = matrix(r(Zt))
putexcel C79 = matrix(r(cv_1))
putexcel D79 = matrix(r(cv_5))
putexcel E79 = matrix(r(cv_10))
putexcel F79= matrix(r(p))
putexcel G79 = matrix(r(N))
putexcel H79 = matrix(r(lags))


putexcel A80 = "Dfuller with lag for one difference of export"
dfuller d.food_trade, trend lags(3) regress
putexcel B80 = matrix(r(Zt))
putexcel C80 = matrix(r(cv_1))
putexcel D80 = matrix(r(cv_5))
putexcel E80 = matrix(r(cv_10))
putexcel F80= matrix(r(p))
putexcel G80 = matrix(r(N))
putexcel H80 = matrix(r(lags))


putexcel A84 = "This Section Presents ACF & PACF for one difference of import data", font(bold)

putexcel set "Results\ARIMA", modify sheet("dfuller import food")
ac d.food_trade ,ytitle(همبستگی برای داده های واردات غذا) title(نمودار همبستگی برای داده های واردات غذا, position(1)) xtitle(لگ) note(بازه اطمینان 95 درصد)
graph export "Results\graphs\ARIMA\ AC graph for One difference Food Import Data.png", replace
putexcel A88 = image(Results\graphs\ARIMA\ AC graph for One difference Food Import Data)
putexcel A86 = "AC Graph For One difference Food Import Data", font(bold)



putexcel set "Results\ARIMA", modify sheet("dfuller import food")
pac d.food_trade ,ytitle(همبستگی جزیی برای داده های واردات غذا) title(نمودار همبستگی جزیی برای داده های واردات غذا, position(1)) xtitle(لگ) note(بازه اطمینان 95 درصد)
graph export "Results\graphs\ARIMA\ PAC graph for One difference Food Import Data.png", replace
putexcel M88 = image(Results\graphs\ARIMA\ PAC graph for One difference Food Import Data)
putexcel M86 = "PAC Graph For One difference Food Import Data", font(bold)


*** ARIMA Models


putexcel set "Results\ARIMA", modify sheet("Choosing Model Import allFood")
putexcel A2 = "This Sheet Presents Different Criterias to choose a Good model for prediction for Import Total Food Data", font(bold)
putexcel A3 = "These criterias include AIC, BIC, Log Liklelihood, Sigma", font(bold)
putexcel A4 = "The Numbers are transformed into billion"

putexcel A5 = "ARIMA model without exogenous Variables", font(bold)
putexcel B7 = "Sigma"
putexcel C7 = "Number of Observations"
putexcel D7 = "ll (null)"
putexcel E7 = "log likelihood (model)"
putexcel F7 = "df"
putexcel G7 = "AIC"
putexcel H7 = "BIC"

// Error Putexcel 
putexcel I7 = "Mean of residuals"
putexcel J7 = "Min of residuals(billion)"
putexcel K7 = "Max of residuals(billion)"
putexcel L7 = "Portmanteau test for white noise"
putexcel M7 = "eigenvalue of ma1"
putexcel N7 = "eigenvalue of ma2"
putexcel O7 = "eigenvalue of ma3"
putexcel P7 = "eigenvalue of ma4"
putexcel Q7 = "eigenvalue of ma5"
putexcel R7 = "eigenvalue of ma6"
putexcel S7 = "eigenvalue of ma7"
putexcel T7 = "eigenvalue of ma8"
putexcel U7 = "eigenvalue of ar1"
putexcel V7 = "eigenvalue of ar2"
putexcel W7 = "eigenvalue of ar3"
putexcel X7 = "eigenvalue of ar4"
putexcel Z7 = "eigenvalue of ar5"


*Without Exogenous Variables

local m=8
* AR = 0

putexcel A6 = "Ar = 0"

forvalues q = 1/10 {
	arima food_trade , arima(0,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))	
	
	drop error
local m = `m' + 1
}

* AR = 1
putexcel A19 = "AR = 1"
local m=20
forvalues q = 0/9{
	arima food_trade , arima(1,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	estat aroots
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}


* AR = 2
putexcel A30 = "AR = 2"
local m=31
forvalues q = 0/0 {
	arima food_trade , arima(2,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}


* AR = 3
putexcel A35 = "AR = 3"
local m=36
forvalues q = 0/3 {
	arima food_trade , arima(3,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



* AR = 4
putexcel A40 = "AR = 4"
local m=41
forvalues q = 0/3 {
	arima food_trade , arima(4,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}




* AR = 5
putexcel A46 = "AR = 5"
local m=47
forvalues q = 0/4 {
	arima food_trade , arima(5,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



** Models with exogenous Variables


putexcel A54 = "Models With Exogenous Variables"
putexcel A55 = "Models with some Macro Variables"

local m=58
putexcel A57 = "AR = 0"
* AR = 0
forvalues q = 1/7 {
	arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P, arima(0,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))	
	drop error
local m = `m' + 1
}

putexcel A63 = "AR = 1"
* AR = 1
local m=64

forvalues q = 0/5 {
	arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P, arima(1,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



putexcel A70 = "AR = 2"
* AR = 2
local m=71
forvalues q = 0/1 {
	arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P, arima(2,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}




putexcel A75 = "AR = 3"
* AR = 3
local m=76
forvalues q = 0/1 {
	arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P, arima(3,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



putexcel A79 = "AR = 4"
* AR = 4
local m=80
forvalues q = 0/1 {
	arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P, arima(4,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}




putexcel A83 = "AR = 5"
* AR = 5
local m=84
forvalues q = 0/1 {
	arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P, arima(5,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}






** With First lag of Variables

putexcel A87 = "Models with One lag of Variables", font(bold)

putexcel A88 = "AR = 0"
local m=89
* AR = 0
forvalues q = 1/6 {
	arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P, arima(0,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))	
	drop error
local m = `m' + 1
}

putexcel A96 = "AR = 1"
* AR = 1
local m=97

forvalues q = 0/1 {
	arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P, arima(1,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



putexcel A100 = "AR = 2"
* AR = 2
local m=101
forvalues q = 0/4 {
	arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P, arima(2,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}


putexcel A107 = "AR = 3"
* AR = 3
local m=108
forvalues q = 0/0 {
	arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P, arima(3,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



putexcel A110 = "AR = 4"
* AR = 4
local m=111
forvalues q = 0/0 {
	arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P, arima(4,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



putexcel A113 = "AR = 5"
* AR = 5
local m=114
forvalues q = 0/1 {
	arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P, arima(5,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}


** Models with second lag of Variables

putexcel A118 = "Models with Second lag of Variables", font(bold)

putexcel A119 = "AR = 0"
local m=120
* AR = 0
forvalues q = 1/6 {
	arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P, arima(0,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))	
	drop error
local m = `m' + 1
}


putexcel A129 = "AR = 1"
* AR = 1
local m=130

forvalues q = 0/0 {
	arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P, arima(1,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



putexcel A133 = "AR = 2"
* AR = 2
local m=134
forvalues q = 0/3 {
	arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P, arima(2,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}




putexcel A139 = "AR = 3"
* AR = 3
local m=140
forvalues q = 0/1 {
	arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P, arima(3,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}


putexcel A143 = "AR = 4"
* AR = 4
local m=144
forvalues q = 0/0 {
	arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P, arima(4,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}


putexcel A146 = "AR = 5"
* AR = 5
local m=147
forvalues q = 0/0 {
	arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P, arima(5,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}








*** Prediction For All Food Export
/*
use "Gomrok Data\DTA Data\cleaned\Aggregatefooddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year

drop if year >= 1403

arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P if year < 1400 , arima(2, 1, 4)
display e(sigma)
global cmdline = e(cmdline)

putexcel A8 = "$cmdline"
putexcel B8 = matrix(e(sigma))

estat ic
ereturn list

putexcel C8 = matrix(r(S))

predict error, residuals
summarize error
putexcel I8 = matrix(r(mean))
putexcel J8 = matrix(r(min))
putexcel K8 = matrix(r(max))

// tsline error , yline(1.42e+07   )

wntestq error
putexcel L8 = matrix(r(p))

estat aroots
putexcel M8 = matrix(r(Modulus_ma))

tsappend , add(3)
predict fdollar, y dynamic(y(1400))
label var fdollar "forcasted Dollar Export"

gen error_percent = ((fdollar - food_trade) / food_trade) * 100

twoway (line food_trade year) (line fdollar year) (line error_percent year, yaxis(2)) ,  xlabel(, grid)

drop error_percent
drop fdollar

* ARIMA Model with Exogenous variables
drop if year >=1403


// arima Total_Excel_dollar l.azad_growth_P2P, arima(0,1,6)
arima Total_Excel_dollar l.azad_growth_P2P , arima(0,1,2)

estat ic
predict error, residuals
summarize error

predict prediction
summarize prediction


tsline error , yline(1.42e+07   )

wntestq error

estat aroots

tsappend , add(3)

predict fdollar, y dynamic(y(1403))
label var fdollar "forcasted Dollar Export"


gen error_percent = ((fdollar - Total_Excel_dollar) / Total_Excel_dollar) * 100

twoway (line Total_Excel_dollar year) (line fdollar year) (line error_percent year, yaxis(2)) ,  xlabel(, grid)

*/




***** Predictions

*** Train and Test Split
putexcel set "Results\ARIMA", modify sheet("Choosing Model Import allFood")
putexcel A150 = "This Part Presents Predictions based on Selected Models", font(bold)
putexcel A151 = "This Part Splits Data into Train and test and Presents RMSE, RRMSE and MAPE"
putexcel A152= "Last Three years are considered Test"



** Model lag1 ma3 ar0
use "Gomrok Data\DTA Data\cleaned\Aggregatefooddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year

arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P if year < 1400 , arima(0, 1,3)
global cmdline = e(cmdline)
putexcel A155 = "$cmdline"

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

gen error_percent = ((fdollar - food_trade) / food_trade) * 100

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import allFood")
twoway (line food_trade year) (line fdollar year) (line error_percent year, yaxis(2)) , legend(on label(1 "داده واقعی واردات کل غذا") label(2 "داده پیش بینی شده") label(3 "اختلاف درصدی داده واقعی و پیش بینی محور دوم"))  xlabel(, grid)  ytitle(واردات کل غذا, axis(1)) ytitle(اختلاف درصدی داده واقعی و پیش بینی, axis(2)) title(نمودار پیش بینی دو گروه تمرین و تست) $graph_opts 
graph export "Results\graphs\ARIMA\ Train Test Diff1 Lag1 Ma3 Food Import.png", replace
putexcel B159 = image(Results\graphs\ARIMA\ Train Test Diff1 Lag1 Ma3 Food Import)
putexcel B157 = " Train Test Diff1 Lag1 ma3 Food Import", font(bold)


** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import allFood")

putexcel C192 = "RMSE_train"
putexcel D192 = "RRMSE_train"
putexcel E192 = "MAPE_train"
putexcel F192 = "RMSE_test"
putexcel G192 = "RRMSE_test"
putexcel H192 = "MAPE_test"

putexcel C193 = RMSE_train
putexcel D193 = RRMSE_train
putexcel E193 = MAPE_train
putexcel F193 = RMSE_test
putexcel G193 = RRMSE_test
putexcel H193 = MAPE_test



** Model lag1 ma0 ar2

use "Gomrok Data\DTA Data\cleaned\Aggregatefooddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen


tsset year

arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P if year < 1400 , arima(2, 1, 0)
global cmdline = e(cmdline)
putexcel Q155 = "$cmdline"

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

gen error_percent = ((fdollar - food_trade) / food_trade) * 100

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import allFood")
twoway (line food_trade year) (line fdollar year) (line error_percent year, yaxis(2)) , legend(on label(1 "داده واقعی واردات غذا") label(2 "داده پیش بینی شده") label(3 "اختلاف درصدی داده واقعی و پیش بینی محور دوم"))  xlabel(, grid)  ytitle(واردات کل غذا, axis(1)) ytitle(اختلاف درصدی داده واقعی و پیش بینی, axis(2)) title(نمودار پیش بینی دو گروه تمرین و تست) $graph_opts 
graph export "Results\graphs\ARIMA\ Train Test Diff1 Lag1 Ma0 ar2 Food Import.png", replace
putexcel Q159 = image(Results\graphs\ARIMA\ Train Test Diff1 Lag1 Ma0 ar2 Food Import)
putexcel Q157 = " Train Test Diff1 Lag1 Ma0 ar2 Food Import", font(bold)


** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import allFood")

putexcel T192 = "RMSE_train"
putexcel U192 = "RRMSE_train"
putexcel V192 = "MAPE_train"
putexcel W192 = "RMSE_test"
putexcel X192 = "RRMSE_test"
putexcel Y192 = "MAPE_test"

putexcel T193 = RMSE_train
putexcel U193 = RRMSE_train
putexcel V193 = MAPE_train
putexcel W193 = RMSE_test
putexcel X193 = RRMSE_test
putexcel Y193 = MAPE_test



** Model lag1 ma0 ar4

use "Gomrok Data\DTA Data\cleaned\Aggregatefooddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen


tsset year

arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P if year < 1400 , arima(4, 1, 0)
global cmdline = e(cmdline)
putexcel AE155 = "$cmdline"

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

gen error_percent = ((fdollar - food_trade) / food_trade) * 100

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import allFood")
twoway (line food_trade year) (line fdollar year) (line error_percent year, yaxis(2)) , legend(on label(1 "داده واقعی واردات کل غذا") label(2 "داده پیش بینی شده") label(3 "اختلاف درصدی داده واقعی و پیش بینی محور دوم"))  xlabel(, grid)  ytitle(واردات کل غذا, axis(1)) ytitle(اختلاف درصدی داده واقعی و پیش بینی, axis(2)) title(نمودار پیش بینی دو گروه تمرین و تست) $graph_opts 
graph export "Results\graphs\ARIMA\ Train Test Diff1 Lag1 Ma0 ar4 Food Import.png", replace
putexcel AE159 = image(Results\graphs\ARIMA\ Train Test Diff1 Lag1 Ma0 ar4 Food Import)
putexcel AE157 = " Train Test Diff1 Lag1 Ma0 ar4 Food Import", font(bold)


** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import allFood")

putexcel AG192 = "RMSE_train"
putexcel AH192 = "RRMSE_train"
putexcel AI192 = "MAPE_train"
putexcel AJ192 = "RMSE_test"
putexcel AK192 = "RRMSE_test"
putexcel AL192 = "MAPE_test"

putexcel AG193 = RMSE_train
putexcel AH193 = RRMSE_train
putexcel AI193 = MAPE_train
putexcel AJ193 = RMSE_test
putexcel AK193 = RRMSE_test
putexcel AL193 = MAPE_test



** Model lag2 ma3 ar0

use "Gomrok Data\DTA Data\cleaned\Aggregatefooddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen


tsset year

arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P if year < 1400 , arima(0, 1, 3)
global cmdline = e(cmdline)
putexcel AT155 = "$cmdline"

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

gen error_percent = ((fdollar - food_trade) / food_trade) * 100

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import allFood")
twoway (line food_trade year) (line fdollar year) (line error_percent year, yaxis(2)) , legend(on label(1 "داده واقعی واردات کل غذا") label(2 "داده پیش بینی شده") label(3 "اختلاف درصدی داده واقعی و پیش بینی محور دوم"))  xlabel(, grid)  ytitle(واردات کل غذا, axis(1)) ytitle(اختلاف درصدی داده واقعی و پیش بینی, axis(2)) title(نمودار پیش بینی دو گروه تمرین و تست) $graph_opts 
graph export "Results\graphs\ARIMA\ Train Test Diff1 Lag2 Ma3 ar0 Food Import.png", replace
putexcel AT159 = image(Results\graphs\ARIMA\ Train Test Diff1 Lag1 Ma3 ar0 Food Import)
putexcel AT157 = " Train Test Diff1 Lag2 Ma3 ar0 Food Import", font(bold)


** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import allFood")

putexcel AV192 = "RMSE_train"
putexcel AW192 = "RRMSE_train"
putexcel AX192 = "MAPE_train"
putexcel AY192 = "RMSE_test"
putexcel AZ192 = "RRMSE_test"
putexcel BA192 = "MAPE_test"

putexcel AV193 = RMSE_train
putexcel AW193 = RRMSE_train
putexcel AX193 = MAPE_train
putexcel AY193 = RMSE_test
putexcel AZ193 = RRMSE_test
putexcel BA193 = MAPE_test





** Model lag2 ma2 ar2

use "Gomrok Data\DTA Data\cleaned\Aggregatefooddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen


tsset year

arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P if year < 1400 , arima(1, 1, 0)
global cmdline = e(cmdline)
putexcel AT155 = "$cmdline"

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

gen error_percent = ((fdollar - food_trade) / food_trade) * 100

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import allFood")
twoway (line food_trade year) (line fdollar year) (line error_percent year, yaxis(2)) , legend(on label(1 "داده واقعی واردات کل غذا") label(2 "داده پیش بینی شده") label(3 "اختلاف درصدی داده واقعی و پیش بینی محور دوم"))  xlabel(, grid)  ytitle(واردات کل غذا, axis(1)) ytitle(اختلاف درصدی داده واقعی و پیش بینی, axis(2)) title(نمودار پیش بینی دو گروه تمرین و تست) $graph_opts 
graph export "Results\graphs\ARIMA\ Train Test Diff1 Lag2 Ma2 ar2 Food Import.png", replace
putexcel AT159 = image(Results\graphs\ARIMA\ Train Test Diff1 Lag1 Ma2 ar2 Food Import)
putexcel AT157 = " Train Test Diff1 Lag2 Ma2 ar2 Food Import", font(bold)


** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import allFood")

putexcel AV192 = "RMSE_train"
putexcel AW192 = "RRMSE_train"
putexcel AX192 = "MAPE_train"
putexcel AY192 = "RMSE_test"
putexcel AZ192 = "RRMSE_test"
putexcel BA192 = "MAPE_test"

putexcel AV193 = RMSE_train
putexcel AW193 = RRMSE_train
putexcel AX193 = MAPE_train
putexcel AY193 = RMSE_test
putexcel AZ193 = RRMSE_test
putexcel BA193 = MAPE_test



** I Choose the lag1 ar4 ma0 Model

*** Now Predicting on the entire data

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import allFood")
putexcel A196 = "Here I Present The Predictions based on Selected Model for three years after", font(bold)

use "Gomrok Data\DTA Data\cleaned\Aggregatefooddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

rename azad_growth_P2P Sobat_azad_growth_P2P
rename liquidity_growth_P2P Sobat_liquidity_growth_P2P
rename real_gdp_growth_P2P Sobat_real_gdp_growth_P2P
rename budget_P2P Sobat_budget_P2P
rename inflation_P2P Sobat_inflation_P2P
rename yearly_sii Sobat_yearly_sii

merge 1:1 year using  "Gomrok Data\DTA Data\P2PAfzayesh", nogen
rename azad_growth_P2P Afzayesh_azad_growth_P2P
rename liquidity_growth_P2P Afzayesh_liquidity_growth_P2P
rename real_gdp_growth_P2P Afzayesh_real_gdp_growth_P2P
rename budget_P2P Afzayesh_budget_P2P
rename inflation_P2P Afzayesh_inflation_P2P
rename yearly_sii Afzayesh_yearly_sii

merge 1:1 year using  "Gomrok Data\DTA Data\P2PKahesh", nogen
rename azad_growth_P2P Kahesh_azad_growth_P2P
rename liquidity_growth_P2P Kahesh_liquidity_growth_P2P
rename real_gdp_growth_P2P Kahesh_real_gdp_growth_P2P
rename budget_P2P Kahesh_budget_P2P
rename inflation_P2P Kahesh_inflation_P2P
rename yearly_sii Kahesh_yearly_sii

tsset year

arima food_trade l.Sobat_azad_growth_P2P l.Sobat_yearly_sii l.Sobat_real_gdp_growth_P2P l.Sobat_inflation_P2P , arima(4, 1, 0)
global cmdline = e(cmdline)
putexcel A198 = "$cmdline"

* Check for White noise, Normality of residuals

predict error_Sobat, resid

putexcel A200 = "Pvalue of normality tests"
putexcel B201 = "Shapiro–Wilk test for normality"
putexcel C201 = "Skewness test for normality"
putexcel D201 = "kurtosis test for normality"

swilk error_Sobat
putexcel B202 = matrix(r(p))


sktest error_Sobat
putexcel C202 = matrix(r(p_skew))
putexcel D202 = matrix(r(p_kurt))

putexcel A205 = "The test to chenk residuals being white noise"
putexcel B206 = "Q statistics"
putexcel C206 = "P Value"

wntestq error_Sobat
putexcel B207 = matrix(r(stat))
putexcel C207 = matrix(r(p))

histogram error_Sobat, normal ytitle(چگالی) xtitle(باقیمانده کل داده های صادرات) title(نرمال بودن جز خطا برای مدل با لگ دوم متغیرها و میانگین متحرک 3)  $graph_opts 
graph export "Results\graphs\ARIMA\ Histogram Normality residuals Diff1 Lag1 Ma1 Food Industry Import.png", replace
putexcel B212 = image(Results\graphs\ARIMA\ Histogram Normality residuals Diff1 Lag1 Ma1 Food Industry Import) 
putexcel B211 = " Histogram Normality residuals Diff1 Lag1 Ma1 Food Industry Import", font(bold)

qnorm error_Sobat, ytitle(باقیمانده کل داده های صادرات) xtitle(معکوس نرمال) title(نمودار ناپارامترک مقایسه با توزیع نرمال مدل با دو لگ و میانگین متحرک 3) $graph_opts
graph export "Results\graphs\ARIMA\ QQNorm Normality residuals Diff1 Lag1 Ma1 Food Industry Import.png", replace
putexcel O212 = image(Results\graphs\ARIMA\ QQNorm Normality residuals Diff1 Lag1 Ma1 Food Industry Import)
putexcel O211 = " QQNorm Normality residuals Diff1 Lag1 Ma1 Food Industry Import", font(bold)


*** Finally the prediction graph
putexcel A245 = "Here I Present The pridection Trends for three scenarios"
putexcel A246 = "In this case because we are using second lag of variables there is little difference between scenarios"

arima food_trade l.Sobat_azad_growth_P2P l.Sobat_yearly_sii l.Sobat_real_gdp_growth_P2P l.Sobat_inflation_P2P , arima(4, 1, 0)
tsappend , add(3)
predict fdollar_Sobat if tin(1380, 1405), y dynamic(y(1403))
label var fdollar_Sobat "forcasted Dollar Import Sobat"

arima food_trade l.Kahesh_azad_growth_P2P l.Kahesh_yearly_sii l.Kahesh_real_gdp_growth_P2P l.Kahesh_inflation_P2P , arima(4, 1, 0)
tsappend , add(3)
predict fdollar_Kahesh if tin(1380, 1405), y dynamic(y(1403))
label var fdollar_Kahesh "forcasted Dollar Import Kahesh"


arima food_trade l.Afzayesh_azad_growth_P2P l.Afzayesh_yearly_sii l.Afzayesh_real_gdp_growth_P2P l.Afzayesh_inflation_P2P , arima(4, 1, 0)
tsappend , add(3)
predict fdollar_Afzayesh if tin(1380, 1405), y dynamic(y(1403))
label var fdollar_Afzayesh "forcasted Dollar Import Afzayesh"

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import allFood")
twoway (line food_trade year,${lp0} lw(thin)) (line fdollar_Sobat year,${lp1} lw(thin)) (line fdollar_Kahesh year,${lp2} lw(thin))  (line fdollar_Afzayesh year ,${lp3} lw(thin))  , legend(on label(1 "داده واقعی واردات کل غذا") label(2 "داده پیش بینی شده با فرض ثبات")  label(3 "داده پیش بینی شده با فرض کاهش تحریم")   label(4 "داده پیش بینی شده با فرض افزایش تحریم") size(small))  xlabel(, grid)  ytitle(واردات کل غذا, axis(1)) title(نمودار پیش بینی برای سه سناریو) $graph_opts 
graph export "Results\graphs\ARIMA\ Prediction Diff1 Lag1 Ma1 Food Industry Import.png", replace
putexcel B250 = image(Results\graphs\ARIMA\ Prediction Diff1 Lag1 Ma1 Food Industry Import)
putexcel B249 = " Prediction Diff1 Lag1 Ma1 Food Industry Import", font(bold)


*/





**# Food Industry Export

*** Food Industry Export Data Predictions

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "export"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year

putexcel set "Results\ARIMA", modify sheet("dfuller export ind food", replace)
twoway (line food_trade year ,${lp0}) ,xtitle(سال) ytitle(ارزش دلاری(میلیارد دلار)) title(صادرات صنعت خوراکی, position(1)) xlabel(1370(5)1400, labsize(small))  ylabel(, labsize(small)) name(totexp, replace)  xscale(titlegap(2)) yscale(titlegap(2)) $graph_opts
graph export "Results\graphs\ARIMA\Ind Food Export Over Time.png", replace
putexcel (A4) = image(Results\graphs\ARIMA\Ind Food Export Over Time)

putexcel A2 = "This Section Presents dickey fuller test for industry food export data", font(bold)

putexcel set "Results\ARIMA", modify sheet("dfuller export ind food")
ac food_trade ,ytitle(همبستگی برای داده های صادرات صنعت غذا) title(نمودار همبستگی برای داده های صادرات صنعت غذا, position(1)) xtitle(لگ) note(بازه اطمینان 95 درصد)
graph export "Results\graphs\ARIMA\ AC graph for Ind Food Export Data.png", replace
putexcel A36 = image(Results\graphs\ARIMA\ AC graph for Ind Food Export Data)
putexcel A34 = "AC Graph For Ind Food Export Data", font(bold)



putexcel set "Results\ARIMA", modify sheet("dfuller export ind food")
pac food_trade ,ytitle(همبستگی جزیی برای داده های صادرات صنعت غذا) title(نمودار همبستگی جزیی برای داده های صادرات صنعت غذا, position(1)) xtitle(لگ) note(بازه اطمینان 95 درصد)
graph export "Results\graphs\ARIMA\ PAC graph for Ind Food Export Data.png", replace
putexcel M36 = image(Results\graphs\ARIMA\ PAC graph for Ind Food Export Data)
putexcel M34 = "PAC Graph For Ind Food Export Data", font(bold)


putexcel A68 = "Here I Present the Dickey fuller test results for Export Industry Food Data", font(bold)
putexcel B69 = "Test Statistics"
putexcel C69 = "1% criteria"
putexcel D69= "5% criteria"
putexcel E69 = "10% criteria"
putexcel F69= "MacKinnon approximate p-value"
putexcel G69= "number of observations"
putexcel H69= "lags"

putexcel A70 = "Dfuller with Trend"
dfuller food_trade,trend regress 
putexcel B70 = matrix(r(Zt))
putexcel C70 = matrix(r(cv_1))
putexcel D70 = matrix(r(cv_5))
putexcel E70 = matrix(r(cv_10))
putexcel F70 = matrix(r(p))
putexcel G70 = matrix(r(N))
putexcel H70 = matrix(r(lags))

putexcel A71 = "Dfuller without constant"
dfuller food_trade,noconstant regress 
putexcel B71 = matrix(r(Zt))
putexcel C71 = matrix(r(cv_1))
putexcel D71 = matrix(r(cv_5))
putexcel E71 = matrix(r(cv_10))
putexcel F71 = matrix(r(p))
putexcel G71 = matrix(r(N))
putexcel H71 = matrix(r(lags))

putexcel A72 = "Dfuller with drift"
dfuller food_trade,drift regress lags(3)
putexcel B72 = matrix(r(Zt))
putexcel C72 = matrix(r(cv_1))
putexcel D72 = matrix(r(cv_5))
putexcel E72 = matrix(r(cv_10))
putexcel F72 = matrix(r(p))
putexcel G72 = matrix(r(N))
putexcel H72 = matrix(r(lags))

putexcel A73 = "Dfuller with lags and trend"
dfuller food_trade,trend regress lags(3)
putexcel B73 = matrix(r(Zt))
putexcel C73 = matrix(r(cv_1))
putexcel D73 = matrix(r(cv_5))
putexcel E73 = matrix(r(cv_10))
putexcel F73 = matrix(r(p))
putexcel G73 = matrix(r(N))
putexcel H73 = matrix(r(lags))

putexcel A74 = "Dfuller with drift and lags"
dfuller food_trade,drift regress lags(3)
putexcel B74 = matrix(r(Zt))
putexcel C74 = matrix(r(cv_1))
putexcel D74 = matrix(r(cv_5))
putexcel E74 = matrix(r(cv_10))
putexcel F74= matrix(r(p))
putexcel G74= matrix(r(N))
putexcel H74 = matrix(r(lags))

putexcel A75 = "Here I Present the dickey fuller result for one difference", font(bold)


putexcel A76 = "Here I Present the Dickey fuller test results"
putexcel B76 = "Test Statistics"
putexcel C76 = "1% criteria"
putexcel D76 = "5% criteria"
putexcel E76 = "10% criteria"
putexcel F76 = "MacKinnon approximate p-value"
putexcel G76 = "number of observations"
putexcel H76 = "lags"


putexcel A77 = "Dfuller with trend for one difference of export"
dfuller d.food_trade, trend regress
putexcel B77 = matrix(r(Zt))
putexcel C77 = matrix(r(cv_1))
putexcel D77 = matrix(r(cv_5))
putexcel E77 = matrix(r(cv_10))
putexcel F77 = matrix(r(p))
putexcel G77 = matrix(r(N))
putexcel H77 = matrix(r(lags))

putexcel A78 = "Dfuller without constant for one difference of export"
dfuller d.food_trade, noconstant regress
putexcel B78 = matrix(r(Zt))
putexcel C78 = matrix(r(cv_1))
putexcel D78 = matrix(r(cv_5))
putexcel E78 = matrix(r(cv_10))
putexcel F78= matrix(r(p))
putexcel G78 = matrix(r(N))
putexcel H78 = matrix(r(lags))

putexcel A79 = "Dfuller with drift for one difference of export"
dfuller d.food_trade, drift regress
putexcel B79 = matrix(r(Zt))
putexcel C79 = matrix(r(cv_1))
putexcel D79 = matrix(r(cv_5))
putexcel E79 = matrix(r(cv_10))
putexcel F79= matrix(r(p))
putexcel G79 = matrix(r(N))
putexcel H79 = matrix(r(lags))


putexcel A80 = "Dfuller with lag for one difference of export"
dfuller d.food_trade, trend lags(3) regress
putexcel B80 = matrix(r(Zt))
putexcel C80 = matrix(r(cv_1))
putexcel D80 = matrix(r(cv_5))
putexcel E80 = matrix(r(cv_10))
putexcel F80= matrix(r(p))
putexcel G80 = matrix(r(N))
putexcel H80 = matrix(r(lags))


putexcel A84 = "This Section Presents ACF & PACF for one difference of export data", font(bold)

putexcel set "Results\ARIMA", modify sheet("dfuller export ind food")
ac d.food_trade ,ytitle(همبستگی برای داده های صادرات صنعت غذا) title(نمودار همبستگی برای داده های صادرات صنعت غذا, position(1)) xtitle(لگ) note(بازه اطمینان 95 درصد)
graph export "Results\graphs\ARIMA\ AC graph for One difference Ind Food Export Data.png", replace
putexcel A88 = image(Results\graphs\ARIMA\ AC graph for One difference Ind Food Export Data)
putexcel A86 = "AC Graph For One difference Ind Food Export Data", font(bold)



putexcel set "Results\ARIMA", modify sheet("dfuller export ind food")
pac d.food_trade ,ytitle(همبستگی جزیی برای داده های صادرات صنعت غذا) title(نمودار همبستگی جزیی برای داده های صادرات صنعت غذا, position(1)) xtitle(لگ) note(بازه اطمینان 95 درصد)
graph export "Results\graphs\ARIMA\ PAC graph for One difference Ind Food Export Data.png", replace
putexcel M88 = image(Results\graphs\ARIMA\ PAC graph for One difference Ind Food Export Data)
putexcel M86 = "PAC Graph For One difference Ind Food Export Data", font(bold)




*** ARIMA Models


putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")
putexcel A2 = "This Sheet Presents Different Criterias to choose a Good model for prediction for Export Industry Food Data", font(bold)
putexcel A3 = "These criterias include AIC, BIC, Log Liklelihood, Sigma", font(bold)
putexcel A4 = "The Numbers are transformed into billion"

putexcel A5 = "ARIMA model without exogenous Variables", font(bold)
putexcel B7 = "Sigma"
putexcel C7 = "Number of Observations"
putexcel D7 = "ll (null)"
putexcel E7 = "log likelihood (model)"
putexcel F7 = "df"
putexcel G7 = "AIC"
putexcel H7 = "BIC"

// Error Putexcel 
putexcel I7 = "Mean of residuals"
putexcel J7 = "Min of residuals(billion)"
putexcel K7 = "Max of residuals(billion)"
putexcel L7 = "Portmanteau test for white noise"
putexcel M7 = "eigenvalue of ma1"
putexcel N7 = "eigenvalue of ma2"
putexcel O7 = "eigenvalue of ma3"
putexcel P7 = "eigenvalue of ma4"
putexcel Q7 = "eigenvalue of ma5"
putexcel R7 = "eigenvalue of ma6"
putexcel S7 = "eigenvalue of ma7"
putexcel T7 = "eigenvalue of ma8"
putexcel U7 = "eigenvalue of ar1"
putexcel V7 = "eigenvalue of ar2"
putexcel W7 = "eigenvalue of ar3"
putexcel X7 = "eigenvalue of ar4"
putexcel Y7 = "eigenvalue of ar5"


*Without Exogenous Variables

local m=8
* AR = 0

putexcel A6 = "Ar = 0"

forvalues q = 1/10 {
	arima food_trade , arima(0,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))	
	
	drop error
local m = `m' + 1
}

* AR = 1
putexcel A19 = "AR = 1"
local m=20
forvalues q = 0/6{
	arima food_trade , arima(1,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	estat aroots
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}


* AR = 2
putexcel A28 = "AR = 2"
local m=29
forvalues q = 0/6 {
	arima food_trade , arima(2,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}


* AR = 3
putexcel A37 = "AR = 3"
local m=38
forvalues q = 0/5 {
	arima food_trade , arima(3,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



* AR = 4
putexcel A45 = "AR = 4"
local m=46
forvalues q = 0/4 {
	arima food_trade , arima(4,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}


* AR = 5
putexcel A52 = "AR = 5"
local m=53
forvalues q = 0/0 {
	arima food_trade , arima(5,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



** Models with exogenous Variables


putexcel A56 = "Models With Exogenous Variables"
putexcel A57 = "Models with some Macro Variables"

local m=60
putexcel A59 = "AR = 0"
* AR = 0
forvalues q = 1/7 {
	arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P, arima(0,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))	
	drop error
local m = `m' + 1
}

putexcel A68 = "AR = 1"
* AR = 1
local m=69

forvalues q = 0/1 {
	arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P, arima(1,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}


putexcel A71 = "AR = 2"
* AR = 2
local m=72
forvalues q = 0/2 {
	arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P, arima(2,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



putexcel A76 = "AR = 3"
* AR = 3
local m=77
forvalues q = 0/2 {
	arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P, arima(3,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



putexcel A81 = "AR = 4"
* AR = 4
local m=82
forvalues q = 0/3 {
	arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P, arima(4,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}


putexcel A87 = "AR = 5"
* AR = 5
local m=88
forvalues q = 0/4 {
	arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P, arima(5,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



** With First lag of Variables

putexcel A94 = "Models with One lag of Variables", font(bold)

putexcel A95 = "AR = 0"
local m=96
* AR = 0
forvalues q = 1/6 {
	arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P, arima(0,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))	
	drop error
local m = `m' + 1
}

putexcel A104 = "AR = 1"
* AR = 1
local m=105

forvalues q = 0/6 {
	arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P, arima(1,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



putexcel A112 = "AR = 2"
* AR = 2
local m=113
forvalues q = 0/5 {
	arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P, arima(2,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}


putexcel A120 = "AR = 3"
* AR = 3
local m=121
forvalues q = 0/0 {
	arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P, arima(3,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}


putexcel A123 = "AR = 4"
* AR = 4
local m=124
forvalues q = 0/3 {
	arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P, arima(4,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



putexcel A128 = "AR = 5"
* AR = 5
local m=129
forvalues q = 0/2 {
	arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P, arima(5,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}


** Models with second lag of Variables

putexcel A132 = "Models with Second lag of Variables", font(bold)

putexcel A133 = "AR = 0"
local m=134
* AR = 0
forvalues q = 1/6 {
	arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P, arima(0,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))	
	drop error
local m = `m' + 1
}


putexcel A141 = "AR = 1"
* AR = 1
local m=142

forvalues q = 0/3 {
	arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P, arima(1,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



putexcel A147 = "AR = 2"
* AR = 2
local m=148
forvalues q = 0/4 {
	arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P, arima(2,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}




putexcel A153 = "AR = 3"
* AR = 3
local m=154
forvalues q = 0/1 {
	arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P, arima(3,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}





putexcel A158 = "AR = 4"
* AR = 4
local m=159
forvalues q = 0/3 {
	arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P, arima(4,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}


putexcel A166 = "AR = 5"
* AR = 5
local m=167
forvalues q = 0/1 {
	arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P, arima(5,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



**** RMSE RRMSE & MAPE
putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")

putexcel AA7 = "RMSE_train"
putexcel AB7 = "RRMSE_train"
putexcel AC7 = "MAPE_train"
putexcel AD7 = "RMSE_test"
putexcel AE7 = "RRMSE_test"
putexcel AF7 = "MAPE_test"

local m=8
* AR = 0

putexcel A6 = "Ar = 0"

forvalues q = 1/8 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "export"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade if year < 1400 , arima(0, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Export"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}


local m=20
* AR = 1

putexcel A6 = "Ar = 1"

forvalues q = 0/6 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "export"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade if year < 1400 , arima(1, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Export"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}



local m=29
* AR = 2

putexcel A6 = "Ar = 2"

forvalues q = 0/0 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "export"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade if year < 1400 , arima(2, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Export"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}



local m=38
* AR = 3

putexcel A6 = "Ar = 3"

forvalues q = 0/0 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "export"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade if year < 1400 , arima(3, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Export"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}



local m=46
* AR = 4

putexcel A6 = "Ar = 4"

forvalues q = 0/0 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "export"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade if year < 1400 , arima(4, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Export"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}




local m=53
* AR = 5

putexcel A6 = "Ar = 5"

forvalues q = 0/0 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "export"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade if year < 1400 , arima(5, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Export"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}




local m=60
* AR = 0

putexcel A6 = "Ar = 0"

forvalues q = 1/5 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "export"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P if year < 1400 , arima(0, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Export"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}



local m=69
* AR = 1

putexcel A6 = "Ar = 1"

forvalues q = 0/0 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "export"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P if year < 1400 , arima(1, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Export"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}




local m=72
* AR = 2

putexcel A6 = "Ar = 2"

forvalues q = 0/2 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "export"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P if year < 1400 , arima(2, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Export"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}




local m=77
* AR = 3

putexcel A6 = "Ar = 3"

forvalues q = 0/1 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "export"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P if year < 1400 , arima(3, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Export"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}



local m=82
* AR = 4

putexcel A6 = "Ar = 4"

forvalues q = 0/1 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "export"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P if year < 1400 , arima(4, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Export"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}


local m=88
* AR = 5

putexcel A6 = "Ar = 5"

forvalues q = 0/0 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "export"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P if year < 1400 , arima(5, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Export"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}


local m=96
* AR = 0

putexcel A6 = "Ar = 0"

forvalues q = 1/5 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "export"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P if year < 1400 , arima(0, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Export"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}


local m=105
* AR = 1

putexcel A6 = "Ar = 1"

forvalues q = 0/0 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "export"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P if year < 1400 , arima(1, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Export"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}




local m=113
* AR = 2

putexcel A6 = "Ar = 2"

forvalues q = 0/3 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "export"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P if year < 1400 , arima(2, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Export"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}




local m=121
* AR = 3

putexcel A6 = "Ar = 3"

forvalues q = 0/0 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "export"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P if year < 1400 , arima(3, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Export"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}



local m=124
* AR = 4

putexcel A6 = "Ar = 4"

forvalues q = 0/1 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "export"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P if year < 1400 , arima(4, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Export"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}



local m=129
* AR = 5

putexcel A6 = "Ar = 5"

forvalues q = 0/1 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "export"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P if year < 1400 , arima(5, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Export"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}




local m=134
* AR = 0

putexcel A6 = "Ar = 0"

forvalues q = 1/4 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "export"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P if year < 1400 , arima(0, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Export"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}



local m=142
* AR = 1

putexcel A6 = "Ar = 1"

forvalues q = 0/3 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "export"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P if year < 1400 , arima(1, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Export"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}




local m=148
* AR = 2

putexcel A6 = "Ar = 2"

forvalues q = 0/2 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "export"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P if year < 1400 , arima(2, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Export"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}




local m=154
* AR = 3

putexcel A6 = "Ar = 3"

forvalues q = 0/0 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "export"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P if year < 1400 , arima(3, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Export"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}



local m=159
* AR = 4

putexcel A6 = "Ar = 4"

forvalues q = 0/0 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "export"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P if year < 1400 , arima(4, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Export"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}






***** Predictions

*** Train and Test Split
putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")
putexcel A170 = "This Part Presents Predictions based on Selected Models", font(bold)
putexcel A171 = "This Part Splits Data into Train and test and Presents RMSE, RRMSE and MAPE"
putexcel A172= "Last Three years are considered Test"



** Model lag0 ma1 ar0

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "export"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PKahesh", nogen

tsset year

arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P if year < 1400 , arima(0, 1, 1)
global cmdline = e(cmdline)
putexcel A175 = "$cmdline"

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Export"

gen error_percent = ((fdollar - food_trade) / food_trade) * 100

putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")
twoway (line food_trade year) (line fdollar year) (line error_percent year, yaxis(2)) , legend(on label(1 "داده واقعی صادرات صنعت غذایی") label(2 "داده پیش بینی شده") label(3 "اختلاف درصدی داده واقعی و پیش بینی محور دوم"))  xlabel(, grid)  ytitle(صادرات صنعت غذایی, axis(1)) ytitle(اختلاف درصدی داده واقعی و پیش بینی, axis(2)) title(نمودار پیش بینی دو گروه تمرین و تست) $graph_opts 
graph export "Results\graphs\ARIMA\ Train Test Diff1 Lag2 Ma3 Food Industry Export.png", replace
putexcel B179 = image(Results\graphs\ARIMA\ Train Test Diff1 Lag2 Ma3 Food Industry Export)
putexcel B177 = " Train Test Diff1 Lag0 ma1 Food Industry Export", font(bold)


** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")

putexcel C212 = "RMSE_train"
putexcel D212 = "RRMSE_train"
putexcel E212 = "MAPE_train"
putexcel F212 = "RMSE_test"
putexcel G212 = "RRMSE_test"
putexcel H212 = "MAPE_test"

putexcel C213 = RMSE_train
putexcel D213 = RRMSE_train
putexcel E213 = MAPE_train
putexcel F213 = RMSE_test
putexcel G213 = RRMSE_test
putexcel H213 = MAPE_test



** Model lag0 ma0 ar1

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear
putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")

keep if Exp_Imp == "export"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PKahesh", nogen

tsset year

arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P if year < 1400 , arima(1, 1, 0)
global cmdline = e(cmdline)
putexcel Q175 = "$cmdline"

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Export"

gen error_percent = ((fdollar - food_trade) / food_trade) * 100

putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")
twoway (line food_trade year) (line fdollar year) (line error_percent year, yaxis(2)) , legend(on label(1 "داده واقعی صادرات صنعت غذایی") label(2 "داده پیش بینی شده") label(3 "اختلاف درصدی داده واقعی و پیش بینی محور دوم"))  xlabel(, grid)  ytitle(صادرات صنعت غذایی, axis(1)) ytitle(اختلاف درصدی داده واقعی و پیش بینی, axis(2)) title(نمودار پیش بینی دو گروه تمرین و تست) $graph_opts 
graph export "Results\graphs\ARIMA\ Train Test Diff1 Lag0 Ma0 ar1 Food Industry Export.png", replace
putexcel Q179 = image(Results\graphs\ARIMA\ Train Test Diff1 Lag0 Ma0 ar1 Food Industry Export)
putexcel Q177 = " Train Test Diff1 Lag0 ma0 ar1 Food Industry Export", font(bold)


** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")

putexcel T212 = "RMSE_train"
putexcel U212 = "RRMSE_train"
putexcel V212 = "MAPE_train"
putexcel W212 = "RMSE_test"
putexcel X212 = "RRMSE_test"
putexcel Y212 = "MAPE_test"

putexcel T213 = RMSE_train
putexcel U213 = RRMSE_train
putexcel V213 = MAPE_train
putexcel W213 = RMSE_test
putexcel X213 = RRMSE_test
putexcel Y213 = MAPE_test






** I Choose the lag0 ar0 ma1 Model


*** Now Predicting on the entire data

putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")
putexcel A220 = "Here I Present The Predictions based on Selected Model for three years after", font(bold)

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "export"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

rename azad_growth_P2P Sobat_azad_growth_P2P
rename liquidity_growth_P2P Sobat_liquidity_growth_P2P
rename real_gdp_growth_P2P Sobat_real_gdp_growth_P2P
rename budget_P2P Sobat_budget_P2P
rename inflation_P2P Sobat_inflation_P2P
rename yearly_sii Sobat_yearly_sii

merge 1:1 year using  "Gomrok Data\DTA Data\P2PAfzayesh", nogen
rename azad_growth_P2P Afzayesh_azad_growth_P2P
rename liquidity_growth_P2P Afzayesh_liquidity_growth_P2P
rename real_gdp_growth_P2P Afzayesh_real_gdp_growth_P2P
rename budget_P2P Afzayesh_budget_P2P
rename inflation_P2P Afzayesh_inflation_P2P
rename yearly_sii Afzayesh_yearly_sii

merge 1:1 year using  "Gomrok Data\DTA Data\P2PKahesh", nogen
rename azad_growth_P2P Kahesh_azad_growth_P2P
rename liquidity_growth_P2P Kahesh_liquidity_growth_P2P
rename real_gdp_growth_P2P Kahesh_real_gdp_growth_P2P
rename budget_P2P Kahesh_budget_P2P
rename inflation_P2P Kahesh_inflation_P2P
rename yearly_sii Kahesh_yearly_sii

tsset year

arima food_trade Sobat_azad_growth_P2P Sobat_yearly_sii Sobat_real_gdp_growth_P2P Sobat_inflation_P2P , arima(0, 1, 1)
global cmdline = e(cmdline)
putexcel A222 = "$cmdline"

* Check for White noise, Normality of residuals

predict error_Sobat, resid

putexcel A224 = "Pvalue of normality tests"
putexcel B225 = "Shapiro–Wilk test for normality"
putexcel C225 = "Skewness test for normality"
putexcel D225 = "kurtosis test for normality"

swilk error_Sobat
putexcel B226 = matrix(r(p))


sktest error_Sobat
putexcel C226 = matrix(r(p_skew))
putexcel D226 = matrix(r(p_kurt))

putexcel A229 = "The test to chenk residuals being white noise"
putexcel B230 = "Q statistics"
putexcel C230 = "P Value"

wntestq error_Sobat
putexcel B231 = matrix(r(stat))
putexcel C231 = matrix(r(p))

histogram error_Sobat, normal ytitle(چگالی) xtitle(باقیمانده کل داده های صادرات) title(نرمال بودن جز خطا برای مدل با متغیر بدون لگ و میانگین متحرک 1 و اتورگرسیو 0, size(small))  $graph_opts 
graph export "Results\graphs\ARIMA\ Histogram Normality residuals Diff1 Lag0 Ma1 ar0 Food Industry Export.png", replace
putexcel B235 = image(Results\graphs\ARIMA\ Histogram Normality residuals Diff1 Lag0 Ma1 ar0 Food Industry Export) 
putexcel B233 = " Histogram Normality residuals Diff1 Lag0 Ma1 ar0 Food Industry Export", font(bold)

qnorm error_Sobat, ytitle(باقیمانده کل داده های صادرات) xtitle(معکوس نرمال) title(نمودار ناپارامتریک مقایسه با توزیع نرمال برای مدل با متغیر بدون لگ و میانگین متحرک 1 و اتورگرسیو 0, size(small)) $graph_opts
graph export "Results\graphs\ARIMA\ QQNorm Normality residuals Diff1 Lag0 Ma1 ar0 Food Industry Export.png", replace
putexcel O234 = image(Results\graphs\ARIMA\ QQNorm Normality residuals Diff1 Lag0 Ma1 ar0 Food Industry Export)
putexcel O233 = " QQNorm Normality residuals Diff1 Lag0 Ma1 ar0 Food Industry Export", font(bold)


*** Finally the prediction graph
putexcel A269 = "Here I Present The pridection Trends for three scenarios"
putexcel A270 = "In this case because we are using second lag of variables there is little difference between scenarios"

arima food_trade Sobat_azad_growth_P2P Sobat_yearly_sii Sobat_real_gdp_growth_P2P Sobat_inflation_P2P , arima(0, 1, 1)
tsappend , add(3)
predict fdollar_Sobat if tin(1380, 1405), y dynamic(y(1403))
label var fdollar_Sobat "forcasted Dollar Export Sobat"

arima food_trade Kahesh_azad_growth_P2P Kahesh_yearly_sii Kahesh_real_gdp_growth_P2P Kahesh_inflation_P2P , arima(0, 1, 1)
tsappend , add(3)
predict fdollar_Kahesh if tin(1380, 1405), y dynamic(y(1403))
label var fdollar_Kahesh "forcasted Dollar Export Kahesh"


arima food_trade Afzayesh_azad_growth_P2P Afzayesh_yearly_sii Afzayesh_real_gdp_growth_P2P Afzayesh_inflation_P2P , arima(0, 1, 1)
tsappend , add(3)
predict fdollar_Afzayesh if tin(1380, 1405), y dynamic(y(1403))
label var fdollar_Afzayesh "forcasted Dollar Export Afzayesh"

replace fdollar_Sobat = food_trade if year == 1402
replace fdollar_Kahesh = food_trade if year == 1402
replace fdollar_Afzayesh = food_trade if year == 1402


putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")
twoway (line food_trade year,${lp0} lw(thin)) (line fdollar_Sobat year if year >=1402 ,${lp1} lw(thin)) (line fdollar_Kahesh year if year >=1402,${lp2} lw(thin))  (line fdollar_Afzayesh year if year >=1402 ,${lp3} lw(thin))  , legend(on label(1 "داده واقعی صادرات صنعت غذایی") label(2 "داده پیش بینی شده با فرض ثبات")  label(3 "داده پیش بینی شده با فرض کاهش تحریم")   label(4 "داده پیش بینی شده با فرض افزایش تحریم") size(small))  xlabel(, grid)  ytitle(صادرات صنعت غذایی, axis(1)) title(نمودار پیش بینی برای سه سناریو) $graph_opts 
graph export "Results\graphs\ARIMA\ Prediction Diff1 Lag0 Ma1 Food Industry Export.png", replace
putexcel B275 = image(Results\graphs\ARIMA\ Prediction Diff1 Lag0 Ma1 Food Industry Export)
putexcel B274 = " Prediction Diff1 Lag0 Ma1 Food Industry Export", font(bold)




** I Choose the lag0 ar1 ma0 Model


*** Now Predicting on the entire data

putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")
putexcel A310 = "Here I Present The Predictions based on Selected Model for three years after", font(bold)

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "export"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

rename azad_growth_P2P Sobat_azad_growth_P2P
rename liquidity_growth_P2P Sobat_liquidity_growth_P2P
rename real_gdp_growth_P2P Sobat_real_gdp_growth_P2P
rename budget_P2P Sobat_budget_P2P
rename inflation_P2P Sobat_inflation_P2P
rename yearly_sii Sobat_yearly_sii

merge 1:1 year using  "Gomrok Data\DTA Data\P2PAfzayesh", nogen
rename azad_growth_P2P Afzayesh_azad_growth_P2P
rename liquidity_growth_P2P Afzayesh_liquidity_growth_P2P
rename real_gdp_growth_P2P Afzayesh_real_gdp_growth_P2P
rename budget_P2P Afzayesh_budget_P2P
rename inflation_P2P Afzayesh_inflation_P2P
rename yearly_sii Afzayesh_yearly_sii

merge 1:1 year using  "Gomrok Data\DTA Data\P2PKahesh", nogen
rename azad_growth_P2P Kahesh_azad_growth_P2P
rename liquidity_growth_P2P Kahesh_liquidity_growth_P2P
rename real_gdp_growth_P2P Kahesh_real_gdp_growth_P2P
rename budget_P2P Kahesh_budget_P2P
rename inflation_P2P Kahesh_inflation_P2P
rename yearly_sii Kahesh_yearly_sii

tsset year

arima food_trade Sobat_azad_growth_P2P Sobat_yearly_sii Sobat_real_gdp_growth_P2P Sobat_inflation_P2P , arima(1, 1, 0)
global cmdline = e(cmdline)
putexcel A312 = "$cmdline"

* Check for White noise, Normality of residuals

predict error_Sobat, resid

putexcel A314 = "Pvalue of normality tests"
putexcel B315 = "Shapiro–Wilk test for normality"
putexcel C315 = "Skewness test for normality"
putexcel D315 = "kurtosis test for normality"

swilk error_Sobat
putexcel B316 = matrix(r(p))


sktest error_Sobat
putexcel C316 = matrix(r(p_skew))
putexcel D316 = matrix(r(p_kurt))

putexcel A319 = "The test to chenk residuals being white noise"
putexcel B320 = "Q statistics"
putexcel C320 = "P Value"

wntestq error_Sobat
putexcel B321 = matrix(r(stat))
putexcel C321 = matrix(r(p))

histogram error_Sobat, normal ytitle(چگالی) xtitle(باقیمانده کل داده های صادرات) title(نرمال بودن جز خطا برای مدل با متغیر بدون لگ و میانگین متحرک 0 و اتورگرسیو 1, size(small))  $graph_opts 
graph export "Results\graphs\ARIMA\ Histogram Normality residuals Diff1 Lag0 Ma0 ar1 Food Industry Export.png", replace
putexcel B324 = image(Results\graphs\ARIMA\ Histogram Normality residuals Diff1 Lag0 Ma0 ar1 Food Industry Export) 
putexcel B323 = " Histogram Normality residuals Diff1 Lag0 Ma0 ar1 Food Industry Export", font(bold)

qnorm error_Sobat, ytitle(باقیمانده کل داده های صادرات) xtitle(معکوس نرمال) title(نمودار ناپارامترک مقایسه با توزیع نرمال مدل با متغیر بدون لگ و میانگین متحرک 0 و اتورگرسیو 1, size(small)) $graph_opts
graph export "Results\graphs\ARIMA\ QQNorm Normality residuals Diff1 Lag0 Ma0 ar1 Food Industry Export.png", replace
putexcel O324 = image(Results\graphs\ARIMA\ QQNorm Normality residuals Diff1 Lag0 Ma0 ar1 Food Industry Export)
putexcel O323 = " QQNorm Normality residuals Diff1 Lag0 Ma0 ar1 Food Industry Export", font(bold)


*** Finally the prediction graph
putexcel A360 = "Here I Present The pridection Trends for three scenarios"

arima food_trade Sobat_azad_growth_P2P Sobat_yearly_sii Sobat_real_gdp_growth_P2P Sobat_inflation_P2P , arima(1, 1, 0)
tsappend , add(3)
predict fdollar_Sobat if tin(1380, 1405), y dynamic(y(1403))
label var fdollar_Sobat "forcasted Dollar Export Sobat"

arima food_trade Kahesh_azad_growth_P2P Kahesh_yearly_sii Kahesh_real_gdp_growth_P2P Kahesh_inflation_P2P , arima(1, 1, 0)
tsappend , add(3)
predict fdollar_Kahesh if tin(1380, 1405), y dynamic(y(1403))
label var fdollar_Kahesh "forcasted Dollar Export Kahesh"


arima food_trade Afzayesh_azad_growth_P2P Afzayesh_yearly_sii Afzayesh_real_gdp_growth_P2P Afzayesh_inflation_P2P , arima(1, 1, 0)
tsappend , add(3)
predict fdollar_Afzayesh if tin(1380, 1405), y dynamic(y(1403))
label var fdollar_Afzayesh "forcasted Dollar Export Afzayesh"

replace fdollar_Sobat = food_trade if year == 1402
replace fdollar_Kahesh = food_trade if year == 1402
replace fdollar_Afzayesh = food_trade if year == 1402


putexcel set "Results\ARIMA", modify sheet("Choosing Model Export IndFood")
twoway (line food_trade year,${lp0} lw(thin)) (line fdollar_Sobat year if year >=1402 ,${lp1} lw(thin)) (line fdollar_Kahesh year if year >=1402,${lp2} lw(thin))  (line fdollar_Afzayesh year if year >=1402 ,${lp3} lw(thin))  , legend(on label(1 "داده واقعی صادرات صنعت غذایی") label(2 "داده پیش بینی شده با فرض ثبات")  label(3 "داده پیش بینی شده با فرض کاهش تحریم")   label(4 "داده پیش بینی شده با فرض افزایش تحریم") size(small))  xlabel(, grid)  ytitle(صادرات صنعت غذایی, axis(1)) title(نمودار پیش بینی برای سه سناریو) $graph_opts 
graph export "Results\graphs\ARIMA\ Prediction Diff1 Lag0 Ma0 ar1 Food Industry Export.png", replace
putexcel B362 = image(Results\graphs\ARIMA\ Prediction Diff1 Lag0 Ma0 ar1 Food Industry Export)
putexcel B363 = " Prediction Diff1 Lag0 Ma0 ar1 Food Industry Export", font(bold)









**# Food Industry Import

*** Food Industry Import Data Predictions

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year

putexcel set "Results\ARIMA", modify sheet("dfuller import ind food", replace)
twoway (line food_trade year ,${lp0}) ,xtitle(سال) ytitle(ارزش دلاری(میلیارد دلار)) title(واردات صنعت خوراکی, position(1)) xlabel(1370(5)1400, labsize(small))  ylabel(, labsize(small)) name(totexp, replace)  xscale(titlegap(2)) yscale(titlegap(2)) $graph_opts
graph export "Results\graphs\ARIMA\Ind Food Import Over Time.png", replace
putexcel (A4) = image(Results\graphs\ARIMA\Ind Food Import Over Time)

putexcel A2 = "This Section Presents dickey fuller test for industry food import data", font(bold)

putexcel set "Results\ARIMA", modify sheet("dfuller import ind food")
ac food_trade ,ytitle(همبستگی برای داده های واردات صنعت غذا) title(نمودار همبستگی برای داده های واردات صنعت غذا, position(1)) xtitle(لگ) note(بازه اطمینان 95 درصد)
graph export "Results\graphs\ARIMA\ AC graph for Ind Food Import Data.png", replace
putexcel A36 = image(Results\graphs\ARIMA\ AC graph for Ind Food Import Data)
putexcel A34 = "AC Graph For Ind Food Import Data", font(bold)


putexcel set "Results\ARIMA", modify sheet("dfuller import ind food")
pac food_trade ,ytitle(همبستگی جزیی برای داده های صادرات صنعت غذا) title(نمودار همبستگی جزیی برای داده های صادرات صنعت غذا, position(1)) xtitle(لگ) note(بازه اطمینان 95 درصد)
graph export "Results\graphs\ARIMA\ PAC graph for Ind Food Import Data.png", replace
putexcel M36 = image(Results\graphs\ARIMA\ PAC graph for Ind Food Import Data)
putexcel M34 = "PAC Graph For Ind Food Import Data", font(bold)


putexcel A68 = "Here I Present the Dickey fuller test results for Import Industry Food Data", font(bold)
putexcel B69 = "Test Statistics"
putexcel C69 = "1% criteria"
putexcel D69= "5% criteria"
putexcel E69 = "10% criteria"
putexcel F69= "MacKinnon approximate p-value"
putexcel G69= "number of observations"
putexcel H69= "lags"

putexcel A70 = "Dfuller with Trend"
dfuller food_trade,trend regress 
putexcel B70 = matrix(r(Zt))
putexcel C70 = matrix(r(cv_1))
putexcel D70 = matrix(r(cv_5))
putexcel E70 = matrix(r(cv_10))
putexcel F70 = matrix(r(p))
putexcel G70 = matrix(r(N))
putexcel H70 = matrix(r(lags))

putexcel A71 = "Dfuller without constant"
dfuller food_trade,noconstant regress 
putexcel B71 = matrix(r(Zt))
putexcel C71 = matrix(r(cv_1))
putexcel D71 = matrix(r(cv_5))
putexcel E71 = matrix(r(cv_10))
putexcel F71 = matrix(r(p))
putexcel G71 = matrix(r(N))
putexcel H71 = matrix(r(lags))

putexcel A72 = "Dfuller with drift"
dfuller food_trade,drift regress lags(3)
putexcel B72 = matrix(r(Zt))
putexcel C72 = matrix(r(cv_1))
putexcel D72 = matrix(r(cv_5))
putexcel E72 = matrix(r(cv_10))
putexcel F72 = matrix(r(p))
putexcel G72 = matrix(r(N))
putexcel H72 = matrix(r(lags))

putexcel A73 = "Dfuller with lags and trend"
dfuller food_trade,trend regress lags(3)
putexcel B73 = matrix(r(Zt))
putexcel C73 = matrix(r(cv_1))
putexcel D73 = matrix(r(cv_5))
putexcel E73 = matrix(r(cv_10))
putexcel F73 = matrix(r(p))
putexcel G73 = matrix(r(N))
putexcel H73 = matrix(r(lags))

putexcel A74 = "Dfuller with drift and lags"
dfuller food_trade,drift regress lags(3)
putexcel B74 = matrix(r(Zt))
putexcel C74 = matrix(r(cv_1))
putexcel D74 = matrix(r(cv_5))
putexcel E74 = matrix(r(cv_10))
putexcel F74= matrix(r(p))
putexcel G74= matrix(r(N))
putexcel H74 = matrix(r(lags))

putexcel A75 = "Here I Present the dickey fuller result for one difference", font(bold)


putexcel A76 = "Here I Present the Dickey fuller test results"
putexcel B76 = "Test Statistics"
putexcel C76 = "1% criteria"
putexcel D76 = "5% criteria"
putexcel E76 = "10% criteria"
putexcel F76 = "MacKinnon approximate p-value"
putexcel G76 = "number of observations"
putexcel H76 = "lags"


putexcel A77 = "Dfuller with trend for one difference of export"
dfuller d.food_trade, trend regress
putexcel B77 = matrix(r(Zt))
putexcel C77 = matrix(r(cv_1))
putexcel D77 = matrix(r(cv_5))
putexcel E77 = matrix(r(cv_10))
putexcel F77 = matrix(r(p))
putexcel G77 = matrix(r(N))
putexcel H77 = matrix(r(lags))

putexcel A78 = "Dfuller without constant for one difference of export"
dfuller d.food_trade, noconstant regress
putexcel B78 = matrix(r(Zt))
putexcel C78 = matrix(r(cv_1))
putexcel D78 = matrix(r(cv_5))
putexcel E78 = matrix(r(cv_10))
putexcel F78= matrix(r(p))
putexcel G78 = matrix(r(N))
putexcel H78 = matrix(r(lags))

putexcel A79 = "Dfuller with drift for one difference of export"
dfuller d.food_trade, drift regress
putexcel B79 = matrix(r(Zt))
putexcel C79 = matrix(r(cv_1))
putexcel D79 = matrix(r(cv_5))
putexcel E79 = matrix(r(cv_10))
putexcel F79= matrix(r(p))
putexcel G79 = matrix(r(N))
putexcel H79 = matrix(r(lags))


putexcel A80 = "Dfuller with lag for one difference of export"
dfuller d.food_trade, trend lags(3) regress
putexcel B80 = matrix(r(Zt))
putexcel C80 = matrix(r(cv_1))
putexcel D80 = matrix(r(cv_5))
putexcel E80 = matrix(r(cv_10))
putexcel F80= matrix(r(p))
putexcel G80 = matrix(r(N))
putexcel H80 = matrix(r(lags))


putexcel A84 = "This Section Presents ACF & PACF for one difference of import data", font(bold)

putexcel set "Results\ARIMA", modify sheet("dfuller import ind food")
ac d.food_trade ,ytitle(همبستگی برای داده های واردات صنعت غذا) title(نمودار همبستگی برای داده های واردات صنعت غذا, position(1)) xtitle(لگ) note(بازه اطمینان 95 درصد)
graph export "Results\graphs\ARIMA\ AC graph for One difference Ind Food Import Data.png", replace
putexcel A88 = image(Results\graphs\ARIMA\ AC graph for One difference Ind Food Import Data)
putexcel A86 = "AC Graph For One difference Ind Food Immport Data", font(bold)



putexcel set "Results\ARIMA", modify sheet("dfuller import ind food")
pac d.food_trade ,ytitle(همبستگی جزیی برای داده های واردات صنعت غذا) title(نمودار همبستگی جزیی برای داده های واردات صنعت غذا, position(1)) xtitle(لگ) note(بازه اطمینان 95 درصد)
graph export "Results\graphs\ARIMA\ PAC graph for One difference Ind Food Import Data.png", replace
putexcel M88 = image(Results\graphs\ARIMA\ PAC graph for One difference Ind Food Import Data)
putexcel M86 = "PAC Graph For One difference Ind Food Import Data", font(bold)




*** ARIMA Models


putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")
putexcel A2 = "This Sheet Presents Different Criterias to choose a Good model for prediction for Import Industry Food Data", font(bold)
putexcel A3 = "These criterias include AIC, BIC, Log Liklelihood, Sigma", font(bold)
putexcel A4 = "The Numbers are transformed into billion"

putexcel A5 = "ARIMA model without exogenous Variables", font(bold)
putexcel B7 = "Sigma"
putexcel C7 = "Number of Observations"
putexcel D7 = "ll (null)"
putexcel E7 = "log likelihood (model)"
putexcel F7 = "df"
putexcel G7 = "AIC"
putexcel H7 = "BIC"

// Error Putexcel 
putexcel I7 = "Mean of residuals"
putexcel J7 = "Min of residuals(billion)"
putexcel K7 = "Max of residuals(billion)"
putexcel L7 = "Portmanteau test for white noise"
putexcel M7 = "eigenvalue of ma1"
putexcel N7 = "eigenvalue of ma2"
putexcel O7 = "eigenvalue of ma3"
putexcel P7 = "eigenvalue of ma4"
putexcel Q7 = "eigenvalue of ma5"
putexcel R7 = "eigenvalue of ma6"
putexcel S7 = "eigenvalue of ma7"
putexcel T7 = "eigenvalue of ma8"
putexcel U7 = "eigenvalue of ar1"
putexcel V7 = "eigenvalue of ar2"
putexcel W7 = "eigenvalue of ar3"
putexcel X7 = "eigenvalue of ar4"
putexcel Y7 = "eigenvalue of ar5"


*Without Exogenous Variables

local m=8
* AR = 0

putexcel A6 = "Ar = 0"

forvalues q = 1/10 {
	arima food_trade , arima(0,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))	
	
	drop error
local m = `m' + 1
}

* AR = 1
putexcel A19 = "AR = 1"
local m=20
forvalues q = 0/7{
	arima food_trade , arima(1,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	estat aroots
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}


* AR = 2
putexcel A29 = "AR = 2"
local m=30
forvalues q = 0/3{
	arima food_trade , arima(2,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}


* AR = 3
putexcel A35 = "AR = 3"
local m=36
forvalues q = 0/2 {
	arima food_trade , arima(3,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



* AR = 4
putexcel A40 = "AR = 4"
local m=41
forvalues q = 0/1 {
	arima food_trade , arima(4,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}


* AR = 5
putexcel A45 = "AR = 5"
local m=46
forvalues q = 0/0 {
	arima food_trade , arima(5,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



** Models with exogenous Variables


putexcel A48 = "Models With Exogenous Variables", font(bold)
putexcel A49 = "Models with some Macro Variables", font(bold)

local m=51
putexcel A50 = "AR = 0"
* AR = 0
forvalues q = 1/7 {
	arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P, arima(0,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))	
	drop error
local m = `m' + 1
}

putexcel A60 = "AR = 1"
* AR = 1
local m=61

forvalues q = 0/2 {
	arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P, arima(1,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}


putexcel A64 = "AR = 2"
* AR = 2
local m=65
forvalues q = 0/4 {
	arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P, arima(2,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



putexcel A73 = "AR = 3"
* AR = 3
local m=74
forvalues q = 0/3 {
	arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P, arima(3,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



putexcel A79 = "AR = 4"
* AR = 4
local m=80
forvalues q = 0/2 {
	arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P, arima(4,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}


putexcel A84 = "AR = 5"
* AR = 5
local m=85
forvalues q = 0/2 {
	arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P, arima(5,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



** With First lag of Variables

putexcel A89 = "Models with One lag of Variables", font(bold)

putexcel A90 = "AR = 0"
local m=91
* AR = 0
forvalues q = 1/6 {
	arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P, arima(0,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))	
	drop error
local m = `m' + 1
}

putexcel A99 = "AR = 1"
* AR = 1
local m=100

forvalues q = 0/1 {
	arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P, arima(1,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



putexcel A105 = "AR = 2"
* AR = 2
local m=106
forvalues q = 0/0 {
	arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P, arima(2,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}


putexcel A108 = "AR = 3"
* AR = 3
local m=109
forvalues q = 0/3 {
	arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P, arima(3,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}


putexcel A115 = "AR = 4"
* AR = 4
local m=116
forvalues q = 0/1 {
	arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P, arima(4,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



putexcel A119 = "AR = 5"
* AR = 5
local m=120
forvalues q = 0/2 {
	arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P, arima(5,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}


** Models with second lag of Variables

putexcel A125 = "Models with Second lag of Variables", font(bold)

putexcel A126 = "AR = 0"
local m=127
* AR = 0
forvalues q = 1/5 {
	arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P, arima(0,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))	
	drop error
local m = `m' + 1
}


putexcel A135 = "AR = 1"
* AR = 1
local m=136

forvalues q = 0/2 {
	arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P, arima(1,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}



putexcel A142 = "AR = 2"
* AR = 2
local m=143
forvalues q = 0/2 {
	arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P, arima(2,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}




putexcel A148 = "AR = 3"
* AR = 3
local m=149
forvalues q = 0/3 {
	arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P, arima(3,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}


putexcel A156 = "AR = 4"
* AR = 4
local m=157
forvalues q = 0/1 {
	arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P, arima(4,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}


putexcel A160 = "AR = 5"
* AR = 5
local m=161
forvalues q = 0/3 {
	arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P, arima(5,1,`q')
	global cmdline = e(cmdline)

	putexcel A`m' = "$cmdline"
	putexcel B`m' = matrix(e(sigma))

	estat ic
	ereturn list

	putexcel C`m' = matrix(r(S))

	predict error, residuals
	summarize error
	
	putexcel I`m' = matrix(r(mean))
	putexcel J`m' = matrix(r(min))
	putexcel K`m' = matrix(r(max))

	// tsline error , yline(1.42e+07   )

	wntestq error
	putexcel L`m' = matrix(r(p))

	estat aroots
	putexcel M`m' = matrix(r(Modulus_ma))
	putexcel U`m' = matrix(r(Modulus_ar))
	
	drop error
local m = `m' + 1
}





**** RMSE RRMSE & MAPE
putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")

putexcel AA7 = "RMSE_train"
putexcel AB7 = "RRMSE_train"
putexcel AC7 = "MAPE_train"
putexcel AD7 = "RMSE_test"
putexcel AE7 = "RRMSE_test"
putexcel AF7 = "MAPE_test"

local m=8
* AR = 0

putexcel A6 = "Ar = 0"

forvalues q = 1/8 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade if year < 1400 , arima(0, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}


local m=20
* AR = 1

putexcel A6 = "Ar = 1"

forvalues q = 0/3 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade if year < 1400 , arima(1, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}



local m=30
* AR = 2

putexcel A6 = "Ar = 2"

forvalues q = 0/3 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade if year < 1400 , arima(2, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}



local m=36
* AR = 3

putexcel A6 = "Ar = 3"

forvalues q = 0/2 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade if year < 1400 , arima(3, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}



local m=41
* AR = 4

putexcel A6 = "Ar = 4"

forvalues q = 0/1 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade if year < 1400 , arima(4, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}




local m=46
* AR = 5

putexcel A6 = "Ar = 5"

forvalues q = 0/0 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade if year < 1400 , arima(5, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}




local m=51
* AR = 0

putexcel A6 = "Ar = 0"

forvalues q = 1/5 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P if year < 1400 , arima(0, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}



local m=61
* AR = 1

putexcel A6 = "Ar = 1"

forvalues q = 0/2 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P if year < 1400 , arima(1, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}




local m=65
* AR = 2

putexcel A6 = "Ar = 2"

forvalues q = 0/1 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P if year < 1400 , arima(2, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}




local m=74
* AR = 3

putexcel A6 = "Ar = 3"

forvalues q = 0/0 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P if year < 1400 , arima(3, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}



local m=80
* AR = 4

putexcel A6 = "Ar = 4"

forvalues q = 0/0 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P if year < 1400 , arima(4, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}


local m=85
* AR = 5

putexcel A6 = "Ar = 5"

forvalues q = 0/2 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade azad_growth_P2P yearly_sii real_gdp_growth_P2P inflation_P2P if year < 1400 , arima(5, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}


local m=91
* AR = 0

putexcel A6 = "Ar = 0"

forvalues q = 1/5 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P if year < 1400 , arima(0, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}


local m=100
* AR = 1

putexcel A6 = "Ar = 1"

forvalues q = 0/1 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P if year < 1400 , arima(1, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}




local m=106
* AR = 2

putexcel A6 = "Ar = 2"

forvalues q = 0/0 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P if year < 1400 , arima(2, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}




local m=109
* AR = 3

putexcel A6 = "Ar = 3"

forvalues q = 0/1 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P if year < 1400 , arima(3, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}



local m=116
* AR = 4

putexcel A6 = "Ar = 4"

forvalues q = 0/1 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P if year < 1400 , arima(4, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}



local m=120
* AR = 5

putexcel A6 = "Ar = 5"

forvalues q = 0/1 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P if year < 1400 , arima(5, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}




local m=127
* AR = 0

putexcel A6 = "Ar = 0"

forvalues q = 1/4 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P if year < 1400 , arima(0, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}



local m=136
* AR = 1

putexcel A6 = "Ar = 1"

forvalues q = 0/2 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P if year < 1400 , arima(1, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}




local m=143
* AR = 2

putexcel A6 = "Ar = 2"

forvalues q = 0/2 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P if year < 1400 , arima(2, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}




local m=149
* AR = 3

putexcel A6 = "Ar = 3"

forvalues q = 0/1 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P if year < 1400 , arima(3, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}



local m=157
* AR = 4

putexcel A6 = "Ar = 4"

forvalues q = 0/0 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P if year < 1400 , arima(4, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}




local m=161
* AR = 5

putexcel A6 = "Ar = 5"

forvalues q = 0/2 {

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year
arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P if year < 1400 , arima(5, 1, `q')

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")

putexcel AA`m' = RMSE_train
putexcel AB`m' = RRMSE_train
putexcel AC`m' = MAPE_train
putexcel AD`m' = RMSE_test
putexcel AE`m' = RRMSE_test
putexcel AF`m' = MAPE_test

local m = `m' + 1
}







***** Predictions

*** Train and Test Split
putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")
putexcel A170 = "This Part Presents Predictions based on Selected Models", font(bold)
putexcel A171 = "This Part Splits Data into Train and test and Presents RMSE, RRMSE and MAPE"
putexcel A172= "Last Three years are considered Test"



** Model lag1 ma1 ar0

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year

arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P if year < 1400 , arima(0, 1,1)
global cmdline = e(cmdline)
putexcel A175 = "$cmdline"

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

gen error_percent = ((fdollar - food_trade) / food_trade) * 100

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")
twoway (line food_trade year) (line fdollar year) (line error_percent year, yaxis(2)) , legend(on label(1 "داده واقعی واردات صنعت غذایی") label(2 "داده پیش بینی شده") label(3 "اختلاف درصدی داده واقعی و پیش بینی محور دوم"))  xlabel(, grid)  ytitle(واردات صنعت غذایی, axis(1)) ytitle(اختلاف درصدی داده واقعی و پیش بینی, axis(2)) title(نمودار پیش بینی دو گروه تمرین و تست) $graph_opts 
graph export "Results\graphs\ARIMA\ Train Test Diff1 Lag1 Ma1 Food Industry Import.png", replace
putexcel B179 = image(Results\graphs\ARIMA\ Train Test Diff1 Lag1 Ma1 Food Industry Import)
putexcel B177 = " Train Test Diff1 Lag1 ma1 Food Industry Import", font(bold)


** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")

putexcel C212 = "RMSE_train"
putexcel D212 = "RRMSE_train"
putexcel E212 = "MAPE_train"
putexcel F212 = "RMSE_test"
putexcel G212 = "RRMSE_test"
putexcel H212 = "MAPE_test"

putexcel C213 = RMSE_train
putexcel D213 = RRMSE_train
putexcel E213 = MAPE_train
putexcel F213 = RMSE_test
putexcel G213 = RRMSE_test
putexcel H213 = MAPE_test



** Model lag1 ma0 ar1

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year

arima food_trade l.azad_growth_P2P l.yearly_sii l.real_gdp_growth_P2P l.inflation_P2P if year < 1400 , arima(1, 1, 0)
global cmdline = e(cmdline)
putexcel Q175 = "$cmdline"

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

gen error_percent = ((fdollar - food_trade) / food_trade) * 100

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")
twoway (line food_trade year) (line fdollar year) (line error_percent year, yaxis(2)) , legend(on label(1 "داده واقعی واردات صنعت غذایی") label(2 "داده پیش بینی شده") label(3 "اختلاف درصدی داده واقعی و پیش بینی محور دوم"))  xlabel(, grid)  ytitle(واردات صنعت غذایی, axis(1)) ytitle(اختلاف درصدی داده واقعی و پیش بینی, axis(2)) title(نمودار پیش بینی دو گروه تمرین و تست) $graph_opts 
graph export "Results\graphs\ARIMA\ Train Test Diff1 Lag1 Ma0 ar1 Food Industry Import.png", replace
putexcel Q179 = image(Results\graphs\ARIMA\ Train Test Diff1 Lag1 Ma0 ar1 Food Industry Import)
putexcel Q177 = " Train Test Diff1 Lag1 Ma0 ar1 Food Industry Import", font(bold)


** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")

putexcel T212 = "RMSE_train"
putexcel U212 = "RRMSE_train"
putexcel V212 = "MAPE_train"
putexcel W212 = "RMSE_test"
putexcel X212 = "RRMSE_test"
putexcel Y212 = "MAPE_test"

putexcel T213 = RMSE_train
putexcel U213 = RRMSE_train
putexcel V213 = MAPE_train
putexcel W213 = RMSE_test
putexcel X213 = RRMSE_test
putexcel Y213 = MAPE_test




** Model lag2 ma1 ar3

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear
putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

tsset year

arima food_trade l2.azad_growth_P2P l2.yearly_sii l2.real_gdp_growth_P2P l2.inflation_P2P if year < 1400 , arima(3, 1, 1)
global cmdline = e(cmdline)
putexcel AE175 = "$cmdline"

tsappend , add(1)
predict fdollar if tin(1380, 1402), y dynamic(y(1400))
label var fdollar "forcasted Dollar Import"

gen error_percent = ((fdollar - food_trade) / food_trade) * 100

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")
twoway (line food_trade year) (line fdollar year) (line error_percent year, yaxis(2)) , legend(on label(1 "داده واقعی واردات صنعت غذایی") label(2 "داده پیش بینی شده") label(3 "اختلاف درصدی داده واقعی و پیش بینی محور دوم"))  xlabel(, grid)  ytitle(واردات صنعت غذایی, axis(1)) ytitle(اختلاف درصدی داده واقعی و پیش بینی, axis(2)) title(نمودار پیش بینی دو گروه تمرین و تست) $graph_opts 
graph export "Results\graphs\ARIMA\ Train Test Diff1 Lag2 Ma2 ar0 Food Industry Import.png", replace
putexcel AE179 = image(Results\graphs\ARIMA\ Train Test Diff1 Lag2 Ma2 ar0 Food Industry Import)
putexcel AE177 = " Train Test Diff1 Lag1 Ma1 ar3 Food Industry Import", font(bold)


** Train coefs
gen diff_train = food_trade - fdollar if year < 1400
gen diff2_train = diff_train ^ 2
egen diff2_train_sum = sum(diff2_train)
egen n_train = count(diff2_train) 
egen y_mean_train = mean(food_trade)  if year < 1400

gen diff_der_train = abs(diff_train / food_trade)
egen diff_der_train_sum = sum(diff_der_train)

gen RMSE_train = sqrt(diff2_train_sum / n_train)
gen RRMSE_train = RMSE_train / y_mean_train
gen MAPE_train = (diff_der_train_sum / n_train) * 100


** test coefs

gen diff_test = food_trade - fdollar if year >= 1400
gen diff2_test = diff_test ^ 2
egen diff2_test_sum = sum(diff2_test)
egen n_test = count(diff2_test)
egen y_mean_test = mean(food_trade) if year >=1400

gen diff_der_test = abs(diff_test / food_trade)
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

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")

putexcel AG212 = "RMSE_train"
putexcel AH212 = "RRMSE_train"
putexcel AI212 = "MAPE_train"
putexcel AJ212 = "RMSE_test"
putexcel AK212 = "RRMSE_test"
putexcel AL212 = "MAPE_test"

putexcel AG213 = RMSE_train
putexcel AH213 = RRMSE_train
putexcel AI213 = MAPE_train
putexcel AJ213 = RMSE_test
putexcel AK213 = RRMSE_test
putexcel AL213 = MAPE_test







** I Choose the lag1 ar0 ma1 Model

*** Now Predicting on the entire data

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")
putexcel A220 = "Here I Present The Predictions based on Selected Model for three years after", font(bold)

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

rename azad_growth_P2P Sobat_azad_growth_P2P
rename liquidity_growth_P2P Sobat_liquidity_growth_P2P
rename real_gdp_growth_P2P Sobat_real_gdp_growth_P2P
rename budget_P2P Sobat_budget_P2P
rename inflation_P2P Sobat_inflation_P2P
rename yearly_sii Sobat_yearly_sii

merge 1:1 year using  "Gomrok Data\DTA Data\P2PAfzayesh", nogen
rename azad_growth_P2P Afzayesh_azad_growth_P2P
rename liquidity_growth_P2P Afzayesh_liquidity_growth_P2P
rename real_gdp_growth_P2P Afzayesh_real_gdp_growth_P2P
rename budget_P2P Afzayesh_budget_P2P
rename inflation_P2P Afzayesh_inflation_P2P
rename yearly_sii Afzayesh_yearly_sii

merge 1:1 year using  "Gomrok Data\DTA Data\P2PKahesh", nogen
rename azad_growth_P2P Kahesh_azad_growth_P2P
rename liquidity_growth_P2P Kahesh_liquidity_growth_P2P
rename real_gdp_growth_P2P Kahesh_real_gdp_growth_P2P
rename budget_P2P Kahesh_budget_P2P
rename inflation_P2P Kahesh_inflation_P2P
rename yearly_sii Kahesh_yearly_sii

tsset year

arima food_trade l.Sobat_azad_growth_P2P l.Sobat_yearly_sii l.Sobat_real_gdp_growth_P2P l.Sobat_inflation_P2P , arima(0, 1, 1)
global cmdline = e(cmdline)
putexcel A222 = "$cmdline"

* Check for White noise, Normality of residuals

predict error_Sobat, resid

putexcel A224 = "Pvalue of normality tests"
putexcel B225 = "Shapiro–Wilk test for normality"
putexcel C225 = "Skewness test for normality"
putexcel D225 = "kurtosis test for normality"

swilk error_Sobat
putexcel B226 = matrix(r(p))


sktest error_Sobat
putexcel C226 = matrix(r(p_skew))
putexcel D226 = matrix(r(p_kurt))

putexcel A229 = "The test to chenk residuals being white noise"
putexcel B230 = "Q statistics"
putexcel C230 = "P Value"

wntestq error_Sobat
putexcel B231 = matrix(r(stat))
putexcel C231 = matrix(r(p))

histogram error_Sobat, normal ytitle(چگالی) xtitle(باقیمانده کل داده های صادرات) title(نرمال بودن جز خطا برای مدل با یک لگ متغیرها و میانگین متحرک 1, size(small))  $graph_opts 
graph export "Results\graphs\ARIMA\ Histogram Normality residuals Diff1 Lag1 Ma1 Food Industry Import.png", replace
putexcel B234 = image(Results\graphs\ARIMA\ Histogram Normality residuals Diff1 Lag1 Ma1 Food Industry Import) 
putexcel B233 = " Histogram Normality residuals Diff1 Lag1 Ma1 Food Industry Import", font(bold)

qnorm error_Sobat, ytitle(باقیمانده کل داده های صادرات) xtitle(معکوس نرمال) title(نمودار ناپارامترک مقایسه با توزیع نرمال مدل با یک لگ متغیرها و میانگین متحرک 1, size(small)) $graph_opts
graph export "Results\graphs\ARIMA\ QQNorm Normality residuals Diff1 Lag1 Ma1 Food Industry Import.png", replace
putexcel O234 = image(Results\graphs\ARIMA\ QQNorm Normality residuals Diff1 Lag1 Ma1 Food Industry Import)
putexcel O233 = " QQNorm Normality residuals Diff1 Lag1 Ma1 Food Industry Import", font(bold)


*** Finally the prediction graph
putexcel A269 = "Here I Present The pridection Trends for three scenarios"
putexcel A270 = "In this case because we are using second lag of variables there is little difference between scenarios"

arima food_trade l.Sobat_azad_growth_P2P l.Sobat_yearly_sii l.Sobat_real_gdp_growth_P2P l.Sobat_inflation_P2P , arima(0, 1, 1)
tsappend , add(3)
predict fdollar_Sobat if tin(1380, 1405), y dynamic(y(1403))
label var fdollar_Sobat "forcasted Dollar Import Sobat"

arima food_trade l.Kahesh_azad_growth_P2P l.Kahesh_yearly_sii l.Kahesh_real_gdp_growth_P2P l.Kahesh_inflation_P2P , arima(0, 1, 1)
tsappend , add(3)
predict fdollar_Kahesh if tin(1380, 1405), y dynamic(y(1403))
label var fdollar_Kahesh "forcasted Dollar Import Kahesh"


arima food_trade l.Afzayesh_azad_growth_P2P l.Afzayesh_yearly_sii l.Afzayesh_real_gdp_growth_P2P l.Afzayesh_inflation_P2P , arima(0, 1, 1)
tsappend , add(3)
predict fdollar_Afzayesh if tin(1380, 1405), y dynamic(y(1403))
label var fdollar_Afzayesh "forcasted Dollar Import Afzayesh"

replace fdollar_Sobat = food_trade if year == 1402
replace fdollar_Kahesh = food_trade if year == 1402
replace fdollar_Afzayesh = food_trade if year == 1402


putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")
twoway (line food_trade year ,${lp0} lw(thin)) (line fdollar_Sobat year if year >= 1402,${lp1} lw(thin)) (line fdollar_Kahesh year if year >= 1402,${lp2} lw(thin))  (line fdollar_Afzayesh year if year >= 1402 ,${lp3} lw(thin))  , legend(on label(1 "داده واقعی واردات صنعت غذایی") label(2 "داده پیش بینی شده با فرض ثبات")  label(3 "داده پیش بینی شده با فرض کاهش تحریم")   label(4 "داده پیش بینی شده با فرض افزایش تحریم") size(small))  xlabel(, grid)  ytitle(واردات صنعت غذایی, axis(1)) title(نمودار پیش بینی برای سه سناریو) $graph_opts 
graph export "Results\graphs\ARIMA\ Prediction Diff1 Lag1 Ma1 Food Industry Import.png", replace
putexcel B275 = image(Results\graphs\ARIMA\ Prediction Diff1 Lag1 Ma1 Food Industry Import)
putexcel B274 = " Prediction Diff1 Lag1 Ma1 Food Industry Import", font(bold)





** I Choose the lag1 ar1 ma0 Model

*** Now Predicting on the entire data

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

rename azad_growth_P2P Sobat_azad_growth_P2P
rename liquidity_growth_P2P Sobat_liquidity_growth_P2P
rename real_gdp_growth_P2P Sobat_real_gdp_growth_P2P
rename budget_P2P Sobat_budget_P2P
rename inflation_P2P Sobat_inflation_P2P
rename yearly_sii Sobat_yearly_sii

merge 1:1 year using  "Gomrok Data\DTA Data\P2PAfzayesh", nogen
rename azad_growth_P2P Afzayesh_azad_growth_P2P
rename liquidity_growth_P2P Afzayesh_liquidity_growth_P2P
rename real_gdp_growth_P2P Afzayesh_real_gdp_growth_P2P
rename budget_P2P Afzayesh_budget_P2P
rename inflation_P2P Afzayesh_inflation_P2P
rename yearly_sii Afzayesh_yearly_sii

merge 1:1 year using  "Gomrok Data\DTA Data\P2PKahesh", nogen
rename azad_growth_P2P Kahesh_azad_growth_P2P
rename liquidity_growth_P2P Kahesh_liquidity_growth_P2P
rename real_gdp_growth_P2P Kahesh_real_gdp_growth_P2P
rename budget_P2P Kahesh_budget_P2P
rename inflation_P2P Kahesh_inflation_P2P
rename yearly_sii Kahesh_yearly_sii

tsset year

arima food_trade l.Sobat_azad_growth_P2P l.Sobat_yearly_sii l.Sobat_real_gdp_growth_P2P l.Sobat_inflation_P2P , arima(1, 1, 0)
global cmdline = e(cmdline)
putexcel A310 = "$cmdline"

* Check for White noise, Normality of residuals

predict error_Sobat, resid

putexcel A312 = "Pvalue of normality tests"
putexcel B313 = "Shapiro–Wilk test for normality"
putexcel C313 = "Skewness test for normality"
putexcel D313 = "kurtosis test for normality"

swilk error_Sobat
putexcel B314 = matrix(r(p))


sktest error_Sobat
putexcel C314 = matrix(r(p_skew))
putexcel D314 = matrix(r(p_kurt))

putexcel A320 = "The test to chenk residuals being white noise"
putexcel B321 = "Q statistics"
putexcel C321 = "P Value"

wntestq error_Sobat
putexcel B322 = matrix(r(stat))
putexcel C322 = matrix(r(p))

histogram error_Sobat, normal ytitle(چگالی) xtitle(باقیمانده کل داده های صادرات) title(نرمال بودن جز خطا برای مدل با یک لگ متغیرها و اتورگرسیو 1, size(small))  $graph_opts 
graph export "Results\graphs\ARIMA\ Histogram Normality residuals Diff1 Lag1 ar1 Food Industry Import.png", replace
putexcel B325 = image(Results\graphs\ARIMA\ Histogram Normality residuals Diff1 Lag1 ar1 Food Industry Import) 
putexcel B324 = " Histogram Normality residuals Diff1 Lag1 ar1 Food Industry Import", font(bold)

qnorm error_Sobat, ytitle(باقیمانده کل داده های صادرات) xtitle(معکوس نرمال) title(نمودار ناپارامترک مقایسه با توزیع نرمال مدل با یک لگ متغیرها و اتورگرسیو 1, size(small)) $graph_opts
graph export "Results\graphs\ARIMA\ QQNorm Normality residuals Diff1 Lag1 ar1 Food Industry Import.png", replace
putexcel O325 = image(Results\graphs\ARIMA\ QQNorm Normality residuals Diff1 Lag1 ar1 Food Industry Import)
putexcel O324 = " QQNorm Normality residuals Diff1 Lag1 ar1 Food Industry Import", font(bold)


*** Finally the prediction graph
putexcel A359 = "Here I Present The pridection Trends for three scenarios"
putexcel A360 = "In this case because we are using second lag of variables there is little difference between scenarios"

arima food_trade l.Sobat_azad_growth_P2P l.Sobat_yearly_sii l.Sobat_real_gdp_growth_P2P l.Sobat_inflation_P2P , arima(1, 1, 0)
tsappend , add(3)
predict fdollar_Sobat if tin(1380, 1405), y dynamic(y(1403))
label var fdollar_Sobat "forcasted Dollar Import Sobat"

arima food_trade l.Kahesh_azad_growth_P2P l.Kahesh_yearly_sii l.Kahesh_real_gdp_growth_P2P l.Kahesh_inflation_P2P , arima(1, 1, 0)
tsappend , add(3)
predict fdollar_Kahesh if tin(1380, 1405), y dynamic(y(1403))
label var fdollar_Kahesh "forcasted Dollar Import Kahesh"


arima food_trade l.Afzayesh_azad_growth_P2P l.Afzayesh_yearly_sii l.Afzayesh_real_gdp_growth_P2P l.Afzayesh_inflation_P2P , arima(1, 1, 0)
tsappend , add(3)
predict fdollar_Afzayesh if tin(1380, 1405), y dynamic(y(1403))
label var fdollar_Afzayesh "forcasted Dollar Import Afzayesh"


replace fdollar_Sobat = food_trade if year == 1402
replace fdollar_Kahesh = food_trade if year == 1402
replace fdollar_Afzayesh = food_trade if year == 1402


putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")
twoway (line food_trade year ,${lp0} lw(thin)) (line fdollar_Sobat year if year >= 1402,${lp1} lw(thin)) (line fdollar_Kahesh year if year >= 1402,${lp2} lw(thin))  (line fdollar_Afzayesh year if year >= 1402 ,${lp3} lw(thin))  , legend(on label(1 "داده واقعی واردات صنعت غذایی") label(2 "داده پیش بینی شده با فرض ثبات")  label(3 "داده پیش بینی شده با فرض کاهش تحریم")   label(4 "داده پیش بینی شده با فرض افزایش تحریم") size(small))  xlabel(, grid)  ytitle(واردات صنعت غذایی, axis(1)) title(نمودار پیش بینی برای سه سناریو) $graph_opts 
graph export "Results\graphs\ARIMA\ Prediction Diff1 Lag1 ar1 Food Industry Import.png", replace
putexcel B363 = image(Results\graphs\ARIMA\ Prediction Diff1 Lag1 ar1 Food Industry Import)
putexcel B362 = " Prediction Diff1 Lag1 ar1 Food Industry Import", font(bold)





** I Choose the lag1 ar1 ma0 Model

*** Now Predicting on the entire data

putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")

use "Gomrok Data\DTA Data\cleaned\Aggregatefoodinddata", clear

keep if Exp_Imp == "import"

merge 1:1 year using  "Gomrok Data\DTA Data\Global", nogen
merge 1:1 year using  "Gomrok Data\DTA Data\P2PSobat", nogen

rename azad_growth_P2P Sobat_azad_growth_P2P
rename liquidity_growth_P2P Sobat_liquidity_growth_P2P
rename real_gdp_growth_P2P Sobat_real_gdp_growth_P2P
rename budget_P2P Sobat_budget_P2P
rename inflation_P2P Sobat_inflation_P2P
rename yearly_sii Sobat_yearly_sii

merge 1:1 year using  "Gomrok Data\DTA Data\P2PAfzayesh", nogen
rename azad_growth_P2P Afzayesh_azad_growth_P2P
rename liquidity_growth_P2P Afzayesh_liquidity_growth_P2P
rename real_gdp_growth_P2P Afzayesh_real_gdp_growth_P2P
rename budget_P2P Afzayesh_budget_P2P
rename inflation_P2P Afzayesh_inflation_P2P
rename yearly_sii Afzayesh_yearly_sii

merge 1:1 year using  "Gomrok Data\DTA Data\P2PKahesh", nogen
rename azad_growth_P2P Kahesh_azad_growth_P2P
rename liquidity_growth_P2P Kahesh_liquidity_growth_P2P
rename real_gdp_growth_P2P Kahesh_real_gdp_growth_P2P
rename budget_P2P Kahesh_budget_P2P
rename inflation_P2P Kahesh_inflation_P2P
rename yearly_sii Kahesh_yearly_sii

tsset year

arima food_trade l2.Sobat_azad_growth_P2P l2.Sobat_yearly_sii l2.Sobat_real_gdp_growth_P2P l2.Sobat_inflation_P2P , arima(3, 1, 1)
global cmdline = e(cmdline)
putexcel A400 = "$cmdline"

* Check for White noise, Normality of residuals

predict error_Sobat, resid

putexcel A402 = "Pvalue of normality tests"
putexcel B403 = "Shapiro–Wilk test for normality"
putexcel C403 = "Skewness test for normality"
putexcel D403 = "kurtosis test for normality"

swilk error_Sobat
putexcel B404 = matrix(r(p))


sktest error_Sobat
putexcel C405 = matrix(r(p_skew))
putexcel D405 = matrix(r(p_kurt))

putexcel A410 = "The test to chenk residuals being white noise"
putexcel B411 = "Q statistics"
putexcel C411 = "P Value"

wntestq error_Sobat
putexcel B412 = matrix(r(stat))
putexcel C412 = matrix(r(p))

histogram error_Sobat, normal ytitle(چگالی) xtitle(باقیمانده کل داده های صادرات) title(نرمال بودن جز خطا برای مدل با یک لگ متغیرها و اتورگرسیو 3 و میانگین متحرک 1, size(small))  $graph_opts 
graph export "Results\graphs\ARIMA\ Histogram Normality residuals Diff1 Lag2 Ma1 ar3 Food Industry Import.png", replace
putexcel B415 = image(Results\graphs\ARIMA\ Histogram Normality residuals Diff1 Lag2 Ma1 ar3 Food Industry Import) 
putexcel B414 = " Histogram Normality residuals Diff1 Lag2 Ma1 ar3 Food Industry Import", font(bold)

qnorm error_Sobat, ytitle(باقیمانده کل داده های صادرات) xtitle(معکوس نرمال) title(نمودار ناپارامترک مقایسه با توزیع نرمال مدل با یک لگ متغیرها و اتورگرسیو 3 و میانگین متحرک 1, size(small)) $graph_opts
graph export "Results\graphs\ARIMA\ QQNorm Normality residuals Diff1 Lag2 Ma1 ar3 Food Industry Import.png", replace
putexcel O415 = image(Results\graphs\ARIMA\ QQNorm Normality residuals Diff1 Lag2 Ma1 ar3 Food Industry Import)
putexcel O414 = " QQNorm Normality residuals Diff1 Lag2 Ma1 ar3 Food Industry Import", font(bold)


*** Finally the prediction graph
putexcel A449 = "Here I Present The pridection Trends for three scenarios"
putexcel A450 = "In this case because we are using second lag of variables there is little difference between scenarios"

arima food_trade l2.Sobat_azad_growth_P2P l2.Sobat_yearly_sii l2.Sobat_real_gdp_growth_P2P l2.Sobat_inflation_P2P , arima(3, 1, 1)
tsappend , add(3)
predict fdollar_Sobat if tin(1380, 1405), y dynamic(y(1403))
label var fdollar_Sobat "forcasted Dollar Import Sobat"

arima food_trade l2.Kahesh_azad_growth_P2P l2.Kahesh_yearly_sii l2.Kahesh_real_gdp_growth_P2P l2.Kahesh_inflation_P2P , arima(3, 1, 1)
tsappend , add(3)
predict fdollar_Kahesh if tin(1380, 1405), y dynamic(y(1403))
label var fdollar_Kahesh "forcasted Dollar Import Kahesh"


arima food_trade l2.Afzayesh_azad_growth_P2P l2.Afzayesh_yearly_sii l2.Afzayesh_real_gdp_growth_P2P l2.Afzayesh_inflation_P2P , arima(3, 1, 1)
tsappend , add(3)
predict fdollar_Afzayesh if tin(1380, 1405), y dynamic(y(1403))
label var fdollar_Afzayesh "forcasted Dollar Import Afzayesh"


replace fdollar_Sobat = food_trade if year == 1402
replace fdollar_Kahesh = food_trade if year == 1402
replace fdollar_Afzayesh = food_trade if year == 1402


putexcel set "Results\ARIMA", modify sheet("Choosing Model Import IndFood")
twoway (line food_trade year ,${lp0} lw(thin)) (line fdollar_Sobat year if year >= 1402,${lp1} lw(thin)) (line fdollar_Kahesh year if year >= 1402,${lp2} lw(thin))  (line fdollar_Afzayesh year if year >= 1402 ,${lp3} lw(thin))  , legend(on label(1 "داده واقعی واردات صنعت غذایی") label(2 "داده پیش بینی شده با فرض ثبات")  label(3 "داده پیش بینی شده با فرض کاهش تحریم")   label(4 "داده پیش بینی شده با فرض افزایش تحریم") size(small))  xlabel(, grid)  ytitle(واردات صنعت غذایی, axis(1)) title(نمودار پیش بینی برای سه سناریو) $graph_opts 
graph export "Results\graphs\ARIMA\ Prediction Diff1 Lag2 Ma1 ar3 Food Industry Import.png", replace
putexcel B454 = image(Results\graphs\ARIMA\ Prediction Diff1 Lag2 Ma1 ar3 Food Industry Import)
putexcel B453 = " Prediction Diff1 Lag2 Ma1 ar3 Food Industry Import", font(bold)







