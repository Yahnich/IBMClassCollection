--  Generate SQL 
--  Version:                   	V7R2M0 140418 
--  Generated on:              	24/05/17 15:53:32 
--  Relational Database:       	TALENTIT 
--  Standards Option:          	DB2 for i 
CREATE PROCEDURE WORKSHOP/READONEQUOTE ( 
	IN "ID" CHAR(15) ) 
	DYNAMIC RESULT SETS 1 
	LANGUAGE RPGLE 
	SPECIFIC WORKSHOP/GETONEQTE 
	NOT DETERMINISTIC 
	READS SQL DATA 
	CALLED ON NULL INPUT 
	EXTERNAL NAME 'WORKSHOP/IOQUOTES(GETONEQTE)' 
	PARAMETER STYLE SQL ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/GETONEQTE 
TO JELTE ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/GETONEQTE 
TO JENTE ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/GETONEQTE 
TO MATHY ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/GETONEQTE 
TO PUBLIC ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/GETONEQTE 
TO WOUTER ;