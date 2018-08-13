--  Generate SQL 
--  Version:                   	V7R2M0 140418 
--  Generated on:              	23/05/17 13:35:52 
--  Relational Database:       	TALENTIT 
--  Standards Option:          	DB2 for i 
CREATE PROCEDURE WORKSHOP/REMOVEPRICE ( 
	IN "ID" CHAR(15) , 
	OUT ACTIVE SMALLINT ) 
	DYNAMIC RESULT SETS 1 
	LANGUAGE RPGLE 
	SPECIFIC WORKSHOP/DELONEPRIC 
	NOT DETERMINISTIC 
	MODIFIES SQL DATA 
	CALLED ON NULL INPUT 
	EXTERNAL NAME 'WORKSHOP/IOPRICES(DELONEPRIC)' 
	PARAMETER STYLE SQL ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/DELONEPRIC 
TO JELTE ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/DELONEPRIC 
TO MATHY ; 
  
GRANT EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/DELONEPRIC 
TO PUBLIC ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/DELONEPRIC 
TO TSECOFR ;
