--  Generate SQL 
--  Version:                   	V7R2M0 140418 
--  Generated on:              	23/05/17 13:34:01 
--  Relational Database:       	TALENTIT 
--  Standards Option:          	DB2 for i 
CREATE PROCEDURE WORKSHOP/READPRODUCTPRICEFROMDATE ( 
	IN PRODID CHAR(15) , 
	IN SDATE DATE ) 
	DYNAMIC RESULT SETS 1 
	LANGUAGE RPGLE 
	SPECIFIC WORKSHOP/GETALLPRIBYDAT 
	NOT DETERMINISTIC 
	READS SQL DATA 
	CALLED ON NULL INPUT 
	EXTERNAL NAME 'WORKSHOP/IOPRICES(GETALLPRIBYDAT)' 
	PARAMETER STYLE SQL ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/GETALLPRIBYDAT 
TO JELTE ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/GETALLPRIBYDAT 
TO MATHY ; 
  
GRANT EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/GETALLPRIBYDAT 
TO PUBLIC ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/GETALLPRIBYDAT 
TO TSECOFR ;