--  Generate SQL 
--  Version:                   	V7R2M0 140418 
--  Generated on:              	23/05/17 13:18:36 
--  Relational Database:       	TALENTIT 
--  Standards Option:          	DB2 for i 
CREATE PROCEDURE WORKSHOP/CREATEADDRESS ( 
	IN "ID" CHAR(15) , 
	IN REF CHAR(15) , 
	IN STREET CHAR(30) , 
	IN NUMBER CHAR(5) , 
	IN BOX CHAR(5) , 
	IN ZIP CHAR(15) , 
	IN CITY CHAR(20) , 
	IN COUNTRY CHAR(3) , 
	IN ATYPE CHAR(5) , 
	OUT SUCCESS SMALLINT ) 
	DYNAMIC RESULT SETS 1 
	LANGUAGE RPGLE 
	SPECIFIC WORKSHOP/CRTONEADDR 
	NOT DETERMINISTIC 
	MODIFIES SQL DATA 
	CALLED ON NULL INPUT 
	EXTERNAL NAME 'WORKSHOP/IOADDRESS(CRTONEADDR)' 
	PARAMETER STYLE SQL ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/CRTONEADDR 
TO JENTE ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/CRTONEADDR 
TO MATHY ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/CRTONEADDR 
TO PIETER ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/CRTONEADDR 
TO PUBLIC ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/CRTONEADDR 
TO WITO ;