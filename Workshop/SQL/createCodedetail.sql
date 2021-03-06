--  Generate SQL 
--  Version:                   	V7R2M0 140418 
--  Generated on:              	23/05/17 13:19:02 
--  Relational Database:       	TALENTIT 
--  Standards Option:          	DB2 for i 
CREATE PROCEDURE WORKSHOP/CREATECODEDETAIL ( 
	IN IDCODE CHAR(3) , 
	IN CODEDET CHAR(9) , 
	IN "DESC" CHAR(30) , 
	OUT SUCCESS SMALLINT ) 
	DYNAMIC RESULT SETS 1 
	LANGUAGE RPGLE 
	SPECIFIC WORKSHOP/CREATECODEDETAIL 
	NOT DETERMINISTIC 
	MODIFIES SQL DATA 
	CALLED ON NULL INPUT 
	EXTERNAL NAME 'WORKSHOP/IOCODES(CRTONECODDET)' 
	PARAMETER STYLE SQL ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/CREATECODEDETAIL 
TO MATHY ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/CREATECODEDETAIL 
TO PIETER ; 
  
GRANT EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/CREATECODEDETAIL 
TO PUBLIC ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/CREATECODEDETAIL 
TO TSECOFR ;
