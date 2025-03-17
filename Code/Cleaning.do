
********Reza Johari
********Dr Vesal
******** Gomrok - Cleaning Data
********25/08/1403


******************************************************************
******************************************************************
/*
*********** Preperations: 
						1) CD
						2) Creating Directories (Only Run Once)


*********** Step 1 : Importing Data (Bookmark 1) 
					   1) Gomrok Data (94,95 and 96 import has two sheets)
					   2) HS Data
					   3) HS Converstion
					   4) Importing HS Conversions to 1992
					   5) HS92 to ISIC3
					   6) Importing ISIC3 to ISIC3.1
					   7) Importing ISIC3.1 to ISIC4
					   8) ISIC3 Description
					   9) 4 Digit Description
					   10) Country Name
					   
					   

*********** Step 2 : Check if Sum of micro Data Is Equal to Excel Macro Data (Bookmark 2)
*********** Step 3 : Compatibility of HS Codes and Tariff Codes (Bookmark 3)
*********** Step 4 : Creating a Standard HS Code Format For years (Bookmark4)
*********** Step 5 : Appending All Unified Datas (Bookmark 5)
*********** Step 6 : Graphs (Bookmark 6)


*/ 


// cd "H:\RADrVesal\RA"



**# Importing Data (Bookmark 1)

** Importing Data into Stata

** 1) Gomrok Data 

* For Export

forvalues i=71/93 {
	
	import excel "Gomrok Data\Excel country_tariff\Export\\`i'.xls", sheet("Sheet 1") firstrow clear
	destring year weight rial dollar , replace force
	save "Gomrok Data\DTA Data\export 13`i'", replace
	
}

forvalues i=95/96 {
	
	import excel "Gomrok Data\Excel country_tariff\Export\\`i'.xls", sheet("Sheet 1") firstrow clear
	destring year weight rial dollar , replace force
	save "Gomrok Data\DTA Data\export 13`i'", replace
	
}

forvalues i=97/99 {
	
	import excel "Gomrok Data\Excel country_tariff\Export\\`i'.xlsx", sheet("Sheet 1") firstrow clear
	destring year weight rial dollar , replace force
	save "Gomrok Data\DTA Data\export 13`i'", replace
}

forvalues i=100/102 {
	
	import excel "Gomrok Data\Excel country_tariff\Export\\`i'.xlsx", sheet("Sheet 1") firstrow clear
	destring year weight rial dollar , replace force
	local m = `i' + 300
	save "Gomrok Data\DTA Data\export 1`m'", replace
}


import excel "Gomrok Data\Excel country_tariff\Export\94 country.xls", sheet("50 کشور عمده") firstrow clear
save "Gomrok Data\DTA Data\export 1394 country", replace

import excel "Gomrok Data\Excel country_tariff\Export\94 tariff.xls", sheet("tarif-exp") firstrow clear
save "Gomrok Data\DTA Data\export 1394 tariff", replace

* For Import 

forvalues i=71/93 {
	
	import excel "Gomrok Data\Excel country_tariff\Import\\`i'.xls", sheet("Sheet 1") firstrow clear
	destring year weight rial dollar , replace force
	save "Gomrok Data\DTA Data\import 13`i'", replace
	
}

// For year 1394 and 1395 each excel file has two sheets, I import both sheets to check if data in two sheets are continuous, if so I will append them.

forvalues i=94/96 {
	forvalues j=1/2{
		
		import excel "Gomrok Data\Excel country_tariff\Import\\`i'.xls", sheet("Sheet `j'") firstrow clear
		destring year weight rial dollar , replace force
		drop if year ==.
		save "Gomrok Data\DTA Data\import 13`i' sheet `j'", replace

	}
}

forvalues i=97/99 {
	
	import excel "Gomrok Data\Excel country_tariff\Import\\`i'.xlsx", sheet("Sheet 1") firstrow clear
	destring year weight rial dollar , replace force
	save "Gomrok Data\DTA Data\import 13`i'", replace
}

forvalues i=100/102 {
	
	import excel "Gomrok Data\Excel country_tariff\Import\\`i'.xlsx", sheet("Sheet 1") firstrow clear
	destring year weight rial dollar , replace force
	local m = `i' + 300
	save "Gomrok Data\DTA Data\import 1`m'", replace
}


** Checking if Import Data in sheet 2 is a continue for data in sheet 1 (for year 94,95 and 96)

* I import sheet 1, then merge sheet 2, if there is no matched data in merging, then I conclude that Data in sheet 2 is continouos of sheet 1

use "Gomrok Data\DTA Data\import 1394 sheet 1", clear
merge 1:1 gomrok country code using "Gomrok Data\DTA Data\import 1394 sheet 2"

use "Gomrok Data\DTA Data\import 1395 sheet 1", clear
drop if year ==.
// One Data in line 11 is duplicated (duplicate example) so I collapse by "country, gomrok, codes"
collapse (sum) dollar weight rial , by(year country gomrok code)
merge 1:1 gomrok country code using "Gomrok Data\DTA Data\import 1395 sheet 2"

use "Gomrok Data\DTA Data\import 1396 sheet 1", clear
merge 1:1 gomrok country code using "Gomrok Data\DTA Data\import 1396 sheet 2" 

* Creating a single DTA data for year 94,95 and 96
forvalues i=1394/1396 {
	
	use "Gomrok Data\DTA Data\import `i' sheet 1", clear
	append using "Gomrok Data\DTA Data\import `i' sheet 2"
	save "Gomrok Data\DTA Data\import `i'", replace
	
}


** 2) Importing HS Codes

import excel "HS\HSCodeandDescription.xlsx", sheet("HS22") firstrow clear
keep if Level =="6"
rename Code code
asdoc codebook code , save(Uniaue HS)
save "Gomrok Data\DTA Data\HS22", replace

import excel "HS\HSCodeandDescription.xlsx", sheet("HS17") firstrow clear
keep if Level =="6"
rename Code code
asdoc codebook code , save(Uniaue HS)
save "Gomrok Data\DTA Data\HS17", replace

import excel "HS\HSCodeandDescription.xlsx", sheet("HS12") firstrow clear
keep if Level =="6"
rename Code code
asdoc codebook code , save(Uniaue HS)
save "Gomrok Data\DTA Data\HS12", replace

import excel "HS\HSCodeandDescription.xlsx", sheet("HS07") firstrow clear
keep if Level =="6"
rename Code code
asdoc codebook code , save(Uniaue HS)
save "Gomrok Data\DTA Data\HS07", replace

import excel "HS\HSCodeandDescription.xlsx", sheet("HS02") firstrow clear
keep if Level =="6"
rename Code code
asdoc codebook code , save(Uniaue HS)
save "Gomrok Data\DTA Data\HS02", replace

import excel "HS\HSCodeandDescription.xlsx", sheet("HS96") firstrow clear
keep if Level =="6"
rename Code code
asdoc codebook code , save(Uniaue HS)
save "Gomrok Data\DTA Data\HS96", replace

import excel "HS\HSCodeandDescription.xlsx", sheet("HS92") firstrow clear
keep if Level =="6"
rename Code code
asdoc codebook code , save(Uniaue HS)
save "Gomrok Data\DTA Data\HS92", replace


/*

** 3) Import HS Correlations (Correlations!)

import excel "H:\RADrVesal\RA\HS Conversion\HS 2012 to HS 1992 Correlation and conversion tables.xls", sheet("Correlation") firstrow clear
destring HS2012 HS1992, replace force
//egen count1992 = count(HS2012) ,by(HS1992)
//egen group1992 = group(HS1992) if count1992 > 1
save "Gomrok Data\DTA Data\HS Correlation 2012 to 1992", replace


import excel "H:\RADrVesal\RA\HS Conversion\HS 2012 to HS 1996 Correlation and conversion tables.xls", sheet("Correlation") firstrow clear
destring HS2012 HS1996, replace force
//egen count1996 = count(HS2012) ,by(HS1996)
//egen group1996 = group(HS1996) if count1996 > 1
save "Gomrok Data\DTA Data\HS Correlation 2012 to 1996", replace


import excel "H:\RADrVesal\RA\HS Conversion\HS 2012 to HS 2002 Correlation and conversion tables.xls", sheet("Correlation") firstrow clear
destring HS2012 HS2002, replace force
//egen count2002 = count(HS2012) ,by(HS2002)
//egen group2002 = group(HS2002) if count2002 > 1
save "Gomrok Data\DTA Data\HS Correlation 2012 to 2002", replace

import excel "H:\RADrVesal\RA\HS Conversion\HS 2012 to HS 2007 Correlation and conversion tables.xls", sheet("Correlation") firstrow clear
destring HS2012 HS2007, replace force
//egen count2007 = count(HS2012) ,by(HS2007)
//egen group2007 = group(HS2007) if count2007 > 1
save "Gomrok Data\DTA Data\HS Correlation 2012 to 2007", replace

import excel "H:\RADrVesal\RA\HS Conversion\HS2017toHS2012ConversionAndCorrelationTables.xlsx", sheet("Correlation") firstrow clear
destring HS2012 HS2017, replace force
//egen count2017 = count(HS2012) ,by(HS2017)
//egen group2017 = group(HS2017) if count2017 > 1
save "Gomrok Data\DTA Data\HS Correlation 2012 to 2017", replace


import excel "H:\RADrVesal\RA\HS Conversion\HS2022toHS2012ConversionAndCorrelationTables.xlsx", sheet("Correlation") firstrow clear
destring HS2012 HS2022, replace force
//egen count2022 = count(HS2012) ,by(HS2022)
//egen group2022 = group(HS2022) if count2022 > 1
save "Gomrok Data\DTA Data\HS Correlation 2012 to 2022", replace

*/


** 4) Importing HS Conversions to 1992

import excel "HS Conversion\conversions\HS 1996 to HS1992  Correlation and conversion tables.xls", sheet("Conversion Table") firstrow clear
save "Gomrok Data\DTA Data\HS Conversion 1996 to 1992", replace

import excel "HS Conversion\conversions\HS 2002 to HS1992  Correlation and conversion tables.xls", sheet("Conversion Table") firstrow clear
save "Gomrok Data\DTA Data\HS Conversion 2002 to 1992", replace

import excel "HS Conversion\conversions\HS 2007 to HS 1992 Correlation and conversion tables.xls", sheet("Conversion Tables") firstrow clear
save "Gomrok Data\DTA Data\HS Conversion 2007 to 1992", replace

import excel "HS Conversion\conversions\HS 2012 to HS 1992 Correlation and conversion tables.xls", sheet("Conversion") firstrow clear
drop C
save "Gomrok Data\DTA Data\HS Conversion 2012 to 1992", replace

import excel "HS Conversion\conversions\HS 2017 to HS1992 ConversionAndCorrelationTables.xlsx", sheet("Conversion HS17-HS92") firstrow clear
save "Gomrok Data\DTA Data\HS Conversion 2017 to 1992", replace

import excel "HS Conversion\conversions\HS 2022 to HS1992 ConversionAndCorrelationTables.xlsx", sheet("HS2022-HS1992 Conversions") firstrow clear
save "Gomrok Data\DTA Data\HS Conversion 2022 to 1992", replace


** 5) Importing HS1992 to ISIC3
import delimited "HS to ISIC Conversion\HS1992 to ISIC 3 Conversion.CSV", case(preserve) stringcols(1 3)  clear
drop v2
gen HS_length = strlen(HS1992)
gen zero = "0"
gen HS1992new = zero + HS1992  if HS_length == 5
replace HS1992new = HS1992 if HS1992new == ""
drop HS1992
rename HS1992new HS1992
save "Gomrok Data\DTA Data\HS1992 to ISIC3", replace


/*
** 6) Importing ISIC3 to ISIC3.1

import excel "H:\RADrVesal\RA\ISIC to Newer Versions\ISIC3 to ISIC31.xlsx", sheet("Sheet1") firstrow clear

tostring Rev31, replace force

gen lengthISIC3 = strlen(Rev3)
gen lengthISIC31 = strlen(Rev31)
gen zero = "0"
gen ISIC3 = zero + Rev3 if lengthISIC3 == 3
gen ISIC31 = zero + Rev31 if lengthISIC31 == 3

replace ISIC3 = Rev3 if lengthISIC3 == 4
replace ISIC31 = Rev31 if lengthISIC31 == 4

drop partial3 partial31 Activity zero Rev3 Rev31 lengthISIC3 lengthISIC31

save "Gomrok Data\DTA Data\ISIC3 to ISIC31", replace

** 7) Importing ISIC3.1 to ISIC4

import excel "H:\RADrVesal\RA\ISIC to Newer Versions\ISIC31 to ISIC4.xlsx", sheet("Sheet1") firstrow clear

tostring ISIC31code ISIC4code, replace force

gen lengthISIC31 = strlen(ISIC31code)
gen lengthISIC4 = strlen(ISIC4code)
gen zero = "0"
gen ISIC31 = zero + ISIC31code if lengthISIC31 == 3
gen ISIC4 = zero + ISIC4code if lengthISIC4 == 3

replace ISIC31 = ISIC31code if lengthISIC31 == 4
replace ISIC4 = ISIC4code if lengthISIC4 == 4

drop ISIC31code partialISIC31 ISIC4code partialISIC4 Detail lengthISIC31 lengthISIC4 zero

save "Gomrok Data\DTA Data\ISIC31 to ISIC4", replace

*/


