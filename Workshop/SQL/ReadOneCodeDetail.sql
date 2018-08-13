--  Generate SQL 
--  Version:                   	V7R2M0 140418 
--  Generated on:              	23/05/17 13:31:27 
--  Relational Database:       	TALENTIT 
--  Standards Option:          	DB2 for i 
CREATE PROCEDURE WORKSHOP/READONECODEDETAIL ( 
	IN "ID" CHAR(15) , 
	IN CODE CHAR(15) ) 
	DYNAMIC RESULT SETS 1 
	LANGUAGE RPGLE 
	SPECIFIC WORKSHOP/READONECODEDETAIL 
	DETERMINISTIC 
	READS SQL DATA 
	CALLED ON NULL INPUT 
	EXTERNAL NAME 'WORKSHOP/IOCODES(GETONECOD)' 
	PARAMETER STYLE GENERAL WITH NULLS ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/READONECODEDETAIL 
TO MATHY ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/READONECODEDETAIL 
TO PIETER ; 
  
GRANT EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/READONECODEDETAIL 
TO PUBLIC ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/READONECODEDETAIL 
TO TSECOFR ;
