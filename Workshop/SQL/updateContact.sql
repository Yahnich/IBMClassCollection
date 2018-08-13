--  Generate SQL 
--  Version:                   	V7R2M0 140418 
--  Generated on:              	24/05/17 15:57:02 
--  Relational Database:       	TALENTIT 
--  Standards Option:          	DB2 for i 
CREATE PROCEDURE WORKSHOP/UPDATECONTACT ( 
	IN "ID" CHAR(15) , 
	IN IDCUS CHAR(15) , 
	IN LNAME CHAR(30) , 
	IN FNAME CHAR(30) , 
	IN PHONE CHAR(20) , 
	IN MOBILE CHAR(20) , 
	IN EMAIL CHAR(30) , 
	IN TITLE CHAR(15) , 
	IN PREF CHAR(5) , 
	IN LANG CHAR(5) , 
	OUT SUCCESS SMALLINT ) 
	DYNAMIC RESULT SETS 1 
	LANGUAGE RPGLE 
	SPECIFIC WORKSHOP/UPDONECONT 
	NOT DETERMINISTIC 
	MODIFIES SQL DATA 
	CALLED ON NULL INPUT 
	EXTERNAL NAME 'WORKSHOP/IOCONTACT(UPDONECONT)' 
	PARAMETER STYLE SQL ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/UPDONECONT 
TO JELTE ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/UPDONECONT 
TO MATHY ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/UPDONECONT 
TO PUBLIC ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/UPDONECONT 
TO TSECOFR ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/UPDONECONT 
TO WOUTER ;