** 8) ISIC3 Description

import excel "ISIC3 Description\ISIC3 Desc.xlsx", sheet("Sheet1") firstrow clear
rename Code ISIC3
rename Description ISICDesc
save "Gomrok Data\DTA Data\ISIC3 Description", replace


** 9) 4 Digit Description
import excel "HS\HSCodeandDescription.xlsx", sheet("HS92") firstrow clear

keep if Level == "4"
keep Code Description
rename Description HS_4digit_desc
rename Code HS_main_group
save "Gomrok Data\DTA Data\4digit desc", replace

/*

import excel "H:\RADrVesal\RA\tariff percent\4 digit code.xlsx", sheet("Sheet1") firstrow clear
keep tariffdesc code درصد
gen strlen = strlen(code)
gen zero = "0"
replace code = zero + code if strlen == 5| strlen == 1 | strlen == 3 | strlen == 7
keep if strlen(code)==4
rename code HS_main_group
save "Gomrok Data\DTA Data\4digit desc", replace

*/



*** 10) Country Name

import excel "country name\country tranformation from Farsi.xlsx", sheet("Sheet1") firstrow clear
save "Gomrok Data\DTA Data\countryname", replace


*** 11) Importing Macro Data Sheet from Date 03/08/1403 File (Macro)

import excel "predictions data\Data_1403_08_03.xlsx", sheet("Macro") firstrow clear

keep jalali_date iran_cpi real_gdp real_non_oil_gdp iran_cpi consumer_inflation iran_ppi producer_inflation

keep if substr(jalali_date ,6 ,2) == "12"

gen year = substr(jalali_date ,1 ,4)

destring year, replace force

drop jalali_date

save "Gomrok Data\DTA Data\Macro", replace


*** 12) Importing Global Data Sheet from Data 03/08/1403 File (Global)

import excel "predictions data\Data_1403_08_03.xlsx", sheet("Global") firstrow clear

keep jalali_date us_cpi sii sii_growth

keep if substr(jalali_date ,6 ,2) == "12"

gen year = substr(jalali_date ,1 ,4)

destring year, replace force

drop jalali_date

save "Gomrok Data\DTA Data\Global", replace


*** 13) Importing P2P Sheet Sobat

import excel "predictions data\results seasonal and P2P from 1380 - 20241130 (3).xlsx", sheet("ثبات تحریم") firstrow clear
gen year = substr(Quarter, 1, 4)

egen yearly_sii = mean(sii) ,by(year)
drop sii
keep if substr(Quarter, 6, 6) == "4"

drop Quarter
// drop if year == "1403" | year == "1404" | year == "1405"
destring year ,replace force
save "Gomrok Data\DTA Data\P2PSobat" , replace


*** 14) Importing P2P Sheet Kahesh

import excel "predictions data\results seasonal and P2P from 1380 - 20241130 (3).xlsx", sheet("کاهش تحریم") firstrow clear

gen year = substr(Quarter, 1, 4)

egen yearly_sii = mean(sii) ,by(year)
drop sii
keep if substr(Quarter, 6, 6) == "4"

drop Quarter
// drop if year == "1403" | year == "1404" | year == "1405"
destring year ,replace force
save "Gomrok Data\DTA Data\P2PKahesh" , replace


*** 15) Importing P2P Sheet 

import excel "predictions data\results seasonal and P2P from 1380 - 20241130 (3).xlsx", sheet("افزایش تحریم") firstrow clear

gen year = substr(Quarter, 1, 4)

egen yearly_sii = mean(sii) ,by(year)
drop sii
keep if substr(Quarter, 6, 6) == "4"

drop Quarter
// drop if year == "1403" | year == "1404" | year == "1405"
destring year ,replace force
save "Gomrok Data\DTA Data\P2PAfzayesh" , replace


*** 16) Importing HS4 (4 digit HS Codes) Persian
import excel "HS4 1992 Persian.xlsx", sheet("Sheet1") firstrow clear
rename Description HS4Description
keep HS4 Persian_HS_4digit_Desc Persian_HS_4digit_Desc_Short HS4Description

save "Gomrok Data\DTA Data\HS4 Persian", replace

*** 17) Importing HS2 (2 digit HS Codes) Persian
import excel "HS2 1992 Persian.xlsx", sheet("Sheet1") firstrow clear

rename Description HS2Description
keep HS2 Persian_HS_2digit_Desc Persian_HS_2digit_Desc_Short HS2Description

save "Gomrok Data\DTA Data\HS2 Persian", replace




**# Sum of Micro and Macro in Excels (Bookmark 2)
** How much The sum of Data is Different from Excel Files?

* Export

putexcel set "Results\Results", replace sheet("Excel total Difference")
putexcel A1 = "How Much Does the Sum of Micro Data differ from Actual Gomrok sum", font(bold,14,black)
putexcel D2 = "Export", font(bold,12,black)
putexcel D2 = "Import", font(bold,12,black)

use "Gomrok Data\DTA Data\export 1371", clear

gen excel_total_weight = weight if country =="جمع"
gen excel_total_dollar = dollar if country =="جمع"
gen excel_total_rial = rial if country =="جمع"

fillmissing excel_total_weight excel_total_dollar excel_total_rial

drop if country == "جمع"

egen total_weight = sum(weight)
egen total_dollar = sum(dollar)
egen total_rial = sum(rial)

gen total_diff_weight = excel_total_weight - total_weight
gen total_diff_dollar = excel_total_dollar - total_dollar
gen total_diff_rial = excel_total_rial - total_rial

