
**# Graphs (Bookmark 6)

** Graph Macro
/*
global graph_opts ///
    title("لگاریتم هزینه سرانه حقیقی خانوار", size(medium) color(black)) ///
    xtitle("سال", size(medium) color(black)) ///
    ytitle(, size(medium) color(black)) ///
    xlabel(1384(2)1405, labsize(small) labcolor(black) angle(0)) ///
    ylabel(, labsize(small) labcolor(black)) ///
    legend(label(1 "p3-increase") label(2 "p3-decrease") label(3 "p3-unchanged") ) ///
    graphregion(color(538bs8))

  twoway (line p3increase p3decrease p3sobat year ),$graph_opts
*/



// Codes from HS 6 digit to exclude from ISIC3

/*
global HS6_Excludes "HS1992 != \"240110\"  &  HS1992 != \"350110\"  &  HS1992 != \"350210\"  &  HS1992 != \"350510\"  &  HS1992 != \"400110\"  &  HS1992 != \"440392\"  &  HS1992 != \"500100\"  &  HS1992 != \"520100\"  &  HS1992 != \"410121\"  &  HS1992 != \"410229\"  &  HS1992 != \"440110\"  &  HS1992 != \"440420\"  &  HS1992 != \"450110\"  &  HS1992 != \"530110\"  &  HS1992 != \"530310\"  &  HS1992 != \"710110\"  &  HS1992 != \"050300\"  &  HS1992 != \"050800\"  &  HS1992 != \"051191\"  &  HS1992 != \"051110\"  &  HS1992 != \"240120\"  &  HS1992 != \"400121\"  &  HS1992 != \"400122\"  &  HS1992 != \"400130\"  &  HS1992 != \"400129\"  &  HS1992 != \"410140\"  &  HS1992 != \"410110\"  &  HS1992 != \"410129\"  &  HS1992 != \"410122\"  &  HS1992 != \"410130\"  &  HS1992 != \"410221\"  &  HS1992 != \"410210\"  &  HS1992 != \"410320\"  &  HS1992 != \"410390\"  &  HS1992 != \"410310\"  &  HS1992 != \"430130\"  &  HS1992 != \"430110\"  &  HS1992 != \"430170\"  &  HS1992 != \"430180\"  &  HS1992 != \"430140\"  &  HS1992 != \"430190\"  &  HS1992 != \"430120\"  &  HS1992 != \"430150\"  &  HS1992 != \"440334\" &    HS1992 != \"440333\" &   HS1992 != \"440332\" &   HS1992 != \"440399\" &   HS1992 != \"440335\" &   HS1992 != \"440320\" &   HS1992 != \"440331\" &   HS1992 != \"440391\" &   HS1992 != \"440410\" &   HS1992 != \"510111\" &   HS1992 != \"510119\" &   HS1992 != \"510220\" &   HS1992 != \"510210\" &   HS1992 != \"530410\" &   HS1992 != \"530521\" &   HS1992 != \"530591\" &   HS1992 != \"530511\" & HS1992 != \"710121\" "
*/

// Codes from HS 4 digit to exclude from ISIC3

/*
HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"  &   HS4 != "2401"  &  HS4 != "4001"  &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103"  &   HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101"

*/


// cd

//cd "H:\RADrVesal\RA"
 
// Macro for Graphs
 
macro drop _all
global bkgrnd_c "255 255 255"

/*
global bkgrnd_c1 "255 250 250"
global bkgrnd_c2 "250 250 255"
global bkgrnd_c3 "255 255 250"

greenish "239 248 232"
redish  "254 224 218"
red	"250 114 87"
greenish "232 248 239"
brownish "255 204 129"
*/


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

 
**** Trand of Export and Import

** All Products


use "Gomrok Data\DTA Data\cleaned\Aggregategoodstrade", clear

replace Total_Excel_dollar = Total_Excel_dollar /1000000000

sort year


putexcel set "Results\Results", modify sheet("graphs", replace)
twoway (line Total_Excel_dollar year if Exp_Imp == "export",${lp0}) (line Total_Excel_dollar year if Exp_Imp == "import",${lp1}) ,xtitle(سال) ytitle(ارزش دلاری (میلیارد دلار)) title(صادرات و واردات کل کالاها, position(1)) legend(on order(1 "صادرات" 2 "واردات") rows(1) position(12) ) xlabel(1370(5)1400, labsize(small))  ylabel(, labsize(small)) name(totexp, replace)  xscale(titlegap(2)) yscale(titlegap(2)) $graph_opts
graph export "Results\graphs\totals\Total Export Over Time.png", replace
putexcel (A4) = image(Results\graphs\totals\Total Export Over Time)

*Notes

putexcel set "Results\Results", modify sheet("graphs")
putexcel A1= "این صفحه روند تجارت را نشان میدهد" , font(bold,12,black)
putexcel A3= "روند کل صادرات و واردات" 



putexcel set "Results\Results", modify sheet("graphs")
twoway (line dollar_weight year if Exp_Imp == "export",${lp0}) (line dollar_weight year if Exp_Imp == "import",${lp1}) ,xtitle(سال) ytitle(ارزش دلاری هر کیلوگرم تجارت) title(ارزش هر کیلوگرم تجارت, position(1)) legend(on order(1 "صادرات" 2 "واردات") rows(1) position(12) ) xlabel(1370(5)1400, labsize(small))  ylabel(, labsize(small)) name(totexp, replace)  xscale(titlegap(2)) yscale(titlegap(2)) $graph_opts
graph export "Results\graphs\Totals\weight dollar value of trade.png", replace
putexcel (L4) = image(Results\graphs\Totals\weight dollar value of trade) 

*Notes

putexcel set "Results\Results", modify sheet("graphs")
putexcel L3= "روند کل صادرات و واردات" 



** Broad Food

* Food Trend

use "Gomrok Data\DTA Data\cleaned\cleaned data", clear


gen food = 1 if (substr(ISIC3, 1, 2) == "01" |substr(ISIC3, 1, 2) == "05" | substr(ISIC3, 1, 2) == "15")  | ( HS4 == "2501"  | HS4 == "1802" | HS4 == "0901" | HS4 == "2307" | HS4 == "2308" | HS4 == "2303" | HS4 == "2302") & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103"  &   HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404")

gen excel_total = dollar if country == "جمع"
fillmissing excel_total , by(year Exp_Imp)

egen food_trade = sum(dollar) if food ==1 & country!="جمع" ,by(year Exp_Imp)

collapse (firstnm) excel_total food_trade, by(year Exp_Imp)

gen share_food_trade = (food_trade / excel_total) *100
replace food_trade = food_trade / 1000000000

putexcel set "Results\Results", modify sheet("graphs")
twoway (line food_trade year if Exp_Imp == "export",${lp0}) (line food_trade year if Exp_Imp == "import",${lp1}) ,xtitle(سال) ytitle(ارزش دلاری (میلیارد دلار)) title(صادرات و واردات خوراکی ها, position(1)) legend(on order(1 "صادرات" 2 "واردات") rows(1) position(12) ) xlabel(, labsize(small))  ylabel(, labsize(small)) name(totexp, replace)   xscale(titlegap(2)) yscale(titlegap(2)) $graph_opts
graph export "Results\graphs\Totals\Food Trade Over Time.png", replace
putexcel (X4) = image(Results\graphs\Totals\Food Trade Over Time) 

* Notes
putexcel set "Results\Results", modify sheet("graphs")
putexcel X3= "روند صادرات و واردات برای خوراکی ها" 


* Share of Food in Trade
putexcel set "Results\Results", modify sheet("graphs")
twoway (line share_food_trade year if Exp_Imp == "export",${lp0}) (line share_food_trade year if Exp_Imp == "import",${lp1}) ,xtitle(سال) ytitle(درصد سهم خوراکی ها در تجارت) title(سهم خوراکی ها در تجارت, position(1)) legend(on order(1 "صادرات" 2 "واردات") rows(1) position(12) ) xlabel(, labsize(small))  ylabel(, labsize(small)) name(totexp, replace)  xscale(titlegap(2)) yscale(titlegap(2)) $graph_opts
graph export "Results\graphs\Totals\Share of Food Trade Over Time.png", replace
putexcel (AI4) = image(Results\graphs\Totals\Share of Food Trade Over Time) 

* Notes

putexcel set "Results\Results", modify sheet("graphs")
putexcel AI3= "سهم خوراکی ها در تجارت"


** Food Manufacturing

* Food Trend

use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

gen food = 1 if (substr(ISIC3, 1, 2) == "15"|  HS4 == "2501") & ((ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554")  & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103"  &   HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404"))


gen excel_total = dollar if country == "جمع"
fillmissing excel_total , by(year Exp_Imp)

egen food_trade = sum(dollar) if food ==1 & country!="جمع" ,by(year Exp_Imp)
egen food_trade_weight = sum(weight) if food ==1 & country!="جمع" ,by(year Exp_Imp)

collapse (firstnm) excel_total food_trade food_trade_weight, by(year Exp_Imp)

gen food_dollar_worth  = food_trade / food_trade_weight

putexcel set "Results\Results", modify sheet("graphs")
twoway (line food_dollar_worth year if Exp_Imp == "export",${lp0}) (line food_dollar_worth year if Exp_Imp == "import",${lp1}) ,xtitle(سال) ytitle(ارزش دلاری هر کیلوگرم) title(ارزش هر کیلوگرم صادرات و واردات در صنعت خوراکی, position(1)) legend(on order(1 "صادرات" 2 "واردات") rows(1) position(12) ) xlabel(, labsize(small))  ylabel(, labsize(small)) name(totexp, replace)   xscale(titlegap(2)) yscale(titlegap(2)) $graph_opts
graph export "Results\graphs\Totals\manufacture Food Trade weight value Over Time.png", replace
putexcel (FI4) = image(Results\graphs\Totals\manufacture Food Trade weight value Over Time) 




gen share_food_trade = (food_trade / excel_total) *100
replace food_trade = food_trade / 1000000000


putexcel set "Results\Results", modify sheet("graphs")
twoway (line food_trade year if Exp_Imp == "export",${lp0}) (line food_trade year if Exp_Imp == "import",${lp1}) ,xtitle(سال) ytitle(ارزش دلاری (میلیارد دلار)) title(صادرات و واردات در صنعت خوراکی, position(1)) legend(on order(1 "صادرات" 2 "واردات") rows(1) position(12) ) xlabel(, labsize(small))  ylabel(, labsize(small)) name(totexp, replace)   xscale(titlegap(2)) yscale(titlegap(2)) $graph_opts
graph export "Results\graphs\Totals\manufacture Food Trade Over Time.png", replace
putexcel (AT4) = image(Results\graphs\Totals\manufacture Food Trade Over Time) 

* Notes
putexcel set "Results\Results", modify sheet("graphs")
putexcel AT3= "تجارت صنعت خوراکی" 


* Share of Food in Trade
putexcel set "Results\Results", modify sheet("graphs")
twoway (line share_food_trade year if Exp_Imp == "export",${lp0}) (line share_food_trade year if Exp_Imp == "import",${lp1}) ,xtitle(سال) ytitle(درصد سهم صنعت خوراکی در تجارت) title(سهم صنعت خوراکی در تجارت, position(1)) legend(on order(1 "صادرات" 2 "واردات") rows(1) position(12) ) xlabel(, labsize(small))  ylabel(, labsize(small)) name(totexp, replace)  xscale(titlegap(2)) yscale(titlegap(2)) $graph_opts
graph export "Results\graphs\Totals\Share of manufacture Food Trade Over Time.png", replace
putexcel (BE4) = image(Results\graphs\Totals\Share of manufacture Food Trade Over Time) 

* Notes

putexcel set "Results\Results", modify sheet("graphs")
putexcel BE3= "سهم تجارت صنعت خوراکی"




** Raw Food
use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

gen food = 1 if (substr(ISIC3, 1, 2) == "01" |substr(ISIC3, 1, 2) == "05") & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103"  &   HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404")

gen excel_total = dollar if country == "جمع"
fillmissing excel_total , by(year Exp_Imp)

egen food_trade = sum(dollar) if food ==1 & country!="جمع" ,by(year Exp_Imp)

collapse (firstnm) excel_total food_trade, by(year Exp_Imp)

gen share_food_trade = (food_trade / excel_total) *100
replace food_trade = food_trade / 1000000000

putexcel set "Results\Results", modify sheet("graphs")
twoway (line food_trade year if Exp_Imp == "export",${lp0}) (line food_trade year if Exp_Imp == "import",${lp1}) ,xtitle(سال) ytitle(ارزش دلاری (میلیارد دلار)) title(صادرات و واردات در خوراکی خام, position(1)) legend(on order(1 "صادرات" 2 "واردات") rows(1) position(12) ) xlabel(, labsize(small))  ylabel(, labsize(small)) name(totexp, replace)   xscale(titlegap(2)) yscale(titlegap(2)) $graph_opts
graph export "Results\graphs\Totals\raw Food Trade Over Time.png", replace
putexcel (BP4) = image(Results\graphs\Totals\raw Food Trade Over Time) 

* Notes
putexcel set "Results\Results", modify sheet("graphs")
putexcel BP3= "تجرات خوراکی خام" 


* Share of Food in Trade
putexcel set "Results\Results", modify sheet("graphs")
twoway (line share_food_trade year if Exp_Imp == "export",${lp0}) (line share_food_trade year if Exp_Imp == "import",${lp1}) ,xtitle(سال) ytitle(درصد سهم خوراکی خام در تجارت) title(سهم خوراکی های خام در تجارت, position(1)) legend(on order(1 "صادرات" 2 "واردات") rows(1) position(12) ) xlabel(, labsize(small))  ylabel(, labsize(small)) name(totexp, replace)  xscale(titlegap(2)) yscale(titlegap(2)) $graph_opts
graph export "Results\graphs\Totals\Share of raw Food Trade Over Time.png", replace
putexcel (CD4) = image(Results\graphs\Totals\Share of raw Food Trade Over Time) 

* Notes

putexcel set "Results\Results", modify sheet("graphs")
putexcel CD3= "سهم تجارت خوراکی خام"


** animal Food

use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

gen food = 1 if (substr(ISIC3, 1, 4) == "1533" | (HS1992 == "230810" |  HS4 == "2308" | HS4 == "2303" | HS4 == "2302")) & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103"  &   HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404")

gen excel_total = dollar if country == "جمع"
fillmissing excel_total , by(year Exp_Imp)

egen food_trade = sum(dollar) if food ==1 & country!="جمع" ,by(year Exp_Imp)

collapse (firstnm) excel_total food_trade, by(year Exp_Imp)

gen share_food_trade = (food_trade / excel_total) *100
replace food_trade = food_trade / 1000000000

putexcel set "Results\Results", modify sheet("graphs")
twoway (line food_trade year if Exp_Imp == "export",${lp0}) (line food_trade year if Exp_Imp == "import",${lp1}) ,xtitle(سال) ytitle(ارزش دلاری (میلیارد دلار)) title(صادرات و واردات خوراک دام, position(1)) legend(on order(1 "صادرات" 2 "واردات") rows(1) position(12) ) xlabel(, labsize(small))  ylabel(, labsize(small)) name(totexp, replace)   xscale(titlegap(2)) yscale(titlegap(2)) $graph_opts
graph export "Results\graphs\Totals\animal Food Trade Over Time.png", replace
putexcel (CO4) = image(Results\graphs\Totals\animal Food Trade Over Time) 

* Notes
putexcel set "Results\Results", modify sheet("graphs")
putexcel CO3= "تجارت خوراک دام" 

* Share of Food in Trade
putexcel set "Results\Results", modify sheet("graphs")
twoway (line share_food_trade year if Exp_Imp == "export",${lp0}) (line share_food_trade year if Exp_Imp == "import",${lp1}) ,xtitle(سال) ytitle(درصد سهم خوراک دام در تجارت) title(سهم خوراک دام در تجارت, position(1)) legend(on order(1 "صادرات" 2 "واردات") rows(1) position(12) ) xlabel(, labsize(small))  ylabel(, labsize(small)) name(totexp, replace)  xscale(titlegap(2)) yscale(titlegap(2)) $graph_opts
graph export "Results\graphs\Totals\Share of animal Food Trade Over Time.png", replace
putexcel (DA4) = image(Results\graphs\Totals\Share of animal Food Trade Over Time) 

* Notes

putexcel set "Results\Results", modify sheet("graphs")
putexcel DA3= "سهم تجارت خوراک دام"


**** Different Categories of One Graph 
* Export
use "Gomrok Data\DTA Data\cleaned\cleaned data", clear


gen raw_food = 1 if (substr(ISIC3, 1, 2) == "01" |substr(ISIC3, 1, 2) == "05") & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103"  &   HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404")

gen animal_food = 1 if (substr(ISIC3, 1, 4) == "1533" |  ( HS4 == "2308" | HS4 == "2303" | HS4 == "2302")) & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103" &  HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404")

gen manu_food = 1 if (substr(ISIC3, 1, 2) == "15"  | ( HS4 == "2501"))  & ((ISIC3 != "1533" & ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554") & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103"  &   HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404"))


gen Beverage = 1 if ISIC3 == "1552" | ISIC3 == "1553" | ISIC3 == "1554"

keep if Exp_Imp == "export"


gen excel_total = dollar if country == "جمع"
fillmissing excel_total , by(year)

drop if country == "جمع"
drop if year == .

egen raw_trade_yearly = sum(dollar) if raw_food ==1 ,by(year)
egen animal_trade_yearly = sum(dollar) if animal_food ==1 ,by(year)
egen manu_trade_yearly = sum(dollar) if manu_food ==1 ,by(year)
egen Beverage_trade_yearly = sum(dollar) if Beverage ==1 ,by(year)

collapse (firstnm) raw_trade_yearly animal_trade_yearly manu_trade_yearly Beverage_trade_yearly excel_total , by(year)

replace raw_trade_yearly = raw_trade_yearly / 1000000000
replace animal_trade_yearly = animal_trade_yearly / 1000000000
replace manu_trade_yearly = manu_trade_yearly / 1000000000
replace Beverage_trade_yearly = Beverage_trade_yearly / 1000000000

gen raw_manu_yearly = raw_trade_yearly + manu_trade_yearly
gen raw_manu_animal_yearly = raw_manu_yearly + animal_trade_yearly
gen raw_manu_animal_beverage_yearly = raw_manu_animal_yearly + Beverage_trade_yearly


label var raw_trade_yearly "مواد خوراکی خام"
label var raw_manu_yearly "صنعت خوراکی"
label var raw_manu_animal_yearly "خوراک دام"
label var raw_manu_animal_beverage_yearly "آشامیدنی ها"

putexcel set "Results\Results", modify sheet("graphs")
twoway (area raw_manu_animal_beverage_yearly year,${lp3} lwidth(0)) (area raw_manu_animal_yearly year,${lp2} lwidth(0))  (area raw_manu_yearly year,${lp1} lwidth(0)) (area raw_trade_yearly year,${lp0} lwidth(0))  , ytitle(مقدار صادرات (میلیارد دلار)) xtitle(سال) xtitle() xscale(titlegap(2)) title(صادرات بخش های مختلف مواد غذایی, position(12)) legend( rows(2) position(1))  $graph_opts
graph export "Results\graphs\Totals\Shares of Food Export.png", replace
putexcel (DL4) = image(Results\graphs\Totals\Shares of Food Export)



* Import

use "Gomrok Data\DTA Data\cleaned\cleaned data", clear


gen raw_food = 1 if (substr(ISIC3, 1, 2) == "01" |substr(ISIC3, 1, 2) == "05") & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103"  &   HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404")

gen animal_food = 1 if (substr(ISIC3, 1, 4) == "1533" |  ( HS4 == "2308" | HS4 == "2303" | HS4 == "2302")) & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103" &  HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404")

