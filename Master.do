	/*--------------------------------------------------------------------------
			Master file for Trade
			
			Author: Reza Johai
			Date :  1403/09/06
	--------------------------------------------------------------------------*/
	clear all
	macro def wdir "H:\RADrVesal\RA"
	macro def ddir "H:\RADrVesal\RA"

	cd "${wdir}"
	
	// Cleaning
	//use "clean\cleaned",clear
	do "Code\Cleaning"
	
	// Describe the data
	//use "Descriptive\descriptive"  	
	do "Code\Graphs"
		
	// ARDL Models (Not Reliable)
	//use "regression\regression
	do "Code\ARDL Prediction"

	
	// ARIMAX Models
	//use "regression\regression
	do "Code\ARIMA Model"
