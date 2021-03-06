--  Generate SQL 
--  Version:                   	V7R2M0 140418 
--  Generated on:              	23/05/17 13:30:19 
--  Relational Database:       	TALENTIT 
--  Standards Option:          	DB2 for i 
CREATE PROCEDURE WORKSHOP/READLASTNUMBER ( 
	IN CAT CHAR(5) , 
	IN "YEAR" DECIMAL(4, 0) ) 
	DYNAMIC RESULT SETS 1 
	LANGUAGE C 
	SPECIFIC WORKSHOP/GETLASTNBR 
	NOT DETERMINISTIC 
	MODIFIES SQL DATA 
	CALLED ON NULL INPUT 
	EXTERNAL NAME 'WORKSHOP/IONUMBERS(GETLASTNBR)' 
	PARAMETER STYLE GENERAL ; 
  
COMMENT ON SPECIFIC PROCEDURE WORKSHOP/GETLASTNBR 
	IS 'Get Last Number' ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/GETLASTNBR 
TO JENTE ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/GETLASTNBR 
TO MATHY ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/GETLASTNBR 
TO PUBLIC ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/GETLASTNBR 
TO TSECOFR ;
