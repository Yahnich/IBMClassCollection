--  Generate SQL 
--  Version:                   	V7R2M0 140418 
--  Generated on:              	04/25/16 12:49:02 
--  Relational Database:       	BMADE 
--  Standards Option:          	DB2 for i 
Drop PROCEDURE WORKSHOP.UPDATEPRODUCT;
CREATE PROCEDURE WORKSHOP.UPDATEPRODUCT ( 
	IN "ID" CHAR(15) , 
	IN CODE CHAR(15) , 
	IN "DESC" CHAR(50) , 
	IN CAT CHAR(5) , 
	IN "TYPE" CHAR(5) , 
	OUT SUCCESS SMALLINT ) 
	LANGUAGE RPGLE 
	SPECIFIC WORKSHOP.UPDONEPROD 
	DETERMINISTIC 
	MODIFIES SQL DATA 
	CALLED ON NULL INPUT 
	EXTERNAL NAME 'WORKSHOP/IOPRODUCTS(UPDONEPROD)' 
	PARAMETER STYLE GENERAL WITH NULLS ; 
  
COMMENT ON SPECIFIC PROCEDURE WORKSHOP.UPDONEPROD 
	IS 'Update one Product' ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP.UPDONEPROD 
TO MATHY ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP.UPDONEPROD 
TO PUBLIC ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP.UPDONEPROD 
TO QDFTOWN ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP.UPDONEPROD 
TO ROBIN ;


call workshop.updateproduct('1001', 'MAYDV', 'Mayonaise', 'G', 'W', 1);
