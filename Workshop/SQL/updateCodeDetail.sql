--  Generate SQL 
--  Version:                   	V7R2M0 140418 
--  Generated on:              	24/05/17 15:56:41 
--  Relational Database:       	TALENTIT 
--  Standards Option:          	DB2 for i 
CREATE PROCEDURE WORKSHOP/UPDATECODEDETAIL ( 
	IN IDCODE CHAR(3) , 
	IN CODEDET CHAR(9) , 
	IN CODEDESC CHAR(30) , 
	OUT SUCCESS SMALLINT ) 
	DYNAMIC RESULT SETS 1 
	LANGUAGE RPGLE 
	SPECIFIC WORKSHOP/UPDATECODEDETAIL 
	NOT DETERMINISTIC 
	MODIFIES SQL DATA 
	CALLED ON NULL INPUT 
	EXTERNAL NAME 'WORKSHOP/IOCODES(UPDONECODDET)' 
	PARAMETER STYLE SQL ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/UPDATECODEDETAIL 
TO JELTE ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/UPDATECODEDETAIL 
TO MATHY ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/UPDATECODEDETAIL 
TO PIETER ; 
  
GRANT EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/UPDATECODEDETAIL 
TO PUBLIC ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/UPDATECODEDETAIL 
TO TSECOFR ;