gen manu_food = 1 if (substr(ISIC3, 1, 2) == "15"  | ( HS4 == "2501"))  & ((ISIC3 != "1533" & ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554") & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103"  &   HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404"))


gen Beverage = 1 if ISIC3 == "1552" | ISIC3 == "1553" | ISIC3 == "1554"

keep if Exp_Imp == "import"

gen excel_total = dollar if country == "جمع"
fillmissing excel_total , by(year)

drop if country == "جمع"
drop if year == .

egen raw_trade_yearly = sum(dollar) if raw_food ==1 ,by(year)
egen animal_trade_yearly = sum(dollar) if animal_food ==1 ,by(year)
egen manu_trade_yearly = sum(dollar) if manu_food ==1 ,by(year)
egen Beverage_trade_yearly = sum(dollar) if Beverage ==1 ,by(year)

collapse (firstnm) raw_trade_yearly animal_trade_yearly manu_trade_yearly Beverage_trade_yearly excel_total , by(year)

replace raw_trade_yearly = raw_trade_yearly / 1000000000
replace animal_trade_yearly = animal_trade_yearly / 1000000000
replace manu_trade_yearly = manu_trade_yearly / 1000000000
replace Beverage_trade_yearly = Beverage_trade_yearly / 1000000000

gen raw_manu_yearly = raw_trade_yearly + manu_trade_yearly
gen raw_manu_animal_yearly = raw_manu_yearly + animal_trade_yearly
gen raw_manu_animal_beverage_yearly = raw_manu_animal_yearly + Beverage_trade_yearly

label var raw_trade_yearly "مواد خوراکی خام"
label var raw_manu_yearly "صنعت خوراکی"
label var raw_manu_animal_yearly "خوراک دام"
label var raw_manu_animal_beverage_yearly "آشامیدنی ها"

putexcel set "Results\Results", modify sheet("graphs")
twoway (area raw_manu_animal_beverage_yearly year,${lp3} lwidth(0)) (area raw_manu_animal_yearly year,${lp2} lwidth(0))  (area raw_manu_yearly year,${lp1} lwidth(0)) (area raw_trade_yearly year,${lp0} lwidth(0)), ytitle(مقدار واردات (میلیارد دلار)) xtitle(سال) xtitle() xscale(titlegap(2)) title(واردات بخش های مختلف مواد غذایی, position(12)) legend( rows(2) position(1)) $graph_opts
graph export "Results\graphs\Totals\Shares of Food Import.png", replace
putexcel (DX4) = image(Results\graphs\Totals\Shares of Food Import)


**** Different Categories of One Graph logarithmic
* Export

use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

gen raw_food = 1 if (substr(ISIC3, 1, 2) == "01" |substr(ISIC3, 1, 2) == "05") & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103"  &   HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404")

gen animal_food = 1 if (substr(ISIC3, 1, 4) == "1533" |  ( HS4 == "2308" | HS4 == "2303" | HS4 == "2302")) & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103" &  HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404")

gen manu_food = 1 if (substr(ISIC3, 1, 2) == "15"  | ( HS4 == "2501"))  & ((ISIC3 != "1533" & ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554") & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103"  &   HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404"))

gen Beverage = 1 if ISIC3 == "1552" | ISIC3 == "1553" | ISIC3 == "1554"

keep if Exp_Imp == "export"

gen excel_total = dollar if country == "جمع"
fillmissing excel_total , by(year)

drop if country == "جمع"
drop if year == .

egen raw_trade_yearly = sum(dollar) if raw_food ==1 ,by(year)
egen animal_trade_yearly = sum(dollar) if animal_food ==1 ,by(year)
egen manu_trade_yearly = sum(dollar) if manu_food ==1 ,by(year)
egen Beverage_trade_yearly = sum(dollar) if Beverage ==1 ,by(year)

collapse (firstnm) raw_trade_yearly animal_trade_yearly manu_trade_yearly Beverage_trade_yearly excel_total , by(year)

gen raw_manu_yearly = raw_trade_yearly + manu_trade_yearly
gen raw_manu_animal_yearly = raw_manu_yearly + animal_trade_yearly
gen raw_manu_animal_beverage_yearly = raw_manu_animal_yearly + Beverage_trade_yearly

label var raw_trade_yearly "مواد خوراکی خام"
label var raw_manu_yearly "صنعت خوراکی"
label var raw_manu_animal_yearly "خوراک دام"
label var raw_manu_animal_beverage_yearly "آشامیدنی ها"
label var manu_trade_yearly "صنعت خوراکی"
label var animal_trade_yearly "خوراک دام"
label var Beverage_trade_yearly "آشامیدنی ها"

replace raw_trade_yearly = log(raw_trade_yearly)
replace manu_trade_yearly = log(manu_trade_yearly)
replace animal_trade_yearly = log(animal_trade_yearly)
replace Beverage_trade_yearly = log(Beverage_trade_yearly)

putexcel set "Results\Results", modify sheet("graphs")
twoway (line raw_trade_yearly year,${lp3}) (line manu_trade_yearly year,${lp2})  (line animal_trade_yearly year,${lp1} ) (line Beverage_trade_yearly year,${lp0} )  , ytitle(لگاریتم صادرات (دلار)) xtitle(سال) xtitle() xscale(titlegap(2)) title(لگاریتم صادرات بخش های مختلف مواد غذایی, position(12)) legend( rows(2) position(1))  $graph_opts
graph export "Results\graphs\Totals\log Shares of Food Export.png", replace
putexcel (EN4) = image(Results\graphs\Totals\log Shares of Food Export)



* Import

use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

gen raw_food = 1 if (substr(ISIC3, 1, 2) == "01" |substr(ISIC3, 1, 2) == "05") & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103"  &   HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404")

gen animal_food = 1 if (substr(ISIC3, 1, 4) == "1533" |  ( HS4 == "2308" | HS4 == "2303" | HS4 == "2302")) & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103" &  HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404")

