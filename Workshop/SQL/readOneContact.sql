--  Generate SQL 
--  Version:                   	V7R2M0 140418 
--  Generated on:              	23/05/17 13:31:54 
--  Relational Database:       	TALENTIT 
--  Standards Option:          	DB2 for i 
CREATE PROCEDURE WORKSHOP/READONECONTACT ( 
	IN IDCONTACT CHAR(15) ) 
	DYNAMIC RESULT SETS 1 
	LANGUAGE RPGLE 
	SPECIFIC WORKSHOP/READONECONTACT 
	DETERMINISTIC 
	READS SQL DATA 
	CALLED ON NULL INPUT 
	EXTERNAL NAME 'WORKSHOP/IOCONTACT(READONECONTACT)' 
	PARAMETER STYLE GENERAL WITH NULLS ; 
  
COMMENT ON SPECIFIC PROCEDURE WORKSHOP/READONECONTACT 
	IS 'Reads one contact for a relation' ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/READONECONTACT 
TO MATHY ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/READONECONTACT 
TO PUBLIC ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/READONECONTACT 
TO TSECOFR ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/READONECONTACT 
TO WOUTER ;