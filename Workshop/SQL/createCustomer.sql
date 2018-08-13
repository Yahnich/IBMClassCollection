--  Generate SQL 
--  Version:                   	V7R2M0 140418 
--  Generated on:              	23/05/17 13:19:59 
--  Relational Database:       	TALENTIT 
--  Standards Option:          	DB2 for i 
CREATE PROCEDURE WORKSHOP/CREATECUSTOMER ( 
	IN "ID" CHAR(15) , 
	IN NAME CHAR(50) , 
	IN CUSVAT CHAR(15) , 
	IN PHONE CHAR(20) , 
	IN MOBILE CHAR(20) , 
	IN FAX CHAR(20) , 
	IN EMAIL CHAR(30) , 
	IN WEBSITE CHAR(40) , 
	IN "TYPE" CHAR(5) , 
	IN CLASS CHAR(5) , 
	IN LANG CHAR(5) , 
	IN CUR CHAR(5) , 
	IN PAY CHAR(5) , 
	IN ACT CHAR(100) , 
	IN INFO CHAR(50) , 
	IN ACCNT CHAR(20) , 
	OUT OSUCCESS SMALLINT ) 
	LANGUAGE RPGLE 
	SPECIFIC WORKSHOP/CREATECUSTOMER 
	NOT DETERMINISTIC 
	MODIFIES SQL DATA 
	CALLED ON NULL INPUT 
	COMMIT ON RETURN YES 
	EXTERNAL NAME 'WORKSHOP/IOCUSTOMER(CRTONECUST)' 
	PARAMETER STYLE GENERAL WITH NULLS ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/CREATECUSTOMER 
TO MATHY ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/CREATECUSTOMER 
TO PIETER ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/CREATECUSTOMER 
TO PUBLIC ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/CREATECUSTOMER 
TO TSECOFR ;