gen total_diff_weight_per = (excel_total_weight - total_weight) / total_weight * 100
gen total_diff_dollar_per = (excel_total_dollar - total_dollar) / total_dollar * 100
gen total_diff_rial_per = (excel_total_rial - total_rial) / total_rial * 100

collapse (mean) year excel_total_weight excel_total_dollar excel_total_rial total_weight total_dollar total_rial total_diff_weight total_diff_dollar total_diff_rial total_diff_weight_per total_diff_dollar_per total_diff_rial_per

export excel using "Results\Results.xlsx", sheet("Excel total Difference", modify) cell(A3) firstrow(variables)

local m=4

forvalues i = 1372/1393{

	use "Gomrok Data\DTA Data\export `i'", clear

	gen excel_total_weight = weight if country =="جمع"
	gen excel_total_dollar = dollar if country =="جمع"
	gen excel_total_rial = rial if country =="جمع"

	fillmissing excel_total_weight excel_total_dollar excel_total_rial

	drop if country == "جمع"

	egen total_weight = sum(weight)
	egen total_dollar = sum(dollar)
	egen total_rial = sum(rial)

	gen total_diff_weight = excel_total_weight - total_weight
	gen total_diff_dollar = excel_total_dollar - total_dollar
	gen total_diff_rial = excel_total_rial - total_rial

	gen total_diff_weight_per = (excel_total_weight - total_weight) / total_weight * 100
	gen total_diff_dollar_per = (excel_total_dollar - total_dollar) / total_dollar * 100
	gen total_diff_rial_per = (excel_total_rial - total_rial) / total_rial * 100
	
	destring year , replace force
	
	collapse (mean) year excel_total_weight excel_total_dollar excel_total_rial total_weight total_dollar total_rial total_diff_weight total_diff_dollar total_diff_rial total_diff_weight_per total_diff_dollar_per total_diff_rial_per
	
	local m = `m' + 1
	export excel using "Results\Results.xlsx", sheet("Excel total Difference", modify) cell(A`m')
	
}


forvalues i = 1395/1402{

	use "Gomrok Data\DTA Data\export `i'", clear

	gen excel_total_weight = weight if country =="جمع"
	gen excel_total_dollar = dollar if country =="جمع"
	gen excel_total_rial = rial if country =="جمع"

	fillmissing excel_total_weight excel_total_dollar excel_total_rial

	drop if country == "جمع"

	egen total_weight = sum(weight)
	egen total_dollar = sum(dollar)
	egen total_rial = sum(rial)

	gen total_diff_weight = excel_total_weight - total_weight
	gen total_diff_dollar = excel_total_dollar - total_dollar
	gen total_diff_rial = excel_total_rial - total_rial

	gen total_diff_weight_per = (excel_total_weight - total_weight) / total_weight * 100
	gen total_diff_dollar_per = (excel_total_dollar - total_dollar) / total_dollar * 100
	gen total_diff_rial_per = (excel_total_rial - total_rial) / total_rial * 100
	
	destring year , replace force
	
	collapse (mean) year excel_total_weight excel_total_dollar excel_total_rial total_weight total_dollar total_rial total_diff_weight total_diff_dollar total_diff_rial total_diff_weight_per total_diff_dollar_per total_diff_rial_per
	
	local m = `m' + 1
	export excel using "Results\Results.xlsx", sheet("Excel total Difference", modify) cell(A`m')
	
}



* Import 

use "Gomrok Data\DTA Data\import 1371", clear

gen excel_total_weight = weight if country =="جمع"
gen excel_total_dollar = dollar if country =="جمع"
gen excel_total_rial = rial if country =="جمع"

fillmissing excel_total_weight excel_total_dollar excel_total_rial

drop if country == "جمع"

egen total_weight = sum(weight)
egen total_dollar = sum(dollar)
egen total_rial = sum(rial)

gen total_diff_weight = excel_total_weight - total_weight
gen total_diff_dollar = excel_total_dollar - total_dollar
gen total_diff_rial = excel_total_rial - total_rial

gen total_diff_weight_per = (excel_total_weight - total_weight) / total_weight * 100
gen total_diff_dollar_per = (excel_total_dollar - total_dollar) / total_dollar * 100
gen total_diff_rial_per = (excel_total_rial - total_rial) / total_rial * 100

collapse (mean) year excel_total_weight excel_total_dollar excel_total_rial total_weight total_dollar total_rial total_diff_weight total_diff_dollar total_diff_rial total_diff_weight_per total_diff_dollar_per total_diff_rial_per

export excel using "Results\Results.xlsx", sheet("Excel total Difference", modify) cell(P3) firstrow(variables)

local m=4

forvalues i = 1372/1402{

	use "Gomrok Data\DTA Data\import `i'", clear

	gen excel_total_weight = weight if country =="جمع"
	gen excel_total_dollar = dollar if country =="جمع"
	gen excel_total_rial = rial if country =="جمع"

	fillmissing excel_total_weight excel_total_dollar excel_total_rial

	drop if country == "جمع"

	egen total_weight = sum(weight)
	egen total_dollar = sum(dollar)
	egen total_rial = sum(rial)

	gen total_diff_weight = excel_total_weight - total_weight
	gen total_diff_dollar = excel_total_dollar - total_dollar
	gen total_diff_rial = excel_total_rial - total_rial

	gen total_diff_weight_per = (excel_total_weight - total_weight) / total_weight * 100
	gen total_diff_dollar_per = (excel_total_dollar - total_dollar) / total_dollar * 100
	gen total_diff_rial_per = (excel_total_rial - total_rial) / total_rial * 100
	
	destring year , replace force
	
	collapse (mean) year excel_total_weight excel_total_dollar excel_total_rial total_weight total_dollar total_rial total_diff_weight total_diff_dollar total_diff_rial total_diff_weight_per total_diff_dollar_per total_diff_rial_per
	
	local m = `m' + 1
export excel using "Results\Results.xlsx", sheet("Excel total Difference", modify) cell(P`m')
	
}




**# Compatibility of HS Codes and Tariff Codes (Bookmark 3)

** Check for which HS Code is more compatible with Codes in each file
putexcel set "Results\Results",modify sheet("HS Compatibility Tariff",replace)
putexcel A1 = "What Version of HS Codes is Compatible with Tariff Codes", font(bold,12,black)
putexcel D2 = "Export", font(bold,14,black)


use "Gomrok Data\DTA Data\export 1371" , clear

replace code = substr(code, 1,6)
collapse (sum) weight dollar rial, by(year code)

drop if code == ""

keep year code

foreach j in  92 96 02 07 12 17 22{
	merge 1:1 code using "Gomrok Data\DTA Data\HS`j'" ,keepusing(code) generate(merging`j')
	drop if year == .
	gen compatible_year`j' = `j' if merging`j' ==3
	egen count`j' = count(merging`j') if merging`j' == 3
}
// fillmissing count92 count96 count02 count07 count12 count17 count22
egen countall = count(year)
egen m = rowmax( count22 count17 count12 count07 count02 count96 count92 )
egen compatible_count = max(m)
gen compatible_year = .
foreach j in  92 96 02 07 12 17 22{
	replace compatible_year = `j' if compatible_count == count`j' & m != .
}
fillmissing compatible_year

gen percent_compatibility = compatible_count/ countall * 100

keep year compatible_count compatible_year percent_compatibility countall

collapse (mean) year countall compatible_count compatible_year percent_compatibility

export excel using "Results\Results.xlsx", sheet("HS Compatibility Tariff", modify) cell(A3) firstrow(variables)


local m=4
forvalues i=1372/1393{
	
use "Gomrok Data\DTA Data\export `i'" , clear

replace code = substr(code, 1,6)
collapse (sum) weight dollar rial, by(year code)

drop if code == ""

keep year code

foreach j in  92 96 02 07 12 17 22{
	merge 1:1 code using "Gomrok Data\DTA Data\HS`j'" ,keepusing(code) generate(merging`j')
	drop if year == .
	gen compatible_year`j' = `j' if merging`j' ==3
	egen count`j' = count(merging`j') if merging`j' == 3
}

egen countall = count(year)
egen m = rowmax( count22 count17 count12 count07 count02 count96 count92 )
egen compatible_count = max(m)
gen compatible_year = .
foreach j in  92 96 02 07 12 17 22{
	replace compatible_year = `j' if compatible_count == count`j' & m != .
}
fillmissing compatible_year

gen percent_compatibility = compatible_count/ countall * 100

keep year compatible_count compatible_year percent_compatibility countall

collapse (mean) year countall compatible_count compatible_year percent_compatibility

local m=`m' + 1
export excel using "Results\Results.xlsx", sheet("HS Compatibility Tariff", modify) cell(A`m')

	
}


use "Gomrok Data\DTA Data\export 1394 tariff" , clear

replace code = substr(code, 1,6)
collapse (sum) weight dollar rial, by(year code)

drop if code == ""

keep year code

foreach j in  92 96 02 07 12 17 22{
	merge 1:1 code using "Gomrok Data\DTA Data\HS`j'" ,keepusing(code) generate(merging`j')
	drop if year == .
	gen compatible_year`j' = `j' if merging`j' ==3
	egen count`j' = count(merging`j') if merging`j' == 3
}
// fillmissing count92 count96 count02 count07 count12 count17 count22
egen countall = count(year)
egen m = rowmax( count22 count17 count12 count07 count02 count96 count92 )
egen compatible_count = max(m)
gen compatible_year = .
foreach j in  92 96 02 07 12 17 22{
	replace compatible_year = `j' if compatible_count == count`j' & m != .
}
fillmissing compatible_year

gen percent_compatibility = compatible_count/ countall * 100

keep year compatible_count compatible_year percent_compatibility countall

collapse (mean) year countall compatible_count compatible_year percent_compatibility

export excel using "Results\Results.xlsx", sheet("HS Compatibility Tariff", modify) cell(A35)





forvalues i=1395/1402{
	
use "Gomrok Data\DTA Data\export `i'" , clear

replace code = substr(code, 1,6)
collapse (sum) weight dollar rial, by(year code)

drop if code == ""

keep year code

foreach j in  92 96 02 07 12 17 22{
	merge 1:1 code using "Gomrok Data\DTA Data\HS`j'" ,keepusing(code) generate(merging`j')
	drop if year == .
	gen compatible_year`j' = `j' if merging`j' ==3
	egen count`j' = count(merging`j') if merging`j' == 3
}
// fillmissing count92 count96 count02 count07 count12 count17 count22
egen countall = count(year)
egen m = rowmax( count22 count17 count12 count07 count02 count96 count92 )
egen compatible_count = max(m)
gen compatible_year = .
foreach j in  92 96 02 07 12 17 22{
	replace compatible_year = `j' if compatible_count == count`j' & m != .
}
fillmissing compatible_year

gen percent_compatibility = compatible_count/ countall * 100

keep year compatible_count compatible_year percent_compatibility countall

collapse (mean) year countall compatible_count compatible_year percent_compatibility

local m=`m' + 1
export excel using "Results\Results.xlsx", sheet("HS Compatibility Tariff", modify) cell(A`m')

	
}


* import 

putexcel set "Results\Results",modify sheet("HS Compatibility Tariff")
putexcel K2 = "Import", font(bold,14,black)

use "Gomrok Data\DTA Data\import 1371" , clear

replace code = substr(code, 1,6)
collapse (sum) weight dollar rial, by(year code)

drop if code == ""

keep year code

foreach j in  92 96 02 07 12 17 22{
	merge 1:1 code using "Gomrok Data\DTA Data\HS`j'" ,keepusing(code) generate(merging`j')
	drop if year == .
	gen compatible_year`j' = `j' if merging`j' ==3
	egen count`j' = count(merging`j') if merging`j' == 3
}
// fillmissing count92 count96 count02 count07 count12 count17 count22
egen countall = count(year)
egen m = rowmax( count22 count17 count12 count07 count02 count96 count92 )
egen compatible_count = max(m)
gen compatible_year = .
foreach j in  92 96 02 07 12 17 22{
	replace compatible_year = `j' if compatible_count == count`j' & m != .
}
fillmissing compatible_year

gen percent_compatibility = compatible_count/ countall * 100

keep year compatible_count compatible_year percent_compatibility countall

collapse (mean) year countall compatible_count compatible_year percent_compatibility

export excel using "Results\Results.xlsx", sheet("HS Compatibility Tariff", modify) cell(H3) firstrow(variables)


local m=4
forvalues i=1372/1402{
	
use "Gomrok Data\DTA Data\import `i'" , clear

replace code = substr(code, 1,6)
collapse (sum) weight dollar rial, by(year code)

drop if code == ""

keep year code

foreach j in  92 96 02 07 12 17 22{
	merge 1:1 code using "Gomrok Data\DTA Data\HS`j'" ,keepusing(code) generate(merging`j')
	drop if year == .
	gen compatible_year`j' = `j' if merging`j' ==3
	egen count`j' = count(merging`j') if merging`j' == 3
}

egen countall = count(year)
egen m = rowmax( count22 count17 count12 count07 count02 count96 count92 )
egen compatible_count = max(m)
gen compatible_year = .
foreach j in  92 96 02 07 12 17 22{
	replace compatible_year = `j' if compatible_count == count`j' & m != .
}
fillmissing compatible_year

gen percent_compatibility = compatible_count/ countall * 100

keep year compatible_count compatible_year percent_compatibility countall

collapse (mean) year countall compatible_count compatible_year percent_compatibility

local m=`m' + 1
export excel using "Results\Results.xlsx", sheet("HS Compatibility Tariff", modify) cell(H`m')

	
}






/*

** Check The percentage of changes for each Correlation
foreach i in 1992 1996 2002 2007 2017 2022{
	use "Gomrok Data\DTA Data\HS Correlation 2012 to `i'", clear

	egen group_rel = group(Relationship)
	labmask group_rel, values(Relationship)
	asdoc proportion group_rel
}

*/





**# Making a Unique Code Through years (Bookmark 4)

* Import

forvalues i=1375/1377 {
	
	use "Gomrok Data\DTA Data\import `i'", clear
	replace code = substr(code, 1, 6)
	merge n:1 code using "Gomrok Data\DTA Data\HS92" , generate(match)

	drop if match == 2

	gen unidied_code = code if match == 3

	save "Gomrok Data\DTA Data\unified\unified import `i'", replace
	
}

forvalues i=1378/1381{
	use "Gomrok Data\DTA Data\import `i'" , clear
	replace code = substr(code, 1, 6)
	merge n:1 code using "Gomrok Data\DTA Data\HS96" , generate(match)

	drop if match == 2
	gen HS1996 = code if match == 3

	merge n:n HS1996 using "Gomrok Data\DTA Data\HS Conversion 1996 to 1992"

	drop if _merge == 2

	duplicates drop year code if country == "جمع" ,force

	save  "Gomrok Data\DTA Data\unified\unified import `i'", replace
		
}

forvalues i=1382/1388{
	use "Gomrok Data\DTA Data\import `i'" , clear
	replace code = substr(code, 1, 6)
	merge n:1 code using "Gomrok Data\DTA Data\HS02" , generate(match)

	drop if match == 2
	gen HS2002 = code if match == 3

	merge n:n HS2002 using "Gomrok Data\DTA Data\HS Conversion 2002 to 1992"

	drop if _merge == 2

	duplicates drop year code if country == "جمع" ,force

	save  "Gomrok Data\DTA Data\unified\unified import `i'", replace
		
}

forvalues i=1389/1390{
	use "Gomrok Data\DTA Data\import `i'" , clear
	replace code = substr(code, 1, 6)
	merge n:1 code using "Gomrok Data\DTA Data\HS07" , generate(match)

	drop if match == 2
	gen HS2007 = code if match == 3

	merge n:n HS2007 using "Gomrok Data\DTA Data\HS Conversion 2007 to 1992"

	drop if _merge == 2

	duplicates drop year code if country == "جمع" ,force

	save  "Gomrok Data\DTA Data\unified\unified import `i'", replace
		
}

forvalues i=1391/1395{
	use "Gomrok Data\DTA Data\import `i'" , clear
	replace code = substr(code, 1, 6)
	merge n:1 code using "Gomrok Data\DTA Data\HS12" , generate(match)

	drop if match == 2
	gen HS2012 = code if match == 3

	merge n:n HS2012 using "Gomrok Data\DTA Data\HS Conversion 2012 to 1992"

	drop if _merge == 2

	duplicates drop year code if country == "جمع" ,force

	save  "Gomrok Data\DTA Data\unified\unified import `i'", replace
		
}

forvalues i=1396/1400{
	use "Gomrok Data\DTA Data\import `i'" , clear
	replace code = substr(code, 1, 6)
	merge n:1 code using "Gomrok Data\DTA Data\HS17" , generate(match)

	drop if match == 2
	gen HS2017 = code if match == 3

	merge n:n HS2017 using "Gomrok Data\DTA Data\HS Conversion 2017 to 1992"

	drop if _merge == 2

	duplicates drop year code if country == "جمع" ,force

	save  "Gomrok Data\DTA Data\unified\unified import `i'", replace
		
}

forvalues i=1401/1402{
	use "Gomrok Data\DTA Data\import `i'" , clear
	replace code = substr(code, 1, 6)
	merge n:1 code using "Gomrok Data\DTA Data\HS22" , generate(match)

	drop if match == 2
	gen HS2022 = code if match == 3

	merge n:n HS2022 using "Gomrok Data\DTA Data\HS Conversion 2022 to 1992"

	drop if _merge == 2

	duplicates drop year code if country == "جمع" ,force

	save  "Gomrok Data\DTA Data\unified\unified import `i'", replace
		
}

* Export

forvalues i=1375/1377 {
	
	use "Gomrok Data\DTA Data\export `i'", clear
	replace code = substr(code, 1, 6)
	merge n:1 code using "Gomrok Data\DTA Data\HS92" , generate(match)

	drop if match == 2

	gen unidied_code = code if match == 3

	save "Gomrok Data\DTA Data\unified\unified export `i'", replace
	
}

forvalues i=1378/1381{
	use "Gomrok Data\DTA Data\export `i'" , clear
	replace code = substr(code, 1, 6)
	merge n:1 code using "Gomrok Data\DTA Data\HS96" , generate(match)

	drop if match == 2
	gen HS1996 = code if match == 3

	merge n:n HS1996 using "Gomrok Data\DTA Data\HS Conversion 1996 to 1992"

	drop if _merge == 2

	duplicates drop year code if country == "جمع" ,force

	save  "Gomrok Data\DTA Data\unified\unified export `i'", replace
		
}

forvalues i=1382/1388{
	use "Gomrok Data\DTA Data\export `i'" , clear
	replace code = substr(code, 1, 6)
	merge n:1 code using "Gomrok Data\DTA Data\HS02" , generate(match)

	drop if match == 2
	gen HS2002 = code if match == 3

	merge n:n HS2002 using "Gomrok Data\DTA Data\HS Conversion 2002 to 1992"

	drop if _merge == 2

	duplicates drop year code if country == "جمع" ,force

	save  "Gomrok Data\DTA Data\unified\unified export `i'", replace
		
}

forvalues i=1389/1390{
	use "Gomrok Data\DTA Data\export `i'" , clear
	replace code = substr(code, 1, 6)
	merge n:1 code using "Gomrok Data\DTA Data\HS07" , generate(match)

	drop if match == 2
	gen HS2007 = code if match == 3

	merge n:n HS2007 using "Gomrok Data\DTA Data\HS Conversion 2007 to 1992"

	drop if _merge == 2

	duplicates drop year code if country == "جمع" ,force

	save  "Gomrok Data\DTA Data\unified\unified export `i'", replace
		
}

forvalues i=1391/1393{
	use "Gomrok Data\DTA Data\export `i'" , clear
	replace code = substr(code, 1, 6)
	merge n:1 code using "Gomrok Data\DTA Data\HS12" , generate(match)

	drop if match == 2
	gen HS2012 = code if match == 3

	merge n:n HS2012 using "Gomrok Data\DTA Data\HS Conversion 2012 to 1992"

	drop if _merge == 2

	duplicates drop year code if country == "جمع" ,force

	save  "Gomrok Data\DTA Data\unified\unified export `i'", replace
		
}

use "Gomrok Data\DTA Data\export 1395" , clear
drop if year == .
replace code = substr(code, 1, 6)
merge n:1 code using "Gomrok Data\DTA Data\HS12" , generate(match)

drop if match == 2
gen HS2012 = code if match == 3

merge n:n HS2012 using "Gomrok Data\DTA Data\HS Conversion 2012 to 1992"

drop if _merge == 2

duplicates drop year code if country == "جمع" ,force

save  "Gomrok Data\DTA Data\unified\unified export 1395", replace



* For Export year 1394 (export 1394 tariff file)

use "Gomrok Data\DTA Data\export 1394 tariff" , clear

drop if year == .
replace code = substr(code, 1, 6)
merge n:1 code using "Gomrok Data\DTA Data\HS12" , generate(match)

drop if match == 2
gen HS2012 = code if match == 3

merge n:n HS2012 using "Gomrok Data\DTA Data\HS Conversion 2012 to 1992"

drop if _merge == 2

save  "Gomrok Data\DTA Data\unified\unified export 1394", replace




forvalues i=1396/1400{
	use "Gomrok Data\DTA Data\export `i'" , clear
	replace code = substr(code, 1, 6)
	merge n:1 code using "Gomrok Data\DTA Data\HS17" , generate(match)

	drop if match == 2
	gen HS2017 = code if match == 3

	merge n:n HS2017 using "Gomrok Data\DTA Data\HS Conversion 2017 to 1992"

	drop if _merge == 2

	duplicates drop year code if country == "جمع" ,force

	save  "Gomrok Data\DTA Data\unified\unified export `i'", replace
		
}


forvalues i=1401/1402{
	use "Gomrok Data\DTA Data\export `i'" , clear
	replace code = substr(code, 1, 6)
	merge n:1 code using "Gomrok Data\DTA Data\HS22" , generate(match)

	drop if match == 2
	gen HS2022 = code if match == 3

	merge n:n HS2022 using "Gomrok Data\DTA Data\HS Conversion 2022 to 1992"

	drop if _merge == 2

	duplicates drop year code if country == "جمع" ,force

	save  "Gomrok Data\DTA Data\unified\unified export `i'", replace
		
}



**# Appending All Unified Datas (Bookmark 5)

* for import 

use "Gomrok Data\DTA Data\unified\unified import 1375",clear

forvalues i=1376/1402{
	append using "Gomrok Data\DTA Data\unified\unified import `i'", force
	
}
rename Description HSDescription
rename unidied_code unified_code
replace HS1992 = unified_code if unified_code !=""

gen data_HS_code = code if match == 3

drop  HS1996 HS2002 HS2007 HS2012 HS2017 HS2022 unified_code _merge

* Convert to ISIC3
merge n:1 HS1992 using "Gomrok Data\DTA Data\HS1992 to ISIC3", nogen

gen Exp_Imp = "import"

collapse (sum) weight rial dollar (firstnm) desc ISIC3DESC HSDescription Exp_Imp data_HS_code ISIC3 Classification match, by(year country HS1992 code)

label var match "اگر برابر با یک باشد، کد فقط در داده گمرک وجود داشته"
label var Classification "کدهای گمرک مطابق با چه استانداردی بودند"
label var ISIC3 "کد چهاررقمی استاندارد ISIC3"
label var rial "ارزش ریالی تجارت"
label var dollar "ارزش دلاری  تجارت"
label var weight "وزن تجارت"
label var code "کد موجود در داده های گمرک"
label var Exp_Imp "صادرات یا واردات"
label var data_HS_code "کد بر استاندارد HS سال مورد بررسی"
label var HS1992 "کد بر اساس استاندارد  HS سال 1992"
label var desc "توضیح کدهای HS بر اساس استاندارد همان سال"
label var ISIC3DESC "توضیح انگلیسی کدهای ISIC3"
label var HSDescription "توضیح انگلیسی کدهای HS سال 1992"
label var country "نام فارسی کشورها با استانداردهای مختلف در طی زمان"
label var year "سال"

save "Gomrok Data\DTA Data\unified\Import Data unified" , replace



* for export 

use "Gomrok Data\DTA Data\unified\unified export 1375",clear

forvalues i=1376/1402{
	append using "Gomrok Data\DTA Data\unified\unified export `i'", force
	
}
rename Description HSDescription
rename unidied_code unified_code
replace HS1992 = unified_code if unified_code !=""

gen data_HS_code = code if match == 3

drop HS1996 HS2002 HS2007 HS2012 HS2017 HS2022 unified_code _merge 

* Convert to ISIC3
merge n:1 HS1992 using "Gomrok Data\DTA Data\HS1992 to ISIC3", nogen

gen Exp_Imp = "export"

collapse (sum) weight rial dollar (firstnm) desc ISIC3DESC HSDescription Exp_Imp data_HS_code ISIC3 Classification match, by(year country HS1992 code)