gen manu_food = 1 if (substr(ISIC3, 1, 2) == "15"  | ( HS4 == "2501"))  & ((ISIC3 != "1533" & ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554") & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103"  &   HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404"))

gen Beverage = 1 if ISIC3 == "1552" | ISIC3 == "1553" | ISIC3 == "1554"

keep if Exp_Imp == "import"

gen excel_total = dollar if country == "جمع"
fillmissing excel_total , by(year)

drop if country == "جمع"
drop if year == .

egen raw_trade_yearly = sum(dollar) if raw_food ==1 ,by(year)
egen animal_trade_yearly = sum(dollar) if animal_food ==1 ,by(year)
egen manu_trade_yearly = sum(dollar) if manu_food ==1 ,by(year)
egen Beverage_trade_yearly = sum(dollar) if Beverage ==1 ,by(year)

collapse (firstnm) raw_trade_yearly animal_trade_yearly manu_trade_yearly Beverage_trade_yearly excel_total , by(year)

gen raw_manu_yearly = raw_trade_yearly + manu_trade_yearly
gen raw_manu_animal_yearly = raw_manu_yearly + animal_trade_yearly
gen raw_manu_animal_beverage_yearly = raw_manu_animal_yearly + Beverage_trade_yearly


label var raw_trade_yearly "مواد خوراکی خام"
label var raw_manu_yearly "صنعت خوراکی"
label var raw_manu_animal_yearly "خوراک دام"
label var raw_manu_animal_beverage_yearly "آشامیدنی ها"
label var manu_trade_yearly "صنعت خوراکی"
label var animal_trade_yearly "خوراک دام"
label var Beverage_trade_yearly "آشامیدنی ها"


replace raw_trade_yearly = log(raw_trade_yearly)
replace manu_trade_yearly = log(manu_trade_yearly)
replace animal_trade_yearly = log(animal_trade_yearly)
replace Beverage_trade_yearly = log(Beverage_trade_yearly)

putexcel set "Results\Results", modify sheet("graphs")
twoway (line raw_trade_yearly year,${lp3}) (line manu_trade_yearly year,${lp2})  (line animal_trade_yearly year,${lp1} ) (line Beverage_trade_yearly year,${lp0} )  , ytitle(لگاریتم واردات (دلار)) xtitle(سال) xtitle() xscale(titlegap(2)) title(لگاریتم واردات بخش های مختلف مواد غذایی, position(12)) legend( rows(2) position(1))  $graph_opts
graph export "Results\graphs\Totals\log Shares of Food Import.png", replace
putexcel (FD4) = image(Results\graphs\Totals\log Shares of Food Import)





**** Bar Chart For 5 Codes in Recent Years

** ISIC3

* Export

use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

keep if Exp_Imp == "export"

merge n:1 ISIC3 using  "Gomrok Data\DTA Data\ISIC3 Description", nogen

keep if year >1397 
keep if (substr(ISIC3, 1, 2) == "15")  & (ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554")  & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103"  &   HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404")

drop if year == .

egen food_ISIC_total = sum(dollar) ,by(ISIC3)
egen ISIC_group = group(food_ISIC_total)

gen Most_Share_ISIC = 1 if ISIC_group >=10
replace Most_Share_ISIC = 0 if Most_Share_ISIC == .
 
egen Other_dollar = sum(dollar) if Most_Share_ISIC == 0 ,by(year)
egen Most_dollar = sum(dollar) if Most_Share_ISIC == 1 ,by(year ISIC3)
replace Most_dollar = Other_dollar if Most_dollar == .

keep year Most_dollar Most_Share_ISIC ISIC3 PersianDescription

replace ISIC3 = "other" if Most_Share_ISIC == 0
replace PersianDescription = "سایر بخش ها" if Most_Share_ISIC == 0
duplicates drop year ISIC3 , force

replace Most_dollar = Most_dollar / 1000000000


gen l = 1 if PersianDescription == "لبنیات"
replace l = 2 if PersianDescription == "سایر بخش ها"
replace l = 3 if PersianDescription == "فرآوری میوه و سبزیجات"
replace l = 4 if PersianDescription == "فرآوری ماهی و محصولات مرتبط"
replace l = 5 if PersianDescription == "محصولات نانوایی"
replace l = 6 if PersianDescription == "شیرینی و شکلات"

putexcel set "Results\Results", modify sheet("graphs")
graph bar (mean) Most_dollar, over(PersianDescription, sort(l) label(labsize(small))) over(year) ascategory asyvars stack ytitle(مقدار صادرات (میلیارد دلار)) title(صادرات پنج صنعت خوراکی با بیشترین سهم صادرات در سال های اخیر, size(medium)) legend(on rows(3) size(small) position(6)) bar(1, fcolor(ltblue) lwidth(none)) bar(2, fcolor(navy) lwidth(none)) bar(3, fcolor(green) lwidth(none)) bar(4, fcolor(red) lwidth(none)) bar(5, fcolor(magenta) lwidth(none)) bar(6, fcolor(orange) lwidth(none)) $graph_opts
graph export "Results\graphs\Bar\Trend of 5 ISIC food manu Codes for export.png", replace
putexcel (A40) = image(Results\graphs\Bar\Trend of 5 ISIC food manu Codes for export) 


* Notes

putexcel set "Results\Results", modify sheet("graphs")
putexcel A39= "روند پنج صنعت خوراکی با بیشترین صادرات"



*Import

use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

keep if Exp_Imp == "import"

merge n:1 ISIC3 using  "Gomrok Data\DTA Data\ISIC3 Description", nogen

keep if year >1397
keep if (substr(ISIC3, 1, 2) == "15")   & (ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554" )  & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103"  &   HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404")

drop if year == .

egen food_ISIC_total = sum(dollar) ,by(ISIC3)
egen ISIC_group = group(food_ISIC_total)

gen Most_Share_ISIC = 1 if ISIC_group >=9
replace Most_Share_ISIC = 0 if Most_Share_ISIC == .
 
egen Other_dollar = sum(dollar) if Most_Share_ISIC == 0 ,by(year)
egen Most_dollar = sum(dollar) if Most_Share_ISIC == 1 ,by(year ISIC3)
replace Most_dollar = Other_dollar if Most_dollar == .

keep year Most_dollar Most_Share_ISIC ISIC3 PersianDescription

replace ISIC3 = "other" if Most_Share_ISIC == 0
replace PersianDescription = "سایر بخش ها" if Most_Share_ISIC == 0
duplicates drop year ISIC3 , force

replace Most_dollar = Most_dollar / 1000000000

gen l = 1 if PersianDescription == "چربی و روغن حیوانی و گیاهی"
replace l = 2 if PersianDescription == "فرآوری غلات"
replace l = 3 if PersianDescription == "فرآوری گوشت و محصولات گوشتی"
replace l = 4 if PersianDescription == "سایر بخش ها"
replace l = 5 if PersianDescription == "قند و شکر"
replace l = 6 if PersianDescription == "سایر محصولات غذایی ذکر نشده"

putexcel set "Results\Results", modify sheet("graphs")
graph bar (mean) Most_dollar, over(PersianDescription, sort(l)  label(labsize(small))) over(year) ascategory asyvars stack ytitle(مقدار واردات (میلیارد دلار)) title(واردات پنج صنعت خوراکی با بیشترین سهم واردات در سال های اخیر, size(medium)) legend(on rows(3) size(small) position(6)) bar(1, fcolor(ltblue) lwidth(none)) bar(2, fcolor(navy) lwidth(none)) bar(3, fcolor(green) lwidth(none)) bar(4, fcolor(red) lwidth(none)) bar(5, fcolor(magenta) lwidth(none)) bar(6, fcolor(orange) lwidth(none)) $graph_opts
graph export "Results\graphs\Bar\Trend of 5 food manu ISIC codes for import.png", replace
putexcel (M40) = image(Results\graphs\Bar\Trend of 5 food manu ISIC codes for import) 


* Notes

putexcel set "Results\Results", modify sheet("graphs")
putexcel M39= "روند پنج صنعت خوراکی با بیشترین واردات"




*** HS2

* Export

use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

keep if Exp_Imp == "export"

merge n:1 HS2 using  "Gomrok Data\DTA Data\HS2 Persian", nogen

keep if year >1397
keep if (substr(ISIC3, 1, 2) == "15"  | ( HS4 == "2501" |  HS4 == "2308" | HS4 == "2303" | HS4 == "2302"))  & ((ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554") & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103"  &   HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404"))
drop if year == .

egen food_HS2_total = sum(dollar) ,by(HS2)
egen HS2_group = group(food_HS2_total)

gen Most_Share_HS2 = 1 if HS2_group >= 15
replace Most_Share_HS2 = 0 if Most_Share_HS2 == .
 
egen Other_dollar = sum(dollar) if Most_Share_HS2 == 0 ,by(year)
egen Most_dollar = sum(dollar) if Most_Share_HS2 == 1 ,by(year HS2)
replace Most_dollar = Other_dollar if Most_dollar == .

keep year Most_dollar Most_Share_HS2 HS2 Persian_HS_2digit_Desc Persian_HS_2digit_Desc_Short

replace HS2 = "other" if Most_Share_HS2 == 0
replace Persian_HS_2digit_Desc_Short = "سایر بخش ها" if Most_Share_HS2 == 0
duplicates drop year HS2 , force

replace Most_dollar = Most_dollar / 1000000000

gen l = 1 if Persian_HS_2digit_Desc_Short == "لبنیات، تخم پرندگان، عسل طبیعی"
replace l = 2 if Persian_HS_2digit_Desc_Short == "سایر بخش ها"
replace l = 3 if HS2 == "20"
replace l = 4 if HS2 == "19"
replace l = 5 if Persian_HS_2digit_Desc_Short == "آبزیان"
replace l = 6 if Persian_HS_2digit_Desc_Short == "قند و شکر و شیرینی"


putexcel set "Results\Results", modify sheet("graphs")
graph bar (mean) Most_dollar, over(Persian_HS_2digit_Desc_Short, sort(l)  label(labsize(small))) over(year) ascategory asyvars stack ytitle(مقدار صادرات (میلیارد دلار)) title(صادرات پنج کالای دو رقمی در صنعت خوراکی با بیشترین سهم صادرات در سال های اخیر, size(small)) legend(on rows(3) size(small) position(6)) bar(1, fcolor(ltblue) lwidth(none)) bar(2, fcolor(navy) lwidth(none)) bar(3, fcolor(green) lwidth(none)) bar(4, fcolor(red) lwidth(none)) bar(5, fcolor(magenta) lwidth(none)) bar(6, fcolor(orange) lwidth(none)) $graph_opts
graph export "Results\graphs\Bar\Trend of 5 HS2 food manu Codes for export.png", replace
putexcel (A70) = image(Results\graphs\Bar\Trend of 5 HS2 food manu Codes for export) 


* Notes

putexcel set "Results\Results", modify sheet("graphs")
putexcel A69= "روند پنج کالای دو رقمی  خوراکی با بیشترین صادرات"


*Import


use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

keep if Exp_Imp == "import"

merge n:1 HS2 using  "Gomrok Data\DTA Data\HS2 Persian", nogen

keep if year >1397
keep if (substr(ISIC3, 1, 2) == "15"  | ( HS4 == "2501" |  HS4 == "2308" | HS4 == "2303" | HS4 == "2302"))  & ((ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554") & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103"  &   HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404"))
drop if year == .

egen food_HS2_total = sum(dollar) ,by(HS2)
egen HS2_group = group(food_HS2_total)

gen Most_Share_HS2 = 1 if HS2_group >= 13
replace Most_Share_HS2 = 0 if Most_Share_HS2 == .
 
egen Other_dollar = sum(dollar) if Most_Share_HS2 == 0 ,by(year)
egen Most_dollar = sum(dollar) if Most_Share_HS2 == 1 ,by(year HS2)
replace Most_dollar = Other_dollar if Most_dollar == .

keep year Most_dollar Most_Share_HS2 HS2 Persian_HS_2digit_Desc Persian_HS_2digit_Desc_Short

replace HS2 = "other" if Most_Share_HS2 == 0
replace Persian_HS_2digit_Desc_Short = "سایر بخش ها" if Most_Share_HS2 == 0
duplicates drop year HS2 , force

replace Most_dollar = Most_dollar / 1000000000

gen l = 1 if Persian_HS_2digit_Desc_Short == "چربي و روغن حيواني و نباتي"
replace l = 2 if Persian_HS_2digit_Desc_Short == "غلات"
replace l = 3 if Persian_HS_2digit_Desc_Short == "خوراكي‌هاي آماده براي حيوانات"
replace l = 4 if Persian_HS_2digit_Desc_Short == "گوشت و احشاي خوراكي"
replace l = 5 if Persian_HS_2digit_Desc_Short == "سایر بخش ها"
replace l = 6 if Persian_HS_2digit_Desc_Short == "قند و شکر و شیرینی"

putexcel set "Results\Results", modify sheet("graphs")
graph bar (mean) Most_dollar, over(Persian_HS_2digit_Desc_Short, sort(l) label(labsize(small))) over(year) ascategory asyvars stack ytitle(مقدار واردات (میلیارد دلار)) title(واردات پنج کالای دو رقمی صنعت خوراکی با بیشترین سهم واردات در سال های اخیر, size(small)) legend(on rows(3) size(small) position(6)) bar(1, fcolor(ltblue) lwidth(none)) bar(2, fcolor(navy) lwidth(none)) bar(3, fcolor(green) lwidth(none)) bar(4, fcolor(red) lwidth(none)) bar(5, fcolor(magenta) lwidth(none)) bar(6, fcolor(orange) lwidth(none)) $graph_opts
graph export "Results\graphs\Bar\Trend of 5 food manu HS2 codes for import.png", replace
putexcel (M70) = image(Results\graphs\Bar\Trend of 5 food manu HS2 codes for import) 


* Notes

putexcel set "Results\Results", modify sheet("graphs")
putexcel M69= "روند پنج کالای دو رقمی  خوراکی با بیشترین واردات"






*** HS4

* Export

use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

keep if Exp_Imp == "export"

merge n:1 HS4 using  "Gomrok Data\DTA Data\HS4 Persian", nogen

keep if year >1397
keep if (substr(ISIC3, 1, 2) == "15"  | ( HS4 == "2501" |  HS4 == "2308" | HS4 == "2303" | HS4 == "2302"))  & ((ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554") & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103"  &   HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404"))
drop if year == .

egen food_HS4_total = sum(dollar) ,by(HS4)
egen HS4_group = group(food_HS4_total)

gen Most_Share_HS4 = 1 if HS4_group >= 89
replace Most_Share_HS4 = 0 if Most_Share_HS4 == .
 
egen Other_dollar = sum(dollar) if Most_Share_HS4 == 0 ,by(year)
egen Most_dollar = sum(dollar) if Most_Share_HS4 == 1 ,by(year HS4)
replace Most_dollar = Other_dollar if Most_dollar == .

keep year Most_dollar Most_Share_HS4 HS4 Persian_HS_4digit_Desc Persian_HS_4digit_Desc_Short

replace HS4 = "other" if Most_Share_HS4 == 0
replace Persian_HS_4digit_Desc_Short = "سایر بخش ها" if Most_Share_HS4 == 0
duplicates drop year HS4 , force

replace Most_dollar = Most_dollar / 1000000000

gen l = 1 if Persian_HS_4digit_Desc_Short == "سایر بخش ها"
replace l = 2 if Persian_HS_4digit_Desc_Short == "شیر و خامه حاوی مواد اضافه"
replace l = 3 if Persian_HS_4digit_Desc_Short == "نان، شیرینی، کیک، بیسکویت"
replace l = 4 if Persian_HS_4digit_Desc_Short == "گوجه، آماده یا کنسرو"
replace l = 5 if Persian_HS_4digit_Desc_Short == "پنیر و کشک"
replace l = 6 if Persian_HS_4digit_Desc_Short == "شیرینی های شکری بدون کاکائو"


putexcel set "Results\Results", modify sheet("graphs")
graph bar (mean) Most_dollar, over(Persian_HS_4digit_Desc_Short, sort(l)  label(labsize(small))) over(year) ascategory asyvars stack ytitle(مقدار صادرات (میلیارد دلار)) title(صادرات پنج کالای چهار رقمی صنعت خوراکی با بیشترین سهم صادرات در سال های اخیر, size(medsmall)) legend(on rows(3) size(small) position(6)) bar(1, fcolor(ltblue) lwidth(none)) bar(2, fcolor(navy) lwidth(none)) bar(3, fcolor(green) lwidth(none)) bar(4, fcolor(red) lwidth(none)) bar(5, fcolor(magenta) lwidth(none)) bar(6, fcolor(orange) lwidth(none)) $graph_opts
graph export "Results\graphs\Bar\Trend of 5 HS4 food manu Codes for export.png", replace
putexcel (A100) = image(Results\graphs\Bar\Trend of 5 HS4 food manu Codes for export) 


* Notes

putexcel set "Results\Results", modify sheet("graphs")
putexcel A99= "روند پنج کالای چهار رقمی با بیشترین صادرات"


*Import


use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

keep if Exp_Imp == "import"

merge n:1 HS4 using  "Gomrok Data\DTA Data\HS4 Persian", nogen

keep if year >1397
keep if (substr(ISIC3, 1, 2) == "15"  | ( HS4 == "2501" |  HS4 == "2308" | HS4 == "2303" | HS4 == "2302"))  & ((ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554") & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103"  &   HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404"))
drop if year == .

egen food_HS4_total = sum(dollar) ,by(HS4)
egen HS4_group = group(food_HS4_total)

gen Most_Share_HS4 = 1 if HS4_group >= 60
replace Most_Share_HS4 = 0 if Most_Share_HS4 == .
 
egen Other_dollar = sum(dollar) if Most_Share_HS4 == 0 ,by(year)
egen Most_dollar = sum(dollar) if Most_Share_HS4 == 1 ,by(year HS4)
replace Most_dollar = Other_dollar if Most_dollar == .

keep year Most_dollar Most_Share_HS4 HS4 Persian_HS_4digit_Desc Persian_HS_4digit_Desc_Short

replace HS4 = "other" if Most_Share_HS4 == 0
replace Persian_HS_4digit_Desc_Short = "سایر بخش ها" if Most_Share_HS4 == 0
duplicates drop year HS4 , force

replace Most_dollar = Most_dollar / 1000000000

gen l = 1 if Persian_HS_4digit_Desc_Short == "سایر بخش ها"
replace l = 2 if Persian_HS_4digit_Desc_Short == "برنج"
replace l = 3 if Persian_HS_4digit_Desc_Short == "روغن دانه آفتابگردان"
replace l = 4 if Persian_HS_4digit_Desc_Short == "کیک روغنی، از روغن سویا"
replace l = 5 if Persian_HS_4digit_Desc_Short == "روغن پالم"
replace l = 6 if Persian_HS_4digit_Desc_Short == "قند نیشکر یا چغندر جامد"

putexcel set "Results\Results", modify sheet("graphs")
graph bar (mean) Most_dollar, over(Persian_HS_4digit_Desc_Short, sort(l) label(labsize(small))) over(year) ascategory asyvars stack ytitle(مقدار واردات (میلیارد دلار)) title(واردات پنج کالای چهار رقمی صنعت خوراکی با بیشترین سهم واردات در سال های اخیر, size(medsmall)) legend(on rows(3) size(small) position(6)) bar(1, fcolor(ltblue) lwidth(none)) bar(2, fcolor(navy) lwidth(none)) bar(3, fcolor(green) lwidth(none)) bar(4, fcolor(red) lwidth(none)) bar(5, fcolor(magenta) lwidth(none)) bar(6, fcolor(orange) lwidth(none)) $graph_opts
graph export "Results\graphs\Bar\Trend of 5 food manu HS4 codes for import.png", replace
putexcel (M100) = image(Results\graphs\Bar\Trend of 5 food manu HS4 codes for import) 


* Notes

putexcel set "Results\Results", modify sheet("graphs")
putexcel M99= "روند پنج کالای چهار رقمی  خوراکی با بیشترین واردات"




*** HHI Index

** For HS Codes

*Goods

* for export

use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

keep if Exp_Imp == "export"
keep if year >1374

gen Khorak = 1 if ((substr(ISIC3, 1, 2) == "01" |substr(ISIC3, 1, 2) == "05" | substr(ISIC3, 1, 2) == "15")  | ( HS4 == "2501"  | HS4 == "1802" | HS4 == "0901" | HS4 == "2307" | HS4 == "2308" | HS4 == "2303" | HS4 == "2302")) & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103"  &   HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404")

gen Sanat_Khorak = 1 if (substr(ISIC3, 1, 2) == "15" | ( HS4 == "2308" | HS4 == "2303" | HS4 == "2302" | HS4 == "2501")) & (( ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554") & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103" &  HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404"))

egen country_dollar = sum(dollar) ,by(year HS1992)
egen country_khorak_dollar = sum(dollar) if Khorak == 1 ,by(year HS1992)
egen country_sanat_khorak_dollar = sum(dollar) if Sanat_Khorak == 1 ,by(year HS1992)

egen total_goods_dollar = sum(dollar) ,by(year)
egen total_khorak_dollar = sum(dollar) if Khorak == 1,by(year)
egen total_sanat_khorak_dollar = sum(dollar) if Sanat_Khorak == 1,by(year)

gen Share_Goods = country_dollar / total_goods_dollar 
gen Share_khorak = country_khorak_dollar / total_khorak_dollar 
gen Share_sanat_khorak = country_sanat_khorak_dollar / total_sanat_khorak_dollar 

gen Share_Goods_pow_2 = Share_Goods ^ 2
gen Share_khorak_pow_2 = Share_khorak ^ 2
gen Share_sanat_khorak_pow_2 = Share_sanat_khorak ^ 2

fillmissing Share_khorak_pow_2 Share_sanat_khorak_pow_2 ,by(year HS1992)

duplicates drop year HS1992 , force

egen HHI_Goods = sum(Share_Goods_pow_2) ,by(year)
egen HHI_khorak = sum(Share_khorak_pow_2) ,by(year)
egen HHI_sanat_khorak = sum(Share_sanat_khorak_pow_2) ,by(year)

sort year

putexcel set "Results\Results", modify sheet("graphs")
twoway (line HHI_Goods year if year != 1398 & year !=1399,${lp0}) (line HHI_khorak year,${lp1}) (line HHI_sanat_khorak year,${lp2}), xtitle(سال) xtitle() xscale(titlegap(2)) ytitle(شاخص) yscale(titlegap(2)) title(شاخص هرفیندال کالاها برای صادرات, position(12)) legend(order(1 "کل کالاها" 2 "خوراکی ها" 3 "صنعت خوراکی") rows(1) position(1)) $graph_opts
graph export "Results\graphs\HHI\export HHI HS6.png", replace
putexcel (A130) = image(Results\graphs\HHI\export HHI HS6) 


* Notes

putexcel set "Results\Results", modify sheet("graphs")
putexcel A129= "شاخص hhi بر حسب دسته بندی کالاهای HS 6 رقمی برای صادرات"


* for import

use "Gomrok Data\DTA Data\cleaned\cleaned data", clear


keep if Exp_Imp == "import"
keep if year >1374

gen Khorak = 1 if ((substr(ISIC3, 1, 2) == "01" |substr(ISIC3, 1, 2) == "05" | substr(ISIC3, 1, 2) == "15")  | ( HS4 == "2501"  | HS4 == "1802" | HS4 == "0901" | HS4 == "2307" | HS4 == "2308" | HS4 == "2303" | HS4 == "2302")) & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103"  &   HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404")

gen Sanat_Khorak = 1 if (substr(ISIC3, 1, 2) == "15" | ( HS4 == "2308" | HS4 == "2303" | HS4 == "2302" | HS4 == "2501")) & (( ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554") & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103" &  HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404"))

egen country_dollar = sum(dollar) ,by(year HS1992)
egen country_khorak_dollar = sum(dollar) if Khorak == 1 ,by(year HS1992)
egen country_sanat_khorak_dollar = sum(dollar) if Sanat_Khorak == 1 ,by(year HS1992)

egen total_goods_dollar = sum(dollar) ,by(year)
egen total_khorak_dollar = sum(dollar) if Khorak == 1,by(year)
egen total_sanat_khorak_dollar = sum(dollar) if Sanat_Khorak == 1,by(year)

gen Share_Goods = country_dollar / total_goods_dollar 
gen Share_khorak = country_khorak_dollar / total_khorak_dollar 
gen Share_sanat_khorak = country_sanat_khorak_dollar / total_sanat_khorak_dollar 

gen Share_Goods_pow_2 = Share_Goods ^ 2
gen Share_khorak_pow_2 = Share_khorak ^ 2
gen Share_sanat_khorak_pow_2 = Share_sanat_khorak ^ 2

fillmissing Share_khorak_pow_2 Share_sanat_khorak_pow_2 ,by(year HS1992)

duplicates drop year HS1992 , force

egen HHI_Goods = sum(Share_Goods_pow_2) ,by(year)
egen HHI_khorak = sum(Share_khorak_pow_2) ,by(year)
egen HHI_sanat_khorak = sum(Share_sanat_khorak_pow_2) ,by(year)

sort year 

putexcel set "Results\Results", modify sheet("graphs")
twoway (line HHI_Goods year,${lp0}) (line HHI_khorak year,${lp1}) (line HHI_sanat_khorak year,${lp2}), xtitle(سال) xtitle() xscale(titlegap(2)) title(شاخص هرفیندال کالاها برای واردات, position(12)) legend(order(1 "کل کالاها" 2 "خوراکی ها" 3 "صنعت خوراکی")  rows(1) position(1)) ytitle(شاخص) yscale(titlegap(2)) $graph_opts
graph export "Results\graphs\HHI\import HHI HS6.png", replace
putexcel (M130) = image(Results\graphs\HHI\import HHI HS6) 


* Notes

putexcel set "Results\Results", modify sheet("graphs")
putexcel M129= "شاخص hhi بر حسب دسته بندی کالاهای HS 6 رقمی برای واردات"



** Industry

* export

use "Gomrok Data\DTA Data\cleaned\cleaned data", clear


keep if Exp_Imp == "export"
keep if year >1374
drop if year == .

collapse (sum) dollar  , by(year ISIC3) 

gen Khorak = 1 if (substr(ISIC3, 1, 2) == "01" |substr(ISIC3, 1, 2) == "05" | substr(ISIC3, 1, 2) == "15")

gen Sanat_Khorak = 1 if substr(ISIC3, 1, 2) == "15"  & ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554" 

egen total_goods_dollar = sum(dollar) ,by(year)
egen total_khorak_dollar = sum(dollar) if Khorak == 1,by(year)
egen total_sanat_khorak_dollar = sum(dollar) if Sanat_Khorak == 1,by(year)

gen Share_Goods = dollar / total_goods_dollar 
gen Share_khorak = dollar / total_khorak_dollar 
gen Share_sanat_khorak = dollar / total_sanat_khorak_dollar 

gen Share_Goods_pow_2 = Share_Goods ^ 2
gen Share_khorak_pow_2 = Share_khorak ^ 2
gen Share_sanat_khorak_pow_2 = Share_sanat_khorak ^ 2

egen HHI_Goods = sum(Share_Goods_pow_2) ,by(year)
egen HHI_khorak = sum(Share_khorak_pow_2) ,by(year)
egen HHI_sanat_khorak = sum(Share_sanat_khorak_pow_2) ,by(year)

sort year

putexcel set "Results\Results", modify sheet("graphs")
twoway (line HHI_Goods year if year != 1398 & year !=1399,${lp0}) (line HHI_khorak year,${lp1}) (line HHI_sanat_khorak year,${lp2}), xtitle(سال) xtitle() xscale(titlegap(2)) title(شاخص هرفیندال صنایع برای صادرات, position(12)) legend(order(1 "کل کالاها" 2 "خوراکی ها" 3 "صنعت خوراکی") rows(1) position(1)) ytitle(شاخص) yscale(titlegap(2)) $graph_opts
graph export "Results\graphs\HHI\export HHI ISIC.png", replace
putexcel (A160) = image(Results\graphs\HHI\export HHI ISIC) 


* Notes

putexcel set "Results\Results", modify sheet("graphs")
putexcel A159= "شاخص hhi بر حسب دسته بندی کالاهای ISIC3 چهاررقمی برای صادرات"



* Import 

use "Gomrok Data\DTA Data\cleaned\cleaned data", clear


keep if Exp_Imp == "import"
keep if year >1374
drop if year == .

collapse (sum) dollar  , by(year ISIC3) 

gen Khorak = 1 if (substr(ISIC3, 1, 2) == "01" |substr(ISIC3, 1, 2) == "05" | substr(ISIC3, 1, 2) == "15") 

gen Sanat_Khorak = 1 if substr(ISIC3, 1, 2) == "15"  & ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554" 

egen total_goods_dollar = sum(dollar) ,by(year)
egen total_khorak_dollar = sum(dollar) if Khorak == 1,by(year)
egen total_sanat_khorak_dollar = sum(dollar) if Sanat_Khorak == 1,by(year)

gen Share_Goods = dollar / total_goods_dollar 
gen Share_khorak = dollar / total_khorak_dollar 
gen Share_sanat_khorak = dollar / total_sanat_khorak_dollar 

gen Share_Goods_pow_2 = Share_Goods ^ 2
gen Share_khorak_pow_2 = Share_khorak ^ 2
gen Share_sanat_khorak_pow_2 = Share_sanat_khorak ^ 2

egen HHI_Goods = sum(Share_Goods_pow_2) ,by(year)
egen HHI_khorak = sum(Share_khorak_pow_2) ,by(year)
egen HHI_sanat_khorak = sum(Share_sanat_khorak_pow_2) ,by(year)

sort year 

putexcel set "Results\Results", modify sheet("graphs")
twoway (line HHI_Goods year,${lp0} ) (line HHI_khorak year,${lp1}) (line HHI_sanat_khorak year,${lp2}), xtitle(سال) xtitle() xscale(titlegap(2)) title(شاخص هرفیندال صنایع برای واردات, position(12)) legend(order(1 "کل کالاها" 2 "خوراکی ها" 3 "صنعت خوراکی") rows(1) position(1)) ytitle(شاخص) yscale(titlegap(2)) $graph_opts
graph export "Results\graphs\HHI\import HHI ISIC.png", replace
putexcel (M160) = image(Results\graphs\HHI\import HHI ISIC) 


* Notes

putexcel set "Results\Results", modify sheet("graphs")
putexcel M159= "شاخص hhi بر حسب دسته بندی کالاهای ISIC3 چهاررقمی برای واردات"





** Conutry

* export

use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

keep if Exp_Imp == "export"
keep if year >1374
drop if year == .
drop if year == 1394
append using "Gomrok Data\DTA Data\export 1394 country"
//collapse (sum) dollar  , by(year country) 

gen Khorak = 1 if ((substr(ISIC3, 1, 2) == "01" |substr(ISIC3, 1, 2) == "05" | substr(ISIC3, 1, 2) == "15")  | ( HS4 == "2501"  | HS4 == "1802" | HS4 == "0901" | HS4 == "2307" | HS4 == "2308" | HS4 == "2303" | HS4 == "2302")) & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103"  &   HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404")

gen Sanat_Khorak = 1 if (substr(ISIC3, 1, 2) == "15" | ( HS4 == "2308" | HS4 == "2303" | HS4 == "2302" | HS4 == "2501")) & (( ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554") & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103" &  HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404"))

egen country_dollar = sum(dollar) ,by(year country)
egen country_khorak_dollar = sum(dollar) if Khorak == 1 ,by(year country)
egen country_sanat_khorak_dollar = sum(dollar) if Sanat_Khorak == 1 ,by(year country)

egen total_goods_dollar = sum(dollar) ,by(year)
egen total_khorak_dollar = sum(dollar) if Khorak == 1,by(year)
egen total_sanat_khorak_dollar = sum(dollar) if Sanat_Khorak == 1,by(year)

gen Share_Goods = country_dollar / total_goods_dollar 
gen Share_khorak = country_khorak_dollar / total_khorak_dollar 
gen Share_sanat_khorak = country_sanat_khorak_dollar / total_sanat_khorak_dollar 

gen Share_Goods_pow_2 = Share_Goods ^ 2
gen Share_khorak_pow_2 = Share_khorak ^ 2
gen Share_sanat_khorak_pow_2 = Share_sanat_khorak ^ 2

fillmissing Share_khorak_pow_2 Share_sanat_khorak_pow_2 ,by(year country)

duplicates drop year country , force

egen HHI_Goods = sum(Share_Goods_pow_2) ,by(year)
egen HHI_khorak = sum(Share_khorak_pow_2) ,by(year)
egen HHI_sanat_khorak = sum(Share_sanat_khorak_pow_2) ,by(year)

replace HHI_khorak = . if year == 1394
replace HHI_sanat_khorak = . if year == 1394

sort year

putexcel set "Results\Results", modify sheet("graphs")
twoway (line HHI_Goods year if year!=1398 & year != 1399,${lp0}) (line HHI_khorak year,${lp1}) (line HHI_sanat_khorak year,${lp2}), xtitle(سال) xtitle() xscale(titlegap(2)) title(شاخص هرفیندال صادرات بر حسب دسته بندی کشورها, position(12) size(medium)) legend(order(1 "کل کالاها" 2 "خوراکی ها" 3 "صنعت خوراکی") rows(1) position(1)) ytitle(شاخص, size(medium)) yscale(titlegap(2)) $graph_opts
graph export "Results\graphs\HHI\export HHI country.png", replace
putexcel (A190) = image(Results\graphs\HHI\export HHI country) 


* Notes

putexcel set "Results\Results", modify sheet("graphs")
putexcel A189= "شاخص hhi بر حسب دسته بندی کشورها برای صادرات"


* Import 

use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

keep if Exp_Imp == "import"
keep if year >1374
drop if year == .

//collapse (sum) dollar  , by(year country) 

gen Khorak = 1 if ((substr(ISIC3, 1, 2) == "01" |substr(ISIC3, 1, 2) == "05" | substr(ISIC3, 1, 2) == "15")  | ( HS4 == "2501"  | HS4 == "1802" | HS4 == "0901" | HS4 == "2307" | HS4 == "2308" | HS4 == "2303" | HS4 == "2302")) & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103"  &   HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404")

gen Sanat_Khorak = 1 if (substr(ISIC3, 1, 2) == "15" | ( HS4 == "2308" | HS4 == "2303" | HS4 == "2302" | HS4 == "2501")) & (( ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554") & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103" &  HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404"))

egen country_dollar = sum(dollar) ,by(year country)
egen country_khorak_dollar = sum(dollar) if Khorak == 1 ,by(year country)
egen country_sanat_khorak_dollar = sum(dollar) if Sanat_Khorak == 1 ,by(year country)

egen total_goods_dollar = sum(dollar) ,by(year)
egen total_khorak_dollar = sum(dollar) if Khorak == 1,by(year)
egen total_sanat_khorak_dollar = sum(dollar) if Sanat_Khorak == 1,by(year)

gen Share_Goods = country_dollar / total_goods_dollar 
gen Share_khorak = country_khorak_dollar / total_khorak_dollar 
gen Share_sanat_khorak = country_sanat_khorak_dollar / total_sanat_khorak_dollar 

gen Share_Goods_pow_2 = Share_Goods ^ 2
gen Share_khorak_pow_2 = Share_khorak ^ 2
gen Share_sanat_khorak_pow_2 = Share_sanat_khorak ^ 2

fillmissing Share_khorak_pow_2 Share_sanat_khorak_pow_2 ,by(year country)

duplicates drop year country , force

egen HHI_Goods = sum(Share_Goods_pow_2) ,by(year)
egen HHI_khorak = sum(Share_khorak_pow_2) ,by(year)
egen HHI_sanat_khorak = sum(Share_sanat_khorak_pow_2) ,by(year)

sort year

putexcel set "Results\Results", modify sheet("graphs")
twoway (line HHI_Goods year,${lp0}) (line HHI_khorak year,${lp1}) (line HHI_sanat_khorak year,${lp2}), xtitle(سال) xtitle() xscale(titlegap(2)) title(شاخص هرفیندال واردات بر حسب دسته بندی کشورها, position(12) size(medium)) legend(order(1 "کل کالاها" 2 "خوراکی ها" 3 "صنعت خوراکی") rows(1) position(1)) ytitle(شاخص, size(medium)) yscale(titlegap(2)) $graph_opts 
graph export "Results\graphs\HHI\import HHI country.png", replace
putexcel (M190) = image(Results\graphs\HHI\import HHI country) 


* Notes

putexcel set "Results\Results", modify sheet("graphs")
putexcel M189= "شاخص hhi بر حسب دسته بندی کشورها برای واردات"




**** Bar Chart for 3 year periods

*** ISIC3

* Export

use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

merge n:1 country using "Gomrok Data\DTA Data\countryname", nogen
merge n:1 ISIC3 using "Gomrok Data\DTA Data\ISIC3 Description",nogen

drop if year ==.
drop if ISIC3 == ""

keep if Exp_Imp == "export"
keep if substr(ISIC3, 1, 2) == "15" 
keep if (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103" &  HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404")

collapse (sum) dollar (firstnm) PersianDescription Shortname  ,by(year ISIC3)

egen trade_sum_0002 = mean(dollar) if year>1399 , by(ISIC3)

keep if ISIC3 == "1520" | ISIC3 == "1513" | ISIC3 == "1512" | ISIC3 == "1541" | ISIC3 == "1543" 

egen trade_sum_9496 = mean(dollar) if year >= 1394 & year <= 1396 , by(ISIC3)
egen trade_sum_8991 = mean(dollar) if year >= 1389 & year <= 1391 , by(ISIC3)

drop if trade_sum_0002 == . & trade_sum_9496 == . & trade_sum_8991 == .

fillmissing trade_sum_0002 trade_sum_9496  trade_sum_8991

gen diff_0002_9496 = trade_sum_0002 - trade_sum_9496
gen diff_9496_8991 = trade_sum_9496 - trade_sum_8991

replace diff_0002_9496 = diff_0002_9496 / 1000000
replace diff_9496_8991 = diff_9496_8991 / 1000000

putexcel set "Results\Results", modify sheet("graphs")
graph hbar (mean) diff_0002_9496, over(PersianDescription, sort(other_sum) descending label(labsize(small))) stack ytitle(تغییرات صادرات صنایع خوراکی منتخب (میلیون دلار), size(small)) title(تغییرات صادرات میانگین سه ساله 1400-1402 نسبت به 1394-1396 کد صنایع, size(medsmall) pos(12)) legend(off) yscale(titlegap(2.5)) $graph_opts
graph export "Results\graphs\Bar\export 3year ISIC3 mean 0002 9496.png", replace
putexcel (A220) = image(Results\graphs\Bar\export 3year ISIC3 mean 0002 9496) 


putexcel set "Results\Results", modify sheet("graphs")
graph hbar (mean) diff_9496_8991, over(PersianDescription, sort(other_sum) descending label( labsize(small)) ) stack ytitle(تغییرات صادرات صنایع خوراکی منتخب (میلیون دلار), size(small)) title(تغییرات صادرات میانگین سه ساله 1394-1396 نسبت به 1389-1391 کد صنایع, size(medsmall) pos(12)) legend(off) yscale(titlegap(2.5)) $graph_opts
graph export "Results\graphs\Bar\export 3year ISIC3 mean 9496 8991.png", replace
putexcel (M220) = image(Results\graphs\Bar\export 3year ISIC3 mean 9496 8991) 



* Import 
use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

merge n:1 country using "Gomrok Data\DTA Data\countryname", nogen
merge n:1 ISIC3 using "Gomrok Data\DTA Data\ISIC3 Description",nogen

drop if year ==.
drop if ISIC3 == ""

keep if Exp_Imp == "import"
keep if substr(ISIC3, 1, 2) == "15" 
keep if (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103" &  HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404")

collapse (sum) dollar (firstnm) PersianDescription Shortname  ,by(year ISIC3)

egen trade_sum_0002 = mean(dollar) if year>1399 , by(ISIC3)

keep if ISIC3 == "1514" | ISIC3 == "1531" | ISIC3 == "1542" | ISIC3 == "1511" | ISIC3 == "1549" 

egen trade_sum_9496 = mean(dollar) if year >= 1394 & year <= 1396 , by(ISIC3)
egen trade_sum_8991 = mean(dollar) if year >= 1389 & year <= 1391 , by(ISIC3)

drop if trade_sum_0002 == . & trade_sum_9496 == . & trade_sum_8991 == .

fillmissing trade_sum_0002 trade_sum_9496  trade_sum_8991

gen diff_0002_9496 = trade_sum_0002 - trade_sum_9496
gen diff_9496_8991 = trade_sum_9496 - trade_sum_8991

replace diff_0002_9496 = diff_0002_9496 / 1000000
replace diff_9496_8991 = diff_9496_8991 / 1000000

putexcel set "Results\Results", modify sheet("graphs")
graph hbar (mean) diff_0002_9496, over(PersianDescription, sort(other_sum) descending label( labsize(small)) ) stack ytitle(تغییرات واردات صنایع خوراکی منتخب (میلیون دلار), size(small)) title(تغییرات واردات میانگین سه ساله 1400-1402 نسبت به 1394-1396 کد صنایع, size(medsmall) pos(12)) legend(off) yscale(titlegap(2.5)) $graph_opts
graph export "Results\graphs\Bar\import 3year ISIC3 mean 0002 9496.png", replace
putexcel (A250) = image(Results\graphs\Bar\import 3year ISIC3 mean 0002 9496) 


putexcel set "Results\Results", modify sheet("graphs")
graph hbar (mean) diff_9496_8991, over(PersianDescription, sort(other_sum) descending label( labsize(small)) ) stack ytitle(تغییرات واردات صنایع خوراکی منتخب (میلیون دلار), size(small)) title(تغییرات واردات میانگین سه ساله 1394-1396 نسبت به 1389-1391 کد صنایع, size(medsmall) pos(12)) legend(off) yscale(titlegap(2.5)) $graph_opts
graph export "Results\graphs\Bar\import 3year ISIC3 mean 9496 8991.png", replace
putexcel (M250) = image(Results\graphs\Bar\import 3year ISIC3 mean 9496 8991) 





*** HS2

* Export

use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

merge n:1 country using "Gomrok Data\DTA Data\countryname", nogen
merge n:1 HS2 using "Gomrok Data\DTA Data\HS2 Persian",nogen

drop if year ==.
drop if ISIC3 == ""

keep if Exp_Imp == "export"
keep if (substr(ISIC3, 1, 2) == "15" | ( HS4 == "2308" | HS4 == "2303" | HS4 == "2302" | HS4 == "2501")) & ( (ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554") & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103" &  HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404" & HS2 != "41"))

collapse (sum) dollar (firstnm) Persian_HS_2digit_Desc Persian_HS_2digit_Desc_Short  ,by(year HS2)

egen trade_sum_0002 = mean(dollar) if year>1399 , by(HS2)


// HS2 Codes that are not considered food but a food code from ISIC3 is associated to them :25

keep if HS2 == "17" | HS2 == "03" | HS2 == "19" | HS2 == "20" | HS2 == "04" 

egen trade_sum_9496 = mean(dollar) if year >= 1394 & year <= 1396 , by(HS2)
egen trade_sum_8991 = mean(dollar) if year >= 1389 & year <= 1391 , by(HS2)

drop if trade_sum_0002 == . & trade_sum_9496 == . & trade_sum_8991 == .

fillmissing trade_sum_0002 trade_sum_9496  trade_sum_8991

gen diff_0002_9496 = trade_sum_0002 - trade_sum_9496
gen diff_9496_8991 = trade_sum_9496 - trade_sum_8991

replace diff_0002_9496 = diff_0002_9496 / 1000000
replace diff_9496_8991 = diff_9496_8991 / 1000000




putexcel set "Results\Results", modify sheet("graphs")
graph hbar (mean) diff_0002_9496, over(Persian_HS_2digit_Desc_Short, sort(trade_sum_0002) descending label(labsize(small)) ) stack ytitle(تغییرات صادرات صنایع خوراکی منتخب(میلیون دلار), size(small)) title(تغییرات صادرات میانگین سه ساله 1400-1402 به 1394-1396 کد دو رقمی, size(medsmall) pos(12)) legend(off) yscale(titlegap(2.5))  $graph_opts
graph export "Results\graphs\Bar\export 3year HS2 mean 0002 9496.png", replace
putexcel (A280) = image(Results\graphs\Bar\export 3year HS2 mean 0002 9496) 


putexcel set "Results\Results", modify sheet("graphs")
graph hbar (mean) diff_9496_8991, over(Persian_HS_2digit_Desc_Short, sort(trade_sum_0002) descending label( labsize(small)) ) stack ytitle(تغییرات صادرات صنایع خوراکی منتخب (میلیون دلار), size(small)) title(تغییرات صادرات میانگین سه ساله 1394-1396 به 1389-1391 کد دو رقمی, size(medsmall) pos(12)) legend(off) yscale(titlegap(2.5))  $graph_opts
graph export "Results\graphs\Bar\export 3year HS2 mean 9496 8991.png", replace
putexcel (M280) = image(Results\graphs\Bar\export 3year HS2 mean 9496 8991) 



* Import 
use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

merge n:1 country using "Gomrok Data\DTA Data\countryname", nogen
merge n:1 HS2 using "Gomrok Data\DTA Data\HS2 Persian",nogen

drop if year ==.
drop if ISIC3 == ""

keep if Exp_Imp == "import"
keep if (substr(ISIC3, 1, 2) == "15" | ( HS4 == "2308" | HS4 == "2303" | HS4 == "2302" | HS4 == "2501")) & ( (ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554") & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103" &  HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404" & HS2 != "41"))

collapse (sum) dollar (firstnm) Persian_HS_2digit_Desc Persian_HS_2digit_Desc_Short  ,by(year HS2)

egen trade_sum_0002 = mean(dollar) if year>1399 , by(HS2)


// HS2 Codes that are not considered food but a food code from ISIC3 is associated to them :25

keep if HS2 == "02" | HS2 == "17" | HS2 == "23" | HS2 == "10" | HS2 == "15" 

egen trade_sum_9496 = mean(dollar) if year >= 1394 & year <= 1396 , by(HS2)
egen trade_sum_8991 = mean(dollar) if year >= 1389 & year <= 1391 , by(HS2)

drop if trade_sum_0002 == . & trade_sum_9496 == . & trade_sum_8991 == .
fillmissing trade_sum_0002 trade_sum_9496  trade_sum_8991

gen diff_0002_9496 = trade_sum_0002 - trade_sum_9496
gen diff_9496_8991 = trade_sum_9496 - trade_sum_8991

replace diff_0002_9496 = diff_0002_9496 / 1000000
replace diff_9496_8991 = diff_9496_8991 / 1000000

putexcel set "Results\Results", modify sheet("graphs")
graph hbar (mean) diff_0002_9496, over(Persian_HS_2digit_Desc_Short, sort(trade_sum_0002) descending label( labsize(small)) ) stack ytitle(تغییرات واردات صنایع خوراکی منتخب (میلیون دلار), size(small)) title(تغییرات واردات میانگین سه ساله 1400-1402 به 1394-1396 کد دو رقمی, size(medsmall) pos(12)) legend(off) yscale(titlegap(2.5))  $graph_opts
graph export "Results\graphs\Bar\import 3year HS2 mean 0002 9496.png", replace
putexcel (A320) = image(Results\graphs\Bar\import 3year HS2 mean 0002 9496) 


putexcel set "Results\Results", modify sheet("graphs")
graph hbar (mean) diff_9496_8991, over(Persian_HS_2digit_Desc_Short, sort(trade_sum_0002) descending label( labsize(small)) ) stack ytitle(تغییرات واردات صنایع خوراکی منتخب (میلیون دلار), size(small)) title(تغییرات واردات میانگین سه ساله 1394-1396 به 1389-1391 کد دو رقمی, size(medsmall) pos(12)) legend(off) yscale(titlegap(2.5))  $graph_opts
graph export "Results\graphs\Bar\import 3year HS2 mean 9496 8991.png", replace
putexcel (M320) = image(Results\graphs\Bar\import 3year HS2 mean 9496 8991) 





*** HS4

* Export

use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

merge n:1 country using "Gomrok Data\DTA Data\countryname", nogen
merge n:1 HS4 using "Gomrok Data\DTA Data\HS4 Persian",nogen

drop if year ==.
drop if ISIC3 == ""

keep if Exp_Imp == "export"
keep if (substr(ISIC3, 1, 2) == "15" | ( HS4 == "2308" | HS4 == "2303" | HS4 == "2302" | HS4 == "2501")) & ( (ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554") & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103" &  HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404" & HS2 != "41"))

collapse (sum) dollar (firstnm) Persian_HS_4digit_Desc Persian_HS_4digit_Desc_Short  ,by(year HS4)

egen trade_sum_0002 = mean(dollar) if year>1399 , by(HS4)


// HS2 Codes that are not considered food but a food code from ISIC3 is associated to them :25

keep if HS4 == "0303" | HS4 == "1902" | HS4 == "2009" | HS4 == "2002" | HS4 == "0306" | HS4 == "0401" | HS4 == "1704" | HS4 == "0406" | HS4 == "1905" | HS4 == "0402" 

egen trade_sum_9496 = mean(dollar) if year >= 1394 & year <= 1396 , by(HS4)
egen trade_sum_8991 = mean(dollar) if year >= 1389 & year <= 1391 , by(HS4)

drop if trade_sum_0002 == . & trade_sum_9496 == . & trade_sum_8991 == .

fillmissing trade_sum_0002 trade_sum_9496  trade_sum_8991

gen diff_0002_9496 = trade_sum_0002 - trade_sum_9496
gen diff_9496_8991 = trade_sum_9496 - trade_sum_8991

replace diff_0002_9496 = diff_0002_9496 / 1000000
replace diff_9496_8991 = diff_9496_8991 / 1000000


putexcel set "Results\Results", modify sheet("graphs")
graph hbar (mean) diff_0002_9496, over(Persian_HS_4digit_Desc_Short, sort(trade_sum_0002) descending label(labsize(small)) ) stack ytitle(تغییرات صادرات صنایع خوراکی منتخب(میلیون دلار), size(small)) title(تغییرات صادرات میانگین سه ساله 1400-1402 به 1394-1396 کد چهار رقمی, size(medsmall) pos(12)) legend(off) yscale(titlegap(2.5))  $graph_opts
graph export "Results\graphs\Bar\export 3year HS4 mean 0002 9496.png", replace
putexcel (A350) = image(Results\graphs\Bar\export 3year HS4 mean 0002 9496) 


putexcel set "Results\Results", modify sheet("graphs")
graph hbar (mean) diff_9496_8991, over(Persian_HS_4digit_Desc_Short, sort(trade_sum_0002) descending label( labsize(small)) ) stack ytitle(تغییرات صادرات صنایع خوراکی منتخب (میلیون دلار), size(small)) title(تغییرات صادرات میانگین سه ساله 1394-1396 به 1389-1391 کد چهار رقمی, size(medsmall) pos(12)) legend(off)  yscale(titlegap(2.5)) $graph_opts
graph export "Results\graphs\Bar\export 3year HS4 mean 9496 8991.png", replace
putexcel (M350) = image(Results\graphs\Bar\export 3year HS4 mean 9496 8991) 



* Import 
use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

merge n:1 country using "Gomrok Data\DTA Data\countryname", nogen
merge n:1 HS4 using "Gomrok Data\DTA Data\HS4 Persian",nogen

drop if year ==.
drop if ISIC3 == ""

keep if Exp_Imp == "import"
keep if (substr(ISIC3, 1, 2) == "15" | ( HS4 == "2308" | HS4 == "2303" | HS4 == "2302" | HS4 == "2501")) & ((ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554") & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103" &  HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404" & HS2 != "41"))

collapse (sum) dollar (firstnm) Persian_HS_4digit_Desc Persian_HS_4digit_Desc_Short  ,by(year HS4)

egen trade_sum_0002 = mean(dollar) if year>1399 , by(HS4)


// HS2 Codes that are not considered food but a food code from ISIC3 is associated to them :25

keep if HS4 == "0204" | HS4 == "0207" | HS4 == "2106" |  HS4 == "0202" | HS4 == "1507" | HS4 == "1701" | HS4 == "1511" | HS4 == "2304" | HS4 == "1512" | HS4 == "1006" 

egen trade_sum_9496 = mean(dollar) if year >= 1394 & year <= 1396 , by(HS4)
egen trade_sum_8991 = mean(dollar) if year >= 1389 & year <= 1391 , by(HS4)


drop if trade_sum_0002 == . & trade_sum_9496 == . & trade_sum_8991 == .
fillmissing trade_sum_0002 trade_sum_9496  trade_sum_8991

gen diff_0002_9496 = trade_sum_0002 - trade_sum_9496
gen diff_9496_8991 = trade_sum_9496 - trade_sum_8991

replace diff_0002_9496 = diff_0002_9496 / 1000000
replace diff_9496_8991 = diff_9496_8991 / 1000000

putexcel set "Results\Results", modify sheet("graphs")
graph hbar (mean) diff_0002_9496, over(Persian_HS_4digit_Desc_Short, sort(trade_sum_0002) descending label( labsize(small)) ) stack ytitle(تغییرات واردات صنایع خوراکی منتخب (میلیون دلار), size(small)) title(تغییرات واردات میانگین سه ساله 1400-1402 به 1394-1396 کد چهار رقمی, size(medsmall) pos(12)) legend(off) yscale(titlegap(2.5))  $graph_opts
graph export "Results\graphs\Bar\import 3year HS4 mean 0002 9496.png", replace
putexcel (A380) = image(Results\graphs\Bar\import 3year HS4 mean 0002 9496) 


putexcel set "Results\Results", modify sheet("graphs")
graph hbar (mean) diff_9496_8991, over(Persian_HS_4digit_Desc_Short, sort(trade_sum_0002) descending label( labsize(small)) ) stack ytitle(تغییرات واردات صنایع خوراکی منتخب (میلیون دلار), size(small)) title(تغییرات واردات میانگین سه ساله 1394-1396 به 1389-1391 کد چهار رقمی, size(medsmall) pos(12)) legend(off) yscale(titlegap(2.5))  $graph_opts
graph export "Results\graphs\Bar\import 3year HS4 mean 9496 8991.png", replace
putexcel (M380) = image(Results\graphs\Bar\import 3year HS4 mean 9496 8991) 

/*

*** Bar Charts Sanctions 4 Pctiles
* export

use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

keep if Exp_Imp == "export"

merge n:1 year using "Gomrok Data\DTA Data\P2PSobat", nogen
merge n:1 ISIC3 using "Gomrok Data\DTA Data\ISIC3 Description", nogen
drop if year <1380
drop H

drop azad_growth-liquidity_growth_P2P
drop budget_P2P inflation_P2P

keep if substr(ISIC3, 1, 2) == "15"  & ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554" & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103" &  HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404")

collapse (sum) dollar (firstnm) PersianDescription Shortname yearly_sii real_gdp_growth_P2P , by(year ISIC3)

drop if year == .

sort  ISIC3 year

egen mean_3year = mean(dollar) if year >1399 , by(ISIC3)

egen group_ISIC = group(ISIC3)

xtset group_ISIC year 
gen lag_dollar = l.dollar 

keep if ISIC3 == "1520" | ISIC3 == "1513" | ISIC3 == "1512" | ISIC3 == "1541" | ISIC3 == "1543" 

gen trade_Growth = (dollar - lag_dollar) / lag_dollar * 100

xtile sii_xtile = yearly_sii if ISIC3 == "1520" , nq(4)
//xtile gdp_gro_xtile = real_gdp_growth_P2P if ISIC3 == "1520" , nq(4)
gen rosh_eghtesad = 1 if real_gdp_growth_P2P > 0
replace rosh_eghtesad = 0 if rosh_eghtesad == .

fillmissing sii_xtile , by(year)

label define sii_xtile  1 "تحریم ضعیف" 2 "تحریم متوسط" 3 "تحریم متوسط" 4 "تحریم شدید"
label values sii_xtile sii_xtile

label define rosh_eghtesad 1 "رشد اقتصاد" 0 "رکود اقتصادی"
label values rosh_eghtesad rosh_eghtesad

gen trade_Growth_Sanctionone = trade_Growth if  sii_xtile == 1 
gen trade_Growth_sanctionfour = trade_Growth if sii_xtile == 4

putexcel set "Results\Results", modify sheet("graphs")
graph hbar (mean) trade_Growth if sii_xtile == 1 | sii_xtile == 4 , over(PersianDescription, label( labsize(vsmall))) over(sii_xtile , label(angle(vertical))) stack ytitle(میانگین تغییرات صادرات (درصد), size(small)) title(میانگین تغییرات صادرات پنج صنعت اصلی غذایی در دوران تحریم شدید و ضعیف, size(small)) legend(off)  bar(2, color(red)) $graph_opts
graph export "Results\graphs\Bar\export tahrim 5 ISIC.png", replace
putexcel (A250) = image(Results\graphs\Bar\export tahrim 5 ISIC) 


putexcel set "Results\Results", modify sheet("graphs")
graph hbar (mean) trade_Growth, over(PersianDescription, label( labsize(vsmall))) over(rosh_eghtesad, label(angle(vertical))) stack ytitle(میانگین تغییرات صادرات (درصد), size(vsmall)) title(میانگین تغییرات صادرات پنج صنعت اصلی غذایی در دوران رکود و رشد, size(medsmall)) legend(off) $graph_opts
graph export "Results\graphs\Bar\export roshd 5 ISIC.png", replace
putexcel (M250) = image(Results\graphs\Bar\export roshd 5 ISIC) 


* Import

use "Gomrok Data\DTA Data\cleaned\cleaned data", clear


keep if Exp_Imp == "import"

merge n:1 year using "Gomrok Data\DTA Data\P2PSobat", nogen
merge n:1 ISIC3 using "Gomrok Data\DTA Data\ISIC3 Description", nogen
drop if year <1380
drop H

drop azad_growth-liquidity_growth_P2P
drop budget_P2P inflation_P2P

keep if substr(ISIC3, 1, 2) == "15"  & ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554" & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103" &  HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404")

collapse (sum) dollar (firstnm) PersianDescription Shortname yearly_sii real_gdp_growth_P2P , by(year ISIC3)

drop if year == .

sort  ISIC3 year

egen mean_3year = mean(dollar) if year >1399 , by(ISIC3)

egen group_ISIC = group(ISIC3)

xtset group_ISIC year 
gen lag_dollar = l.dollar 

keep if ISIC3 == "1514" | ISIC3 == "1531" | ISIC3 == "1542" | ISIC3 == "1511" | ISIC3 == "1549" 

gen trade_Growth = (dollar - lag_dollar) / lag_dollar * 100

xtile sii_xtile = yearly_sii if ISIC3 == "1531" , nq(4)
//xtile gdp_gro_xtile = real_gdp_growth_P2P if ISIC3 == "1520" , nq(4)
gen rosh_eghtesad = 1 if real_gdp_growth_P2P > 0
replace rosh_eghtesad = 0 if rosh_eghtesad == .

fillmissing sii_xtile , by(year)

label define sii_xtile  1 "تحریم ضعیف" 2 "تحریم متوسط" 3 "تحریم متوسط" 4 "تحریم شدید"
label values sii_xtile sii_xtile

label define rosh_eghtesad 1 "رشد اقتصاد" 0 "رکود اقتصادی"
label values rosh_eghtesad rosh_eghtesad


putexcel set "Results\Results", modify sheet("graphs")
graph hbar (mean) trade_Growth if sii_xtile == 1 | sii_xtile == 4, over(PersianDescription, label( labsize(vsmall))) over(sii_xtile, label(angle(vertical))) stack ytitle(میانگین تغییرات واردات (درصد), size(small)) title(میانگین تغییرات واردات 5 صنعت اصلی غذایی در دوران تحریم شدید و ضعیف, size(small)) legend(off) $graph_opts
graph export "Results\graphs\Bar\import tahrim 5 ISIC.png", replace
putexcel (A285) = image(Results\graphs\Bar\import tahrim 5 ISIC) 


putexcel set "Results\Results", modify sheet("graphs")
graph hbar (mean) trade_Growth, over(PersianDescription, label( labsize(vsmall))) over(rosh_eghtesad, label(angle(vertical))) stack ytitle(میانگین تغییرات واردات (درصد), size(small)) title(میانگین تغییرات واردات 5 صنعت اصلی غذایی در دوران رکود و رشد, size(small)) legend(off) $graph_opts
graph export "Results\graphs\Bar\import roshd 5 ISIC.png", replace
putexcel (M285) = image(Results\graphs\Bar\import roshd 5 ISIC) 


*/




*** Bar Charts Sanctions Median
**ISIC3

* export

use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

keep if Exp_Imp == "export"

merge n:1 year using "Gomrok Data\DTA Data\P2PSobat", nogen
merge n:1 ISIC3 using "Gomrok Data\DTA Data\ISIC3 Description", nogen
drop if year <1380
drop H

drop azad_growth-liquidity_growth_P2P
drop budget_P2P inflation_P2P

keep if substr(ISIC3, 1, 2) == "15"  & ((ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554") & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103" &  HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404"))

collapse (sum) dollar (firstnm) PersianDescription Shortname yearly_sii real_gdp_growth_P2P , by(year ISIC3)

drop if year == .

sort  ISIC3 year

egen mean_3year = mean(dollar) if year >1399 , by(ISIC3)

egen group_ISIC = group(ISIC3)

xtset group_ISIC year 
gen lag_dollar = l.dollar 

keep if ISIC3 == "1520" | ISIC3 == "1513" | ISIC3 == "1512" | ISIC3 == "1541" | ISIC3 == "1543" 

gen trade_Growth = (dollar - lag_dollar) / lag_dollar * 100

xtile sii_xtile = yearly_sii if ISIC3 == "1520" , nq(2)
//xtile gdp_gro_xtile = real_gdp_growth_P2P if ISIC3 == "1520" , nq(4)
gen rosh_eghtesad = 1 if real_gdp_growth_P2P > 0
replace rosh_eghtesad = 0 if rosh_eghtesad == .

fillmissing sii_xtile , by(year)

label define sii_xtile  1 "تحریم ضعیف" 2 "تحریم شدید"
label values sii_xtile sii_xtile

label define rosh_eghtesad 1 "رشد اقتصاد" 0 "رکود اقتصادی"
label values rosh_eghtesad rosh_eghtesad

gen trade_Growth_Sanctionone = trade_Growth if  sii_xtile == 1 
gen trade_Growth_sanctiontwo = trade_Growth if sii_xtile == 2

putexcel set "Results\Results", modify sheet("graphs")
graph hbar (mean) trade_Growth if sii_xtile == 1 | sii_xtile == 2 , over(PersianDescription, label( labsize(vsmall))) over(sii_xtile , label(angle(vertical))) stack ytitle(میانگین تغییرات صادرات (درصد), size(small)) title(میانگین تغییرات صادرات پنج صنعت اصلی غذایی در دوران تحریم شدید و ضعیف, size(small)) legend(off)  bar(2, color(red))  yscale(titlegap(2.5)) $graph_opts
graph export "Results\graphs\Bar\export tahrim 5 ISIC.png", replace
putexcel (A410) = image(Results\graphs\Bar\export tahrim 5 ISIC) 


putexcel set "Results\Results", modify sheet("graphs")
graph hbar (mean) trade_Growth, over(PersianDescription, label( labsize(vsmall))) over(rosh_eghtesad, label(angle(vertical))) stack ytitle(میانگین تغییرات صادرات (درصد), size(vsmall)) title(میانگین تغییرات صادرات پنج صنعت اصلی غذایی در دوران رکود و رشد, size(medsmall)) legend(off)  yscale(titlegap(2.5)) $graph_opts
graph export "Results\graphs\Bar\export roshd 5 ISIC.png", replace
putexcel (M410) = image(Results\graphs\Bar\export roshd 5 ISIC) 


* Import

use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

keep if Exp_Imp == "import"

merge n:1 year using "Gomrok Data\DTA Data\P2PSobat", nogen
merge n:1 ISIC3 using "Gomrok Data\DTA Data\ISIC3 Description", nogen
drop if year <1380
drop H

drop azad_growth-liquidity_growth_P2P
drop budget_P2P inflation_P2P

keep if substr(ISIC3, 1, 2) == "15" & ((ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554") & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103" &  HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404"))

collapse (sum) dollar (firstnm) PersianDescription Shortname yearly_sii real_gdp_growth_P2P , by(year ISIC3)

drop if year == .

sort  ISIC3 year

egen mean_3year = mean(dollar) if year >1399 , by(ISIC3)

egen group_ISIC = group(ISIC3)

xtset group_ISIC year 
gen lag_dollar = l.dollar 

keep if ISIC3 == "1514" | ISIC3 == "1531" | ISIC3 == "1542" | ISIC3 == "1511" | ISIC3 == "1549" 

gen trade_Growth = (dollar - lag_dollar) / lag_dollar * 100

xtile sii_xtile = yearly_sii if ISIC3 == "1531" , nq(2)
//xtile gdp_gro_xtile = real_gdp_growth_P2P if ISIC3 == "1520" , nq(4)
gen rosh_eghtesad = 1 if real_gdp_growth_P2P > 0
replace rosh_eghtesad = 0 if rosh_eghtesad == .

fillmissing sii_xtile , by(year)

label define sii_xtile  1 "تحریم ضعیف" 2 "تحریم شدید"
label values sii_xtile sii_xtile

label define rosh_eghtesad 1 "رشد اقتصاد" 0 "رکود اقتصادی"
label values rosh_eghtesad rosh_eghtesad


putexcel set "Results\Results", modify sheet("graphs")
graph hbar (mean) trade_Growth if sii_xtile == 1 | sii_xtile == 2, over(PersianDescription, label( labsize(vsmall))) over(sii_xtile, label(angle(vertical))) stack ytitle(میانگین تغییرات واردات (درصد), size(small)) title(میانگین تغییرات واردات پنج صنعت اصلی غذایی در دوران تحریم شدید و ضعیف, size(small)) legend(off)  yscale(titlegap(2.5)) $graph_opts
graph export "Results\graphs\Bar\import tahrim 5 ISIC.png", replace
putexcel (A440) = image(Results\graphs\Bar\import tahrim 5 ISIC) 


putexcel set "Results\Results", modify sheet("graphs")
graph hbar (mean) trade_Growth, over(PersianDescription, label( labsize(vsmall))) over(rosh_eghtesad, label(angle(vertical))) stack ytitle(میانگین تغییرات واردات (درصد), size(small)) title(میانگین تغییرات واردات پنج صنعت اصلی غذایی در دوران رکود و رشد, size(small)) legend(off)  yscale(titlegap(2.5)) $graph_opts
graph export "Results\graphs\Bar\import roshd 5 ISIC.png", replace
putexcel (M440) = image(Results\graphs\Bar\import roshd 5 ISIC) 





*** Bar Charts Sanctions Median
** HS2
* export

use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

keep if Exp_Imp == "export"

merge n:1 year using "Gomrok Data\DTA Data\P2PSobat", nogen
merge n:1 HS2 using "Gomrok Data\DTA Data\HS2 Persian", nogen
drop if year <1380
drop H

drop azad_growth-liquidity_growth_P2P
drop budget_P2P inflation_P2P

keep if  (substr(ISIC3, 1, 2) == "15" | ( HS4 == "2308" | HS4 == "2303" | HS4 == "2302" | HS4 == "2501")) & ((ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554") & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103" &  HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404" & HS2 != "41"))

collapse (sum) dollar (firstnm)  Persian_HS_2digit_Desc Persian_HS_2digit_Desc_Short yearly_sii real_gdp_growth_P2P , by(year HS2)

drop if year == .

sort  HS2 year

egen mean_3year = mean(dollar) if year >1399 , by(HS2)

egen group_HS2 = group(HS2)

xtset group_HS2 year 
gen lag_dollar = l.dollar 

keep if HS2 == "17" | HS2 == "03" | HS2 == "19" | HS2 == "20" | HS2 == "04" 

sort year
gen trade_Growth = (dollar - lag_dollar) / lag_dollar * 100
gen year_selector = 1 if (year[_n] - year[_n-1] != 0)
xtile sii_xtile = yearly_sii if year_selector == 1 , nq(2)
//xtile gdp_gro_xtile = real_gdp_growth_P2P if ISIC3 == "1520" , nq(4)
gen rosh_eghtesad = 1 if real_gdp_growth_P2P > 0
replace rosh_eghtesad = 0 if rosh_eghtesad == .

fillmissing sii_xtile , by(year)

label define sii_xtile  1 "تحریم ضعیف" 2 "تحریم شدید"
label values sii_xtile sii_xtile

label define rosh_eghtesad 1 "رشد اقتصاد" 0 "رکود اقتصادی"
label values rosh_eghtesad rosh_eghtesad

putexcel set "Results\Results", modify sheet("graphs")
graph hbar (mean) trade_Growth if sii_xtile == 1 | sii_xtile == 2 , over(Persian_HS_2digit_Desc_Short, label( labsize(vsmall))) over(sii_xtile , label(angle(vertical))) stack ytitle(میانگین تغییرات صادرات (درصد), size(small)) title(میانگین تغییرات صادرات پنج کالای دو رقمی اصلی غذایی در دوران تحریم شدید و ضعیف, size(small)) legend(off)  bar(2, color(red)) yscale(titlegap(2.5)) $graph_opts
graph export "Results\graphs\Bar\export tahrim 5 HS2.png", replace
putexcel (A470) = image(Results\graphs\Bar\export tahrim 5 HS2) 


putexcel set "Results\Results", modify sheet("graphs")
graph hbar (mean) trade_Growth, over(Persian_HS_2digit_Desc_Short, label( labsize(vsmall))) over(rosh_eghtesad, label(angle(vertical))) stack ytitle(میانگین تغییرات صادرات (درصد), size(vsmall)) title(میانگین تغییرات صادرات پنج کالای دو رقمی اصلی غذایی در دوران رکود و رشد, size(medsmall)) legend(off) yscale(titlegap(2.5)) $graph_opts
graph export "Results\graphs\Bar\export roshd 5 HS2.png", replace
putexcel (M470) = image(Results\graphs\Bar\export roshd 5 HS2) 


* Import

use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

keep if Exp_Imp == "import"

merge n:1 year using "Gomrok Data\DTA Data\P2PSobat", nogen
merge n:1 HS2 using "Gomrok Data\DTA Data\HS2 Persian", nogen
drop if year <1380
drop H

drop azad_growth-liquidity_growth_P2P
drop budget_P2P inflation_P2P

keep if  (substr(ISIC3, 1, 2) == "15" | ( HS4 == "2308" | HS4 == "2303" | HS4 == "2302" | HS4 == "2501")) & ((ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554") & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103" &  HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404" & HS2 != "41"))


collapse (sum) dollar (firstnm)  Persian_HS_2digit_Desc Persian_HS_2digit_Desc_Short yearly_sii real_gdp_growth_P2P , by(year HS2)

drop if year == .

sort  HS2 year

egen mean_3year = mean(dollar) if year >1399 , by(HS2)

egen group_HS2 = group(HS2)

xtset group_HS2 year 
gen lag_dollar = l.dollar 

keep if HS2 == "02" | HS2 == "17" | HS2 == "23" | HS2 == "10" | HS2 == "15" 

sort year
gen trade_Growth = (dollar - lag_dollar) / lag_dollar * 100
gen year_selector = 1 if (year[_n] - year[_n-1] != 0)
xtile sii_xtile = yearly_sii if year_selector == 1 , nq(2)
//xtile gdp_gro_xtile = real_gdp_growth_P2P if ISIC3 == "1520" , nq(4)
gen rosh_eghtesad = 1 if real_gdp_growth_P2P > 0
replace rosh_eghtesad = 0 if rosh_eghtesad == .

fillmissing sii_xtile , by(year)

label define sii_xtile  1 "تحریم ضعیف" 2 "تحریم شدید"
label values sii_xtile sii_xtile

label define rosh_eghtesad 1 "رشد اقتصاد" 0 "رکود اقتصادی"
label values rosh_eghtesad rosh_eghtesad


putexcel set "Results\Results", modify sheet("graphs")
graph hbar (mean) trade_Growth if sii_xtile == 1 | sii_xtile == 2, over(Persian_HS_2digit_Desc_Short, label( labsize(vsmall))) over(sii_xtile, label(angle(vertical))) stack ytitle(میانگین تغییرات واردات (درصد), size(small)) title(میانگین تغییرات واردات 5 کالای دو رقمی اصلی غذایی در دوران تحریم شدید و ضعیف, size(small)) legend(off) yscale(titlegap(2.5)) $graph_opts
graph export "Results\graphs\Bar\import tahrim 5 HS2.png", replace
putexcel (A500) = image(Results\graphs\Bar\import tahrim 5 HS2) 


putexcel set "Results\Results", modify sheet("graphs")
graph hbar (mean) trade_Growth, over(Persian_HS_2digit_Desc_Short, label( labsize(vsmall))) over(rosh_eghtesad, label(angle(vertical))) stack ytitle(میانگین تغییرات واردات (درصد), size(small)) title(میانگین تغییرات واردات پنج کالای دو رقمی اصلی غذایی در دوران رکود و رشد, size(small)) legend(off) yscale(titlegap(2.5)) $graph_opts
graph export "Results\graphs\Bar\import roshd 5 HS2.png", replace
putexcel (M500) = image(Results\graphs\Bar\import roshd 5 HS2) 






*** Bar Charts Sanctions Median
** HS4
* export

use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

keep if Exp_Imp == "export"

merge n:1 year using "Gomrok Data\DTA Data\P2PSobat", nogen
merge n:1 HS4 using "Gomrok Data\DTA Data\HS4 Persian", nogen
drop if year <1380
drop H

drop azad_growth-liquidity_growth_P2P
drop budget_P2P inflation_P2P

keep if  (substr(ISIC3, 1, 2) == "15" | ( HS4 == "2308" | HS4 == "2303" | HS4 == "2302" | HS4 == "2501")) & ((ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554") & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103" &  HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404" & HS2 != "41"))

collapse (sum) dollar (firstnm)  Persian_HS_4digit_Desc Persian_HS_4digit_Desc_Short yearly_sii real_gdp_growth_P2P , by(year HS4)

drop if year == .

sort  HS4 year

egen mean_3year = mean(dollar) if year >1399 , by(HS4)

egen group_HS4 = group(HS4)

xtset group_HS4 year 
gen lag_dollar = l.dollar 

keep if HS4 == "0303" | HS4 == "1902" | HS4 == "2009" | HS4 == "2002" | HS4 == "0306" | HS4 == "0401" | HS4 == "1704" | HS4 == "0406" | HS4 == "1905" | HS4 == "0402"

sort year
gen trade_Growth = (dollar - lag_dollar) / lag_dollar * 100
gen year_selector = 1 if (year[_n] - year[_n-1] != 0)
xtile sii_xtile = yearly_sii if year_selector == 1 , nq(2)
//xtile gdp_gro_xtile = real_gdp_growth_P2P if ISIC3 == "1520" , nq(4)
gen rosh_eghtesad = 1 if real_gdp_growth_P2P > 0
replace rosh_eghtesad = 0 if rosh_eghtesad == .

fillmissing sii_xtile , by(year)

label define sii_xtile  1 "تحریم ضعیف" 2 "تحریم شدید"
label values sii_xtile sii_xtile

label define rosh_eghtesad 1 "رشد اقتصاد" 0 "رکود اقتصادی"
label values rosh_eghtesad rosh_eghtesad

putexcel set "Results\Results", modify sheet("graphs")
graph hbar (mean) trade_Growth if sii_xtile == 1 | sii_xtile == 2 , over(Persian_HS_4digit_Desc_Short, label( labsize(vsmall))) over(sii_xtile , label(angle(vertical))) stack ytitle(میانگین تغییرات صادرات (درصد), size(small)) title(میانگین تغییرات صادرات ده کالای چهار رقمی اصلی غذایی در دوران تحریم شدید و ضعیف, size(small)) legend(off)  bar(2, color(red)) yscale(titlegap(2.5)) $graph_opts
graph export "Results\graphs\Bar\export tahrim 5 HS4.png", replace
putexcel (A530) = image(Results\graphs\Bar\export tahrim 5 HS4) 


putexcel set "Results\Results", modify sheet("graphs")
graph hbar (mean) trade_Growth, over(Persian_HS_4digit_Desc_Short, label( labsize(vsmall))) over(rosh_eghtesad, label(angle(vertical))) stack ytitle(میانگین تغییرات صادرات (درصد), size(vsmall)) title(میانگین تغییرات صادرات ده کالای چهار رقمی اصلی غذایی در دوران رکود و رشد, size(medsmall)) legend(off) yscale(titlegap(2.5)) $graph_opts
graph export "Results\graphs\Bar\export roshd 5 HS4.png", replace
putexcel (M530) = image(Results\graphs\Bar\export roshd 5 HS4) 


* Import

use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

keep if Exp_Imp == "import"

merge n:1 year using "Gomrok Data\DTA Data\P2PSobat", nogen
merge n:1 HS4 using "Gomrok Data\DTA Data\HS4 Persian", nogen
drop if year <1380
drop H

drop azad_growth-liquidity_growth_P2P
drop budget_P2P inflation_P2P

keep if  (substr(ISIC3, 1, 2) == "15" | ( HS4 == "2308" | HS4 == "2303" | HS4 == "2302" | HS4 == "2501")) & ((ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554") & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103" &  HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404" & HS2 != "41"))


collapse (sum) dollar (firstnm)  Persian_HS_4digit_Desc Persian_HS_4digit_Desc_Short yearly_sii real_gdp_growth_P2P , by(year HS4)

drop if year == .

sort  HS4 year

egen mean_3year = mean(dollar) if year >1399 , by(HS4)

egen group_HS4 = group(HS4)

xtset group_HS4 year 
gen lag_dollar = l.dollar 

keep if HS4 == "0204" | HS4 == "0207" | HS4 == "2106" | HS4 == "0202" | HS4 == "1507" | HS4 == "1701" | HS4 == "1511" | HS4 == "2304" | HS4 == "1512" | HS4 == "1006" 

sort year
gen trade_Growth = (dollar - lag_dollar) / lag_dollar * 100
gen year_selector = 1 if (year[_n] - year[_n-1] != 0)
xtile sii_xtile = yearly_sii if year_selector == 1 , nq(2)
//xtile gdp_gro_xtile = real_gdp_growth_P2P if ISIC3 == "1520" , nq(4)
gen rosh_eghtesad = 1 if real_gdp_growth_P2P > 0
replace rosh_eghtesad = 0 if rosh_eghtesad == .

fillmissing sii_xtile , by(year)

label define sii_xtile  1 "تحریم ضعیف" 2 "تحریم شدید"
label values sii_xtile sii_xtile

label define rosh_eghtesad 1 "رشد اقتصاد" 0 "رکود اقتصادی"
label values rosh_eghtesad rosh_eghtesad


putexcel set "Results\Results", modify sheet("graphs")
graph hbar (mean) trade_Growth if sii_xtile == 1 | sii_xtile == 2, over(Persian_HS_4digit_Desc_Short, label( labsize(vsmall))) over(sii_xtile, label(angle(vertical))) stack ytitle(میانگین تغییرات واردات (درصد), size(small)) title(میانگین تغییرات واردات ده کالای چهار رقمی اصلی غذایی در دوران تحریم شدید و ضعیف, size(small)) legend(off) yscale(titlegap(2.5)) $graph_opts
graph export "Results\graphs\Bar\import tahrim 5 HS4.png", replace
putexcel (A560) = image(Results\graphs\Bar\import tahrim 5 HS4) 


putexcel set "Results\Results", modify sheet("graphs")
graph hbar (mean) trade_Growth, over(Persian_HS_4digit_Desc_Short, label( labsize(vsmall))) over(rosh_eghtesad, label(angle(vertical))) stack ytitle(میانگین تغییرات واردات (درصد), size(small)) title(میانگین تغییرات واردات ده کالای چهار رقمی اصلی غذایی در دوران رکود و رشد, size(small)) legend(off) yscale(titlegap(2.5)) $graph_opts
graph export "Results\graphs\Bar\import roshd 5 HS4.png", replace
putexcel (M560) = image(Results\graphs\Bar\import roshd 5 HS4) 





**** Pie Charts

** Manu Food

* HS Codes

* Export


* ISIC3

local d=595
foreach i in 1402 1390 1384 {
	
	use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

	gen food = 1 if substr(ISIC3, 1, 2) == "15" & ((ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554") & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103" &  HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404" & HS2 != "41"))
	replace PersianDescription = "اتانول" if ISIC3 == "1551"
	
	keep if food == 1

	collapse (sum) dollar (firstnm) desc PersianDescription Shortname ,by(year Exp_Imp ISIC3)

	keep if year == `i'
	
		preserve
		keep if Exp_Imp == "export" 
		sort dollar
		replace dollar = int(dollar)
		//keep in -10/-1
		//labmask dollar, values(PersianDescription)
		putexcel set "Results\Results", modify sheet("graphs")
		graph pie dollar, over(PersianDescription) sort(dollar) descending  title(ده صنعت خوراکی با بیشترین میزان صادرات در سال `i', size(medium) position(12)) legend(off) name(pieisicexp`i', replace) legend(on cols(2) pos(6) size(vsmall)) plabel(_all percent, size(vsmall)  format("%3.0f")) $graph_opts
		restore	
		graph export "Results\graphs\PIE\ISIC Pie Export `i'.png", replace
		putexcel (A`d') = image(Results\graphs\PIE\ISIC Pie Export `i') 
	
		local d= `d' + 40
}

local d=595
foreach i in 1402 1390 1384 {
	
	use "Gomrok Data\DTA Data\cleaned\cleaned data", clear


	gen food = 1 if substr(ISIC3, 1, 2) == "15" & ((ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554") & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103" &  HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404" & HS2 != "41"))
	replace PersianDescription = "اتانول" if ISIC3 == "1551"

	keep if food == 1

	collapse (sum) dollar (firstnm)  PersianDescription Shortname  ,by(year Exp_Imp ISIC3)

	keep if year == `i'
	
		preserve
		keep if Exp_Imp == "import" 
		sort dollar
		replace dollar = int(dollar)
		//keep in -10/-1
		//labmask dollar, values(PersianDescription)
		putexcel set "Results\Results", modify sheet("graphs")
		graph pie dollar, over(PersianDescription) sort(dollar) descending  title(ده صنعت خوراکی با بیشترین میزان واردات در سال `i', size(medium) position(12)) legend(on cols(2) pos(6) size(vsmall)) name(pieisicimp`i', replace) plabel(_all percent, size(vsmall)  format("%3.0f")) $graph_opts
		restore	
		graph export "Results\graphs\PIE\ISIC Pie Import `i'.png", replace
		putexcel (M`d') = image(Results\graphs\PIE\ISIC Pie Import `i') 
	
		local d= `d' + 40
}


** HS2
local d=710
foreach i in 1402 1390 1384 {
	
	use "Gomrok Data\DTA Data\cleaned\cleaned data", clear


	gen food = 1 if (substr(ISIC3, 1, 2) == "15" | ( HS4 == "2308" | HS4 == "2303" | HS4 == "2302" | HS4 == "2501")) & ((ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554") & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103" &  HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404" & HS2 != "41"))
	
	keep if food == 1
	
	merge n:1 HS2 using "Gomrok Data\DTA Data\HS2 Persian", nogen

	collapse (sum) dollar (firstnm) desc Persian_HS_2digit_Desc Persian_HS_2digit_Desc_Short ISIC3 ,by(year Exp_Imp HS2)
	keep if year == `i'
	
		preserve
		keep if Exp_Imp == "export" 
		sort dollar
		replace Persian_HS_2digit_Desc_Short = "سایر بخش ها" in 1/-11
		collapse (sum) dollar (firstnm)  Persian_HS_2digit_Desc  ,by(Persian_HS_2digit_Desc_Short)
		putexcel set "Results\Results", modify sheet("graphs")
		graph pie dollar, over(Persian_HS_2digit_Desc_Short) sort(dollar) descending title(ده کالای خوراکی دو رقمی با بیشترین میزان صادرات در سال `i', size(medium) position(12)) name(piehsexp`i', replace) legend(on cols(1) pos(3) size(vsmall)) plabel(_all percent, size(vsmall)  format("%3.0f"))  $graph_opts // plabel(_all name, size(tiny)) 
		graph export "Results\graphs\PIE\HS2 Pie Export `i'.png", replace
		putexcel (A`d') = image(Results\graphs\PIE\HS2 Pie Export `i') 

		restore	

		local d= `d' + 40
}

* Import
local d=710
foreach i in 1402 1390 1384 {
	
	use "Gomrok Data\DTA Data\cleaned\cleaned data", clear


	gen food = 1 if (substr(ISIC3, 1, 2) == "15" | ( HS4 == "2308" | HS4 == "2303" | HS4 == "2302" | HS4 == "2501")) & ((ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554") & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103" &  HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404" & HS2 != "41"))
	
	keep if food == 1
	
	merge n:1 HS2 using "Gomrok Data\DTA Data\HS2 Persian", nogen

	collapse (sum) dollar (firstnm) desc Persian_HS_2digit_Desc Persian_HS_2digit_Desc_Short ISIC3 ,by(year Exp_Imp HS2)
	
	keep if year == `i'
	
		preserve
		keep if Exp_Imp == "import" 
		sort dollar
		replace Persian_HS_2digit_Desc_Short = "سایر بخش ها" in 1/-11
		collapse (sum) dollar (firstnm)  Persian_HS_2digit_Desc  ,by(Persian_HS_2digit_Desc_Short)
		putexcel set "Results\Results", modify sheet("graphs")
		graph pie dollar, over(Persian_HS_2digit_Desc_Short) sort(dollar) descending title(ده کالای خوراکی دو رقمی با بیشترین میزان واردات در سال `i', size(medium) position(12)) name(piehsexp`i', replace) legend(on cols(1) pos(3) size(vsmall)) plabel(_all percent, size(vsmall)  format("%3.0f"))  $graph_opts // plabel(_all name, size(tiny)) 
		restore	
		graph export "Results\graphs\PIE\HS2 Pie Import `i'.png", replace
		putexcel (M`d') = image(Results\graphs\PIE\HS2 Pie Import `i')  

		local d= `d' + 40

}



/*
** For All Goods

use "Gomrok Data\DTA Data\unified\Import Data unified", clear
append using "Gomrok Data\DTA Data\unified\export Data unified"

//format dollar %12.0g


foreach i in 1402 1390 1384 {
	
	use "Gomrok Data\DTA Data\unified\Import Data unified", clear
	append using "Gomrok Data\DTA Data\unified\export Data unified"

	format
	collapse dollar (firstnm) desc ISIC3DESC ISIC3 ,by(year Exp_Imp code)

	keep if year == `i'
	
		preserve
		keep if Exp_Imp == "export" 
		sort dollar
		drop if country == "جمع"
		replace dollar = dollar / 1000000
		replace dollar = int(dollar)
		keep in -10/-1
		labmask dollar, values(desc)
		graph pie dollar, over(dollar) sort(dollar) descending plabel(_all name, size(tiny)) title(15 کالای خوراکی با بیشترین میزان صادرات بر اساس کد های کالاها در سال `i', size(small) position(12)) legend(off) name(pie`i', replace)
		restore	

}


foreach i in 1402 1390 1384 {
	
	use "Gomrok Data\DTA Data\unified\Import Data unified", clear
	append using "Gomrok Data\DTA Data\unified\export Data unified"

	collapse dollar (firstnm) desc ISIC3DESC ISIC3 ,by(year Exp_Imp code)

	keep if year == `i'
	
		preserve
		keep if Exp_Imp == "import" 
		sort dollar
		replace dollar = dollar / 1000000
		replace dollar = int(dollar)
		drop if country == "جمع"
		keep in -10/-1
		labmask dollar, values(desc)
		graph pie dollar, over(dollar) sort(dollar) descending plabel(_all name, size(tiny)) title(15 کالای با بیشترین میزان واردات بر اساس کد های کالاها در سال `i', size(small) position(12)) legend(on) name(pie`i', replace)
		restore	

}




*/

**** Delta

/*

** 1402

use "Gomrok Data\DTA Data\unified\Import Data unified", clear
append using "Gomrok Data\DTA Data\unified\Export Data unified"

keep if year == 1402
gen HS_main = substr(code, 1, 4)
drop if country == "جمع"
replace dollar = dollar * -1 if Exp_Imp == "import"

collapse (sum) dollar , by(year HS_main)

sort dollar

drop in 5/-5
graph bar (mean) dollar, over(HS_main) over(year) legend(off)

** 1390

use "Gomrok Data\DTA Data\unified\Import Data unified", clear
append using "Gomrok Data\DTA Data\unified\Export Data unified"

keep if year == 1390
gen HS_main = substr(code, 1, 4)
drop if country == "جمع"
replace dollar = dollar * -1 if Exp_Imp == "import"

collapse (sum) dollar , by(year HS_main)

sort dollar

drop in 5/-5
graph bar (mean) dollar, over(HS_main) over(year) legend(off)



** Food

*1402

use "Gomrok Data\DTA Data\unified\Import Data unified", clear
append using "Gomrok Data\DTA Data\unified\Export Data unified"

gen food = 1 if substr(ISIC3, 1, 2) == "01" | substr(ISIC3, 1, 2) == "02" |substr(ISIC3, 1, 2) == "05" | substr(ISIC3, 1, 2) == "15"
keep if food == 1

keep if year == 1402
gen HS_main = substr(code, 1, 4)
drop if country == "جمع"
replace dollar = dollar * -1 if Exp_Imp == "import"

collapse (sum) dollar , by(year HS_main)

sort dollar

drop in 5/-5
graph bar (mean) dollar, over(HS_main) over(year) legend(off)

*1390

use "Gomrok Data\DTA Data\unified\Import Data unified", clear
append using "Gomrok Data\DTA Data\unified\Export Data unified"

gen food = 1 if substr(ISIC3, 1, 2) == "01" | substr(ISIC3, 1, 2) == "02" |substr(ISIC3, 1, 2) == "05" | substr(ISIC3, 1, 2) == "15"
keep if food == 1

keep if year == 1390
gen HS_main = substr(code, 1, 4)
drop if country == "جمع"
replace dollar = dollar * -1 if Exp_Imp == "import"

collapse (sum) dollar , by(year HS_main)

sort dollar

drop in 5/-5
graph bar (mean) dollar, over(HS_main) over(year) legend(off)



** ISIC3



** 1402

use "Gomrok Data\DTA Data\unified\Import Data unified", clear
append using "Gomrok Data\DTA Data\unified\Export Data unified"

keep if year == 1402
drop if country == "جمع"
replace dollar = dollar * -1 if Exp_Imp == "import"

collapse (sum) dollar , by(year ISIC3)

sort dollar

drop in 5/-5
graph bar (mean) dollar, over(ISIC3) over(year) legend(off)

** 1390

use "Gomrok Data\DTA Data\unified\Import Data unified", clear
append using "Gomrok Data\DTA Data\unified\Export Data unified"

keep if year == 1390
drop if country == "جمع"
replace dollar = dollar * -1 if Exp_Imp == "import"

collapse (sum) dollar , by(year ISIC3)

sort dollar

drop in 5/-5
graph bar (mean) dollar, over(ISIC3) over(year) legend(off)


*/


/*

** Delta Version 2

* For HS Code 4 Digit

* import

use "Gomrok Data\DTA Data\unified\Import Data unified", clear
append using "Gomrok Data\DTA Data\unified\Export Data unified"


gen food = 1 if substr(ISIC3, 1, 2) == "01" | substr(ISIC3, 1, 2) == "02" |substr(ISIC3, 1, 2) == "05" | substr(ISIC3, 1, 2) == "15"
keep if food == 1

keep if year == 1402 | year == 1390

gen dollar1390 = dollar if year == 1390


gen HS_main_group = substr(HS1992,1, 4 )

replace dollar = 0 if dollar == .
replace dollar1390 = 0 if dollar1390 == .
collapse (sum) dollar dollar1390 , by(HS_main_group Exp_Imp year)

replace dollar1390 = . if dollar1390 == 0

fillmissing dollar1390 ,by(HS_main_group Exp_Imp)

drop if year == 1390


replace dollar1390 = 0 if dollar1390 == .

rename dollar dollar1402
gen dollar_diff = dollar1402 - dollar1390


gen per_change0290 = (dollar_diff / dollar1390) * 100

replace dollar_diff = dollar_diff / 1000000000

keep if Exp_Imp == "import"


merge 1:1 HS_main_group using "Gomrok Data\DTA Data\4digit desc", nogen
drop if year == .
sort dollar1402
keep in -10/-1

replace HS_4digit_desc = "روغن دانه ی سویا" if HS_main_group == "1507"
replace HS_4digit_desc = "قند نیشکر و چغندر و ساکارز" if HS_main_group == "1701"
replace HS_4digit_desc = "روغن پالم و متعلقات" if HS_main_group == "1511"
replace HS_4digit_desc = "جو" if HS_main_group == "1003"
replace HS_4digit_desc = "گندم" if HS_main_group == "1001"
replace HS_4digit_desc =  "کنجاله" if HS_main_group == "2304"
replace HS_4digit_desc = "روغن تخم آفتابگردان" if HS_main_group == "1512"
replace HS_4digit_desc = "برنج" if HS_main_group == "1006"
replace HS_4digit_desc = "دانه ی سویا" if HS_main_group == "1201"
replace HS_4digit_desc = "ذرت" if HS_main_group == "1005"

graph bar (mean) dollar_diff, over(HS_4digit_desc, label(angle(forty_five) labsize(small))) ytitle(مقدار اختلاف واردات (میلیارد دلار), size(small)) ylabel(-.5(0.5)2.5) title(اختلاف واردات سال 1402 از سال 1390 برای کالاهای منتخب خوراکی, size(medsmall) position(12))
graph export "Results\graphs\Totals\import difference HS.png", replace


graph bar (mean) per_change0290, over(HS_4digit_desc, label(angle(forty_five) labsize(small))) ytitle(درصد تغییرات واردات (میلیارد دلار), size(small))  title(درصد تغییرات واردات سال 1402 از سال 1390 برای کالاهای منتخب خوراکی, size(medsmall) position(12))
graph export "Results\graphs\Totals\import percentage diff HS.png", replace

* Export

use "Gomrok Data\DTA Data\unified\Import Data unified", clear
append using "Gomrok Data\DTA Data\unified\Export Data unified"


gen food = 1 if substr(ISIC3, 1, 2) == "01" | substr(ISIC3, 1, 2) == "02" |substr(ISIC3, 1, 2) == "05" | substr(ISIC3, 1, 2) == "15"
keep if food == 1

keep if year == 1402 | year == 1390

gen dollar1390 = dollar if year == 1390

gen HS_main_group = substr(HS1992,1, 4 )

replace dollar = 0 if dollar == .
replace dollar1390 = 0 if dollar1390 == .
collapse (sum) dollar dollar1390 , by(HS_main_group Exp_Imp year)

replace dollar1390 = . if dollar1390 == 0

fillmissing dollar1390 ,by(HS_main_group Exp_Imp)

drop if year == 1390


replace dollar1390 = 0 if dollar1390 == .

rename dollar dollar1402
gen dollar_diff = dollar1402 - dollar1390


gen per_change0290 = (dollar_diff / dollar1390) * 100

replace dollar_diff = dollar_diff / 1000000000

keep if Exp_Imp == "export"


merge 1:1 HS_main_group using "Gomrok Data\DTA Data\4digit desc", nogen
drop if year == .
sort dollar1402
keep in -10/-1

replace HS_4digit_desc = "سبزیجات" if HS_main_group == "0709"
replace HS_4digit_desc = "نان، کیک، بیسکویت، شیرینی" if HS_main_group == "1905"
replace HS_4digit_desc = "...زنجبیل، زعفران، زردچوبه، آویشن و" if HS_main_group == "0910"
replace HS_4digit_desc = "...هندوانه، خربزه،  و" if HS_main_group == "0807"
replace HS_4digit_desc = "انگور" if HS_main_group == "0806"
replace HS_4digit_desc = "شیر و خامه" if HS_main_group == "0402"
replace HS_4digit_desc = "گوجه" if HS_main_group == "0702"
replace HS_4digit_desc = "خرما، انجیر، آناناس، آووکادو" if HS_main_group == "0804"
replace HS_4digit_desc = "سیب، گلابی و به تازه" if HS_main_group == "0808"
replace HS_4digit_desc = "دانه ها" if HS_main_group == "0802"

graph bar (mean) dollar_diff, over(HS_4digit_desc, label(angle(ninety) labsize(small))) ytitle(مقدار اختلاف صادرات (میلیارد دلار), size(small)) title(اختلاف صادرات سال 1402 از سال 1390 برای کالاهای منتخب خوراکی, size(medsmall) position(12))
graph export "Results\graphs\Totals\export difference HS.png", replace



graph bar (mean) per_change0290, over(HS_4digit_desc, label(angle(ninety) labsize(small))) ytitle(درصد تغییرات صادرات (میلیارد دلار), size(small))  title(درصد تغییرات صادرات سال 1402 از سال 1390 برای کالاهای منتخب خوراکی, size(medsmall) position(12))
graph export "Results\graphs\Totals\export percentage diff HS.png",replace




** For ISIC Codes

use "Gomrok Data\DTA Data\unified\Import Data unified", clear
append using "Gomrok Data\DTA Data\unified\Export Data unified"


gen food = 1 if substr(ISIC3, 1, 2) == "01" | substr(ISIC3, 1, 2) == "02" |substr(ISIC3, 1, 2) == "05" | substr(ISIC3, 1, 2) == "15"
keep if food == 1

keep if year == 1402 | year == 1390

gen dollar1390 = dollar if year == 1390

replace dollar = 0 if dollar == .
replace dollar1390 = 0 if dollar1390 == .

collapse (sum) dollar dollar1390 (firstnm) ISIC3DESC , by(ISIC3 Exp_Imp year)

replace dollar1390 = . if dollar1390 == 0

fillmissing dollar1390 ,by(ISIC3 Exp_Imp)

drop if year == 1390


replace dollar1390 = 0 if dollar1390 == .

rename dollar dollar1402
gen dollar_diff = dollar1402 - dollar1390


gen per_change0290 = (dollar_diff / dollar1390) * 100

replace dollar_diff = dollar_diff / 1000000000

keep if Exp_Imp == "import"

drop if year == .
sort dollar1402
keep in -5/-1


replace ISIC3DESC =  "فرآوری گوشت" if ISIC3 == "1511"
replace ISIC3DESC = "کاشت میوه ها، دانه ها و نوشیدنی ها" if ISIC3 == "0113"
replace ISIC3DESC = "محصولات غلات" if ISIC3 == "1531"
replace ISIC3DESC = "روغن حیوانی و گیاهی" if ISIC3 == "1514"
replace ISIC3DESC = "cereal" if ISIC3 == "0111"

graph bar (mean) dollar_diff, over(ISIC3DESC, label(angle(forty_five) labsize(small))) ytitle(مقدار اختلاف واردات (میلیارد دلار), size(small))  title(اختلاف واردات سال 1402 از سال 1390 برای صنایع منتخب خوراکی, size(medsmall) position(12))
graph export "Results\graphs\Totals\import difference ISIC.png",replace

graph bar (mean) per_change0290, over(ISIC3DESC, label(angle(forty_five) labsize(small))) ytitle(درصد تغییرات واردات (میلیارد دلار), size(small))  title(درصد تغییرات واردات سال 1402 از سال 1390 برای صنایع منتخب خوراکی, size(medsmall) position(12))
graph export "Results\graphs\Totals\import percentage diff ISIC.png",replace

* Export


use "Gomrok Data\DTA Data\unified\Import Data unified", clear
append using "Gomrok Data\DTA Data\unified\Export Data unified"


gen food = 1 if substr(ISIC3, 1, 2) == "01" | substr(ISIC3, 1, 2) == "02" |substr(ISIC3, 1, 2) == "05" | substr(ISIC3, 1, 2) == "15"
keep if food == 1

keep if year == 1402 | year == 1390

gen dollar1390 = dollar if year == 1390

replace dollar = 0 if dollar == .
replace dollar1390 = 0 if dollar1390 == .

collapse (sum) dollar dollar1390 (firstnm) ISIC3DESC , by(ISIC3 Exp_Imp year)

replace dollar1390 = . if dollar1390 == 0

fillmissing dollar1390 ,by(ISIC3 Exp_Imp)

drop if year == 1390


replace dollar1390 = 0 if dollar1390 == .

rename dollar dollar1402
gen dollar_diff = dollar1402 - dollar1390

gen per_change0290 = (dollar_diff / dollar1390) * 100

replace dollar_diff = dollar_diff / 1000000000

keep if Exp_Imp == "export"


drop if year == .
sort dollar1402
keep in -5/-1

replace ISIC3DESC = "ماهی و محصولات مرتبط" if ISIC3 == "1512"
replace ISIC3DESC = "فرآوری میوه و سبزیجات" if ISIC3 == "1513"
replace ISIC3DESC = "محصولات لبنی" if ISIC3 == "1520"
replace ISIC3DESC = "کاشت گیاه، باغبانی و محصولات دکوری" if ISIC3 == "0112"
replace ISIC3DESC = "کاشت میوه ها، دانه ها و نوشیدنی ها" if ISIC3 == "0113"


graph bar (mean) dollar_diff, over(ISIC3DESC, label(angle(ninety) labsize(small))) ytitle(مقدار اختلاف صادرات (میلیارد دلار), size(small)) title(اختلاف صادرات سال 1402 از سال 1390 برای صنایع منتخب خوراکی, size(medsmall) position(12))
graph export "Results\graphs\Totals\export difference ISIC.png",replace


graph bar (mean) per_change0290, over(ISIC3DESC, label(angle(ninety) labsize(small))) ytitle(درصد تغییرات صادرات (میلیارد دلار), size(small))  title(درصد تغییرات صادرات سال 1402 از سال 1390 برای صنایع منتخب خوراکی, size(medsmall) position(12))
graph export "Results\graphs\Totals\export percentage diff ISIC.png",replace

*/



***** Top 5 Countries

*Export

use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

keep if Exp_Imp == "export"

drop if country == "جمع" | country == ""

collapse (sum) dollar (firstnm) country , by(year co)

egen mean_export = mean(dollar) if year >1399 , by(co)

sort mean_export year



egen other_sum = sum(dollar) if co != "China" & co != "Iraq" & co != "Turkey" & co != "United Arab Emirates (UAE)" & co != "India" ,by(year)

replace other_sum = dollar if co == "China" | co == "Iraq" | co == "Turkey" | co == "United Arab Emirates (UAE)" | co == "India" 

gen country_other = "other" if co != "China" & co != "Iraq" & co != "Turkey" & co != "United Arab Emirates (UAE)" &  co != "India" 

replace country_other= co if country_other== ""

duplicates drop year country_other, force

keep if year == 1384 | year == 1390 | year == 1402

replace country_other = "چین" if country_other == "China"
replace country_other = "عراق" if country_other == "Iraq"
replace country_other = "ترکیه" if country_other == "Turkey"
replace country_other = "امارات" if country_other == "United Arab Emirates (UAE)"
replace country_other = "هند" if country_other == "India"
replace country_other = "سایر" if country_other == "other"

replace other_sum = other_sum /1000000000

gen l = 1 if country_other == "سایر"
replace l = 2 if country_other == "چین"
replace l = 3 if country_other == "امارات"
replace l = 4 if country_other == "عراق"
replace l = 5 if country_other == "هند"
replace l = 6 if country_other == "ترکیه"

* Value
putexcel set "Results\Results", modify sheet("graphs")
graph bar (mean) other_sum, over(country_other, sort(l) ) over(year) ascategory asyvars stack ytitle(مقدار صادرات ایران (میلیارد دلار)) title(پنج کشور با بیشترین سهم صادرات (میانگین سه سال اخیر), size(medium)) legend(position(6))  bar(1, fcolor(ltblue) lwidth(none)) bar(2, fcolor(navy) lwidth(none)) bar(3, fcolor(green) lwidth(none)) bar(4, fcolor(red) lwidth(none)) bar(5, fcolor(magenta) lwidth(none)) bar(6, fcolor(orange) lwidth(none)) $graph_opts
graph export "Results\graphs\Bar\Top 5 Export Countries Value.png", replace
putexcel (A820) = image(Results\graphs\Bar\Top 5 Export Countries Value) 


* Notes

putexcel set "Results\Results", modify sheet("graphs")
putexcel A819= "پنج کشور با بیشترین میزان واردات از ایران"


* Share 
putexcel set "Results\Results", modify sheet("graphs")
graph bar (mean) other_sum, over(country_other, sort(l) ) over(year) ascategory asyvars percentages stack ytitle(سهم در صادرات ایران) title(پنج کشور با بیشترین سهم صادرات (میانگین سه سال اخیر), size(medium)) legend(position(6)) bar(1, fcolor(ltblue) lwidth(none)) bar(2, fcolor(navy) lwidth(none)) bar(3, fcolor(green) lwidth(none)) bar(4, fcolor(red) lwidth(none)) bar(5, fcolor(magenta) lwidth(none)) bar(6, fcolor(orange) lwidth(none)) $graph_opts
graph export "Results\graphs\Bar\Top 5 Export Countries Share.png", replace
putexcel (M820) = image(Results\graphs\Bar\Top 5 Export Countries Share) 


* Notes

putexcel set "Results\Results", modify sheet("graphs")
putexcel M819= "پنج کشور با بیشترین میزان واردات از ایران"




* import 

use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

keep if Exp_Imp == "import"

drop if country == "جمع" | country == ""

collapse (sum) dollar (firstnm) country , by(year co)

egen mean_import = mean(dollar) if year >1399 , by(co)

sort mean_import year


egen other_sum = sum(dollar) if co != "China" & co != "Germany" & co != "Turkey" & co != "United Arab Emirates (UAE)" & co != "India" ,by(year)

replace other_sum = dollar if co == "China" | co == "Germany" | co == "Turkey" | co == "United Arab Emirates (UAE)" | co == "India" 

gen country_other = "other" if co != "China" & co != "Germany" & co != "Turkey" & co != "United Arab Emirates (UAE)" &  co != "India" 

replace country_other= co if country_other== ""

duplicates drop year country_other, force

keep if year == 1384 | year == 1390 | year == 1402



replace country_other = "چین" if country_other == "China"
replace country_other = "آلمان" if country_other == "Germany"
replace country_other = "ترکیه" if country_other == "Turkey"
replace country_other = "امارات" if country_other == "United Arab Emirates (UAE)"
replace country_other = "هند" if country_other == "India"
replace country_other = "سایر" if country_other == "other"

replace other_sum = other_sum /1000000000


gen l = 1 if country_other == "سایر"
replace l = 3 if country_other == "امارات"
replace l = 2 if country_other == "چین"
replace l = 4 if country_other == "آلمان"
replace l = 5 if country_other == "هند"
replace l = 6 if country_other == "ترکیه"

* Value
putexcel set "Results\Results", modify sheet("graphs")
graph bar (mean) other_sum, over(country_other, sort(l) ) over(year) ascategory asyvars stack ytitle(مقدار واردات ایران (میلیارد دلار)) title(پنج کشور با بیشترین سهم واردات (میانگین سه سال اخیر), size(medium)) legend(position(6)) bar(1, fcolor(ltblue) lwidth(none)) bar(2, fcolor(navy) lwidth(none)) bar(3, fcolor(green) lwidth(none)) bar(4, fcolor(red) lwidth(none)) bar(5, fcolor(magenta) lwidth(none)) bar(6, fcolor(orange) lwidth(none)) $graph_opts
graph export "Results\graphs\Bar\Top 5 Import Countries Value.png", replace
putexcel (A850) = image(Results\graphs\Bar\Top 5 Import Countries Value) 


* Notes

putexcel set "Results\Results", modify sheet("graphs")
putexcel A849= "پنج کشور با بیشترین سهم صادرات به ایران"


* Share 
putexcel set "Results\Results", modify sheet("graphs")
graph bar (mean) other_sum, over(country_other, sort(l)) over(year) ascategory asyvars percentages stack ytitle(سهم در واردات ایران) title(پنج کشور با بیشترین سهم واردات (میانگین سه سال اخیر), size(medium)) legend(position(6)) bar(1, fcolor(ltblue) lwidth(none)) bar(2, fcolor(navy) lwidth(none)) bar(3, fcolor(green) lwidth(none)) bar(4, fcolor(red) lwidth(none)) bar(5, fcolor(magenta) lwidth(none)) bar(6, fcolor(orange) lwidth(none)) $graph_opts
graph export "Results\graphs\Bar\Top 5 Import Countries Share.png", replace
putexcel (M850) = image(Results\graphs\Bar\Top 5 Import Countries Share) 


* Notes

putexcel set "Results\Results", modify sheet("graphs")
putexcel M849= "پنج کشور با بیشترین سهم صادرات به ایران"





***** Top 5 Countries Manu Food

*Export

use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

keep if Exp_Imp == "export"
keep if substr(ISIC3, 1, 2) == "15" & ((ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554") & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103" &  HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404" & HS2 != "41"))
drop if country == "جمع" | country == ""

collapse (sum) dollar (firstnm) country , by(year co)

egen mean_export = mean(dollar) if year >1399 , by(co)

sort mean_export year



egen other_sum = sum(dollar) if co != "Iraq" & co != "Pakistan" & co != "Afghanistan" & co != "United Arab Emirates (UAE)" & co != "Russia" ,by(year)

replace other_sum = dollar if co == "Iraq" | co == "Pakistan" | co == "Afghanistan" | co == "United Arab Emirates (UAE)" | co == "Russia" 

gen country_other = "other" if co != "Iraq" & co != "Pakistan" & co != "Afghanistan" & co != "United Arab Emirates (UAE)" & co != "Russia" 

replace country_other= co if country_other== ""

duplicates drop year country_other, force

keep if year == 1384 | year == 1390 | year == 1402

replace country_other = "پاکستان" if country_other == "Pakistan"
replace country_other = "عراق" if country_other == "Iraq"
replace country_other = "افغانستان" if country_other == "Afghanistan"
replace country_other = "امارات" if country_other == "United Arab Emirates (UAE)"
replace country_other = "روسیه" if country_other == "Russia"
replace country_other = "سایر" if country_other == "other"

replace other_sum = other_sum /1000000000

gen l = 2 if country_other == "سایر"
replace l = 4 if country_other == "پاکستان"
replace l = 5 if country_other == "امارات"
replace l = 3 if country_other == "افغانستان"
replace l = 6 if country_other == "روسیه"
replace l = 1 if country_other == "عراق"

* Value
putexcel set "Results\Results", modify sheet("graphs")
graph bar (mean) other_sum, over(country_other, sort(l) ) over(year) ascategory asyvars stack ytitle(مقدار صادرات خوراکی ایران (میلیارد دلار)) title(پنج کشور با بیشترین مقدار صادرات صنعت خوراکی (میانگین سه سال اخیر), size(medium)) legend(position(6))  bar(1, fcolor(ltblue) lwidth(none)) bar(2, fcolor(navy) lwidth(none)) bar(3, fcolor(green) lwidth(none)) bar(4, fcolor(red) lwidth(none)) bar(5, fcolor(magenta) lwidth(none)) bar(6, fcolor(orange) lwidth(none)) $graph_opts
graph export "Results\graphs\Bar\Top 5 Manufood Export Countries Value.png", replace
putexcel (A880) = image(Results\graphs\Bar\Top 5 Manufood Export Countries Value) 


* Notes

putexcel set "Results\Results", modify sheet("graphs")
putexcel A879= "پنج کشور با بیشترین میزان واردات صنعت خوراکی از ایران"


* Share 
putexcel set "Results\Results", modify sheet("graphs")
graph bar (mean) other_sum, over(country_other, sort(l) ) over(year) ascategory asyvars percentages stack ytitle(سهم در صادرات خوراکی ایران) title(پنج کشور با بیشترین سهم صادرات صنعت خوراکی (میانگین سه سال اخیر), size(medium)) legend(position(6)) bar(1, fcolor(ltblue) lwidth(none)) bar(2, fcolor(navy) lwidth(none)) bar(3, fcolor(green) lwidth(none)) bar(4, fcolor(red) lwidth(none)) bar(5, fcolor(magenta) lwidth(none)) bar(6, fcolor(orange) lwidth(none)) $graph_opts
graph export "Results\graphs\Bar\Top 5 Manufood Export Countries Share.png", replace
putexcel (M880) = image(Results\graphs\Bar\Top 5 Manufood Export Countries Share) 


* Notes

putexcel set "Results\Results", modify sheet("graphs")
putexcel M879= "پنج کشور با بیشترین میزان واردات صنعت خوراکی از ایران"



* import 

use "Gomrok Data\DTA Data\cleaned\cleaned data", clear

keep if Exp_Imp == "import"
keep if substr(ISIC3, 1, 2) == "15"  & ((ISIC3 != "1552" & ISIC3 != "1553" & ISIC3 != "1554") & (HS4 != "2401"  &  HS4 != "3501"  &  HS4 != "3502"  &  HS4 != "3505"  &  HS4 != "4001"  &  HS4 != "5001"  &  HS4 != "5201"  &   HS4 != "4401"  &  HS4 != "4404"  &  HS4 != "4501"  &  HS4 != "5303"  &  HS4 != "0508"  &  HS4 != "0511"   &   HS4 != "4101"  &   HS4 != "4102"  &  HS4 != "4103" &  HS4 != "4301"  &  HS4 != "4403" &  HS4 != "4404" &   HS4 != "5101" &  HS4 != "5102" &  HS4 != "5304" &   HS4 != "5305" & HS4 != "7101" & HS4 != "0503" & HS4 != "1521" & HS4 != "1404" & HS2 != "41"))

drop if country == "جمع" | country == ""

collapse (sum) dollar (firstnm) country , by(year co)

egen mean_import = mean(dollar) if year >1399 , by(co)

sort mean_import year

 

egen other_sum = sum(dollar) if co != "Pakistan" & co != "Netherlands (Holland)" & co != "Turkey" & co != "United Arab Emirates (UAE)" & co != "India" ,by(year)

replace other_sum = dollar if co == "Pakistan" | co == "Netherlands (Holland)" | co == "Turkey" | co == "United Arab Emirates (UAE)" | co == "India"

gen country_other = "other" if co != "Pakistan" & co != "Netherlands (Holland)" & co != "Turkey" & co != "United Arab Emirates (UAE)" & co != "India" 

replace country_other= co if country_other== ""

duplicates drop year country_other, force

keep if year == 1384 | year == 1390 | year == 1402



replace country_other = "پاکستان" if country_other == "Pakistan"
replace country_other = "هلند" if country_other == "Netherlands (Holland)"
replace country_other = "ترکیه" if country_other == "Turkey"
replace country_other = "امارات" if country_other == "United Arab Emirates (UAE)"
replace country_other = "هند" if country_other == "India"
replace country_other = "سایر" if country_other == "other"

replace other_sum = other_sum /1000000000


gen l = 1 if country_other == "سایر"
replace l = 2 if country_other == "امارات"
replace l = 5 if country_other == "پاکستان"
replace l = 6 if country_other == "هلند"
replace l = 4 if country_other == "هند"
replace l = 3 if country_other == "ترکیه"

* Value
putexcel set "Results\Results", modify sheet("graphs")
graph bar (mean) other_sum, over(country_other, sort(l) ) over(year) ascategory asyvars stack ytitle(مقدار واردات صنعت خوراکی ایران (میلیارد دلار)) title(پنج کشور با بیشترین مقدار واردات صنعت خوراکی (میانگین سه سال اخیر), size(medium)) legend(position(6)) bar(1, fcolor(ltblue) lwidth(none)) bar(2, fcolor(navy) lwidth(none)) bar(3, fcolor(green) lwidth(none)) bar(4, fcolor(red) lwidth(none)) bar(5, fcolor(magenta) lwidth(none)) bar(6, fcolor(orange) lwidth(none)) $graph_opts
graph export "Results\graphs\Bar\Top 5 Manu Food Import Countries Value.png", replace
putexcel (A910) = image(Results\graphs\Bar\Top 5 Manu Food Import Countries Value) 


* Notes

putexcel set "Results\Results", modify sheet("graphs")
putexcel A909= "پنج کشور با بیشترین سهم صادرات به ایران"


* Share 
putexcel set "Results\Results", modify sheet("graphs")
graph bar (mean) other_sum, over(country_other, sort(l)) over(year) ascategory asyvars percentages stack ytitle(سهم در واردات صنعت خوراکی ایران) title(پنج کشور با بیشترین سهم در واردات صنعت خوراکی (میانگین سه سال اخیر), size(medium)) legend(position(6)) bar(1, fcolor(ltblue) lwidth(none)) bar(2, fcolor(navy) lwidth(none)) bar(3, fcolor(green) lwidth(none)) bar(4, fcolor(red) lwidth(none)) bar(5, fcolor(magenta) lwidth(none)) bar(6, fcolor(orange) lwidth(none)) $graph_opts
graph export "Results\graphs\Bar\Top 5 Manu Food Import Countries Share.png", replace
putexcel (M910) = image(Results\graphs\Bar\Top 5 Manu Food Import Countries Share) 


* Notes

putexcel set "Results\Results", modify sheet("graphs")
putexcel M909= "پنج کشور با بیشترین سهم صادرات به ایران"




/*

* import 

foreach i in 1402 1390 1384{
	use "Gomrok Data\DTA Data\unified\Import Data unified", clear

	collapse (sum) dollar  ,by (year country Exp_Imp)

	keep if year == `i'

	drop if country == "جمع"
	sort year dollar
	egen total_imp = sum(dollar)
	keep in -5/-1
	gen imp_share = (dollar / total_imp) * 100
	save "Gomrok Data\DTA Data\topfive`i'", replace
	
}

use  "Gomrok Data\DTA Data\topfive1384", clear

foreach i in 1390 1402{
	
	append using "Gomrok Data\DTA Data\topfive`i'"
}

putexcel set "Results\graphs\graphs", modify sheet("Top 5 countries")
graph bar (mean) imp_share, over(country, sort(dollar)) over(year) ascategory asyvars stack legend(on rows(2) size(small)) title(پنج کشور با بیشترین میزان صادرات به ایران, pos(12)) ytitle(سهم در واردات)
graph export "Results\graphs\Totals\Top 5 import Countries.png", replace
putexcel (A4) = image(Results\graphs\Totals\Top 5 import Countries) 


* Notes

putexcel set "Results\graphs\graphs" ,sheet("Top 5 countries") modify
putexcel A3= "پنج کشور با بیشترین میزان واردات به ایران"
putexcel A1= "پنج کشور با بیشترین میزان تجارت با ایران", font(bold, 12, black)


* export 


foreach i in 1402 1390 1384{
	use "Gomrok Data\DTA Data\unified\Export Data unified", clear

	collapse (sum) dollar  ,by (year country Exp_Imp)

	keep if year == `i'

	drop if country == "جمع"
	sort year dollar
	egen total_exp = sum(dollar)
	keep in -5/-1
	gen exp_share = (dollar / total_exp) * 100
	save "Gomrok Data\DTA Data\topfive`i'", replace
	
}

use  "Gomrok Data\DTA Data\topfive1384", clear

foreach i in 1390 1402{
	
	append using "Gomrok Data\DTA Data\topfive`i'"
}
putexcel set "Results\graphs\graphs", modify sheet("Top 5 countries")
graph bar (mean) exp_share, over(country, sort(dollar)) over(year) ascategory asyvars stack legend(on rows(2) size(small)) title(پنج مقصد اصلی صادرات ایران , pos(12)) ytitle(سهم در صادرات)
graph export "Results\graphs\Totals\Top 5 export countries.png", replace 
putexcel (M4) = image(Results\graphs\Totals\Top 5 export Countries) 

* Notes

putexcel set "Results\graphs\graphs" ,sheet("Top 5 countries") modify
putexcel A3= "پنج مقصد اصلی صادرات ایران"

*/










