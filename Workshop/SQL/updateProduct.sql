--  Generate SQL 
--  Version:                   	V7R2M0 140418 
--  Generated on:              	24/05/17 15:58:35 
--  Relational Database:       	TALENTIT 
--  Standards Option:          	DB2 for i 
CREATE PROCEDURE WORKSHOP/UPDATEPRODUCT ( 
	IN "ID" CHAR(15) , 
	IN CODE CHAR(15) , 
	IN "DESC" CHAR(50) , 
	IN CAT CHAR(5) , 
	IN "TYPE" CHAR(5) , 
	OUT SUCCESS SMALLINT ) 
	LANGUAGE RPGLE 
	SPECIFIC WORKSHOP/UPDONEPROD 
	DETERMINISTIC 
	MODIFIES SQL DATA 
	CALLED ON NULL INPUT 
	EXTERNAL NAME 'WORKSHOP/IOPRODUCTS(UPDONEPROD)' 
	PARAMETER STYLE GENERAL WITH NULLS ; 
  
COMMENT ON SPECIFIC PROCEDURE WORKSHOP/UPDONEPROD 
	IS 'Update one Product' ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/UPDONEPROD 
TO JELTE ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/UPDONEPROD 
TO JENTE ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/UPDONEPROD 
TO MATHY ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/UPDONEPROD 
TO PUBLIC ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/UPDONEPROD 
TO TSECOFR ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/UPDONEPROD 
TO WOUTER ;