label var match "اگر برابر با یک باشد، کد فقط در داده گمرک وجود داشته"
label var Classification "کدهای گمرک مطابق با چه استانداردی بودند"
label var ISIC3 "کد چهاررقمی استاندارد ISIC3"
label var rial "ارزش ریالی تجارت"
label var dollar "ارزش دلاری  تجارت"
label var weight "وزن تجارت"
label var code "کد موجود در داده های گمرک"
label var Exp_Imp "صادرات یا واردات"
label var data_HS_code "کد بر استاندارد HS سال مورد بررسی"
label var HS1992 "کد بر اساس استاندارد  HS سال 1992"
label var desc "توضیح کدهای HS بر اساس استاندارد همان سال"
label var ISIC3DESC "توضیح انگلیسی کدهای ISIC3"
label var HSDescription "توضیح انگلیسی کدهای HS سال 1992"
label var country "نام فارسی کشورها با استانداردهای مختلف در طی زمان"
label var year "سال"

save "Gomrok Data\DTA Data\unified\Export Data unified" , replace



** Creating The Cleaned Data

use "Gomrok Data\DTA Data\unified\Export Data unified" , clear
append using "Gomrok Data\DTA Data\unified\Import Data unified" 

merge n:1 ISIC3 using "Gomrok Data\DTA Data\ISIC3 Description", nogen
merge n:1 country using "Gomrok Data\DTA Data\countryname", nogen

gen Exp_Imp_Per = "صادرات" if Exp_Imp == "export"
replace Exp_Imp_Per = "واردات" if Exp_Imp == "import"

label var ISICDesc "توضیح انگلیسی کدهای ISIC3"
drop ISIC3DESC
label var PersianDescription "توضیح فارسی کدهای ISIC3"
label var Shortname "توضیح کوتاه کدهای ISIC3"
label var co "نام کشورها بر اساس یک ساتاندارد انگلیسی یکسان"
label var Exp_Imp_Per "صادرات یا واردات به فارسی"

merge n:1 year using "Gomrok Data\DTA Data\Global", nogen
drop sii sii_growth

replace us_cpi = 131.2 if us_cpi == . & year == 1402 
gen us_cpi_2023 = us_cpi / 131.2
gen dollar_real_1402 = dollar / us_cpi_2023
gen dollar_nominal = dollar
replace dollar = dollar_real_1402


gen HS4 = substr(HS1992, 1, 4)
gen HS2 = substr(HS1992, 1, 2)

save "Gomrok Data\DTA Data\cleaned\cleaned data", replace



**** Creating Data for Aggregates

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

keep year weight dollar rial Exp_Imp
rename weight Total_Excel_Weight
rename rial Total_Excel_rial
rename dollar Total_Excel_dollar

gen dollar_weight = Total_Excel_dollar / Total_Excel_Weight

sort year

label var year "سال"
label var Total_Excel_Weight "جمع وزن تجارت سالانه بر اساس داده های تجمیعی گمرک"
label var Total_Excel_rial "جمع ارزش ریالی تجارت سالانه بر اساس داده های تجمیعی گمرک"
label var Total_Excel_dollar "جمع ارزش دلاری تجارت سالانه بر اساس داده های تجمیعی گمرک"
label var Exp_Imp "صادرات یا واردات"
label var dollar_weight "ارزش دلاری هر کیلوگرم تجارت بر اساس داده های تجمیعی گمرک"

save "Gomrok Data\DTA Data\cleaned\Aggregategoodstrade", replace

*** Persian Descriptions Data

use "Gomrok Data\DTA Data\HS1992 to ISIC3", clear

gen HS4 = substr(HS1992, 1, 4)
gen HS2 = substr(HS1992, 1, 2)

merge n:1 HS4 using "Gomrok Data\DTA Data\HS4 Persian", nogen

merge n:1 HS2 using "Gomrok Data\DTA Data\HS2 Persian", nogen

merge n:1 ISIC3 using "Gomrok Data\DTA Data\ISIC3 Description", nogen


keep if   (substr(ISIC3 ,1 ,2) == "01"  |  substr(ISIC3 ,1 ,2) == "02"  |  substr(ISIC3 ,1 ,2) == "05"  |  substr(ISIC3 ,1 ,2) == "15")  |  HS4 == "2501"  | HS4 == "1802" | HS4 == "0901" | HS4 == "2307" | HS4 == "2308" | HS4 == "2303" | HS4 == "2302"

// 2308 & 2303 & 2302 must be added to animal food ISIC codes
// 2307 must be added to Beverages
// 2501 must be added to Manufacturing of Food

drop if ISIC3DESC == ""

save "Gomrok Data\DTA Data\cleaned\TreeChartsData", replace



*** Treemap Data Export All Food

use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

drop if year == .

drop if year < 1375

drop if country == "جمع"

collapse (sum) dollar (firstnm) ISIC3 PersianDescription Shortname HS2 , by(year Exp_Imp HS4)

merge n:n HS4 using  "Gomrok Data\DTA Data\cleaned\TreeChartsData", nogen

drop if Persian_HS_2digit_Desc_Short == "" & PersianDescription == ""

drop if dollar == .
replace PersianDescription = "سایر" if ISIC3 == "9999"
replace Shortname = "سایر" if ISIC3 == "9999"

export excel using "Tree Charts\All Food TreeMapData.xlsx", firstrow(variables) replace

keep if substr(ISIC3, 1, 2) == "15" |  HS4 == "2501" 

export excel using "Tree Charts\Manufacture Food TreeMapData.xlsx", firstrow(variables) replace








/// Exporting Datas based on HS2 and ISIC3
use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

collapse (sum) dollar weight rial dollar_nominal , by(year Exp_Imp HS2)

drop if HS2 == ""

export excel using "Results\DataExported.xlsx", sheet("HS2", modify) firstrow(variables)


use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

collapse (sum) dollar weight rial dollar_nominal, by(year Exp_Imp ISIC3)

drop if ISIC3 == ""

export excel using "Results\DataExported.xlsx", sheet("ISIC3", modify) firstrow(variables)


use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

collapse (sum) dollar weight rial dollar_nominal, by(year Exp_Imp HS4)

drop if HS4 == ""

export excel using "Results\DataExported.xlsx", sheet("HS4", modify) firstrow(variables)







