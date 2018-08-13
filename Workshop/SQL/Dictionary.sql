--  Generate SQL 
--  Version:                   	V6R1M0 080215 
--  Generated on:              	15/09/11 10:32:44 
--  Relational Database:       	H10F7273 
--  Standards Option:          	DB2 for i 
  
CREATE TABLE Workshop.DICTIONARY ( 

	NAME CHAR(30) CCSID 37 NOT NULL DEFAULT '' , 
	DESCR CHAR(30) CCSID 37 NOT NULL DEFAULT '' , 
	DATE DATE NOT NULL DEFAULT CURRENT_DATE , 
	ID DECIMAL(10, 0) NOT NULL DEFAULT 0 , 
	STREET CHAR(40) CCSID 37 NOT NULL DEFAULT '' , 
	CITY CHAR(40) CCSID 37 NOT NULL DEFAULT '' , 
	Zip CHAR(10) CCSID 37 NOT NULL DEFAULT '' , 
	COUNTRY CHAR(2) CCSID 37 NOT NULL DEFAULT '' , 
	LANGUAGE CHAR(2) CCSID 37 NOT NULL DEFAULT '' , 
	TEL CHAR(20) CCSID 37 NOT NULL DEFAULT '' , 
	VATNR CHAR(20) CCSID 37 NOT NULL DEFAULT '' , 
	PRICE DECIMAL(10, 2) NOT NULL DEFAULT 0 , 
	TAX CHAR(4) CCSID 37 NOT NULL DEFAULT '' , 
	QTY DECIMAL(7, 0) NOT NULL DEFAULT 0 )   
	RCDFMT FRFR       ; 
  
LABEL ON COLUMN Workshop.DICTIONARY 
( Name IS 'Name' , 
	DESCR IS 'Description' , 
	DATE IS 'Date' , 
	City IS 'City' , 
	Zip IS 'Zipode' , 
	COUNTRY IS 'Countrycode' , 
	LANGUAGE IS 'Language code' , 
	TEL IS 'Phone' , 
	TAX IS 'TAX code' , 
	QTY IS 'Quantity' ) ; 
  
LABEL ON COLUMN Workshop.DICTIONARY 
( Name TEXT IS 'Name' , 
	DESCR TEXT IS 'Description' , 
	Date TEXT IS 'Date' , 
	ID TEXT IS 'ID' , 
	Street TEXT IS 'Street' , 
	City TEXT IS 'City' , 
	Zip TEXT IS 'Zipode' , 
	COUNTRY TEXT IS 'Countrycode' , 
	LANGUAGE TEXT IS 'Language code' , 
	TEL TEXT IS 'Phone' , 
	VATNR TEXT IS 'VATNR' , 
	Price TEXT IS 'Price' , 
	TAX TEXT IS 'TAX code' , 
	QTY TEXT IS 'Quantity' ) ;
