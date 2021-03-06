--  Generate SQL 
--  Version:                   	V7R2M0 140418 
--  Generated on:              	24/05/17 15:49:39 
--  Relational Database:       	TALENTIT 
--  Standards Option:          	DB2 for i 
CREATE PROCEDURE WORKSHOP/CREATEQUOTEHEADER ( 
	IN "ID" CHAR(15) , 
	IN CUSID CHAR(15) , 
	IN ADDID CHAR(15) , 
	IN CRTDATE DATE , 
	IN CRTUSR CHAR(15) , 
	IN UPDDATE DATE , 
	IN UPDUSR CHAR(15) , 
	IN REQDLV DATE , 
	IN STATUS CHAR(5) , 
	IN "TYPE" CHAR(5) , 
	IN QTEVAT SMALLINT , 
	IN HTEXT VARCHAR(256) , 
	OUT SUCCESS SMALLINT ) 
	LANGUAGE RPGLE 
	SPECIFIC WORKSHOP/CREATEQUOTEHEADER 
	NOT DETERMINISTIC 
	MODIFIES SQL DATA 
	CALLED ON NULL INPUT 
	EXTERNAL NAME 'WORKSHOP/IOQUOTES(CRTQTEHDR)' 
	PARAMETER STYLE SQL ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/CREATEQUOTEHEADER 
TO JELTE ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/CREATEQUOTEHEADER 
TO JENTE ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/CREATEQUOTEHEADER 
TO MATHY ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/CREATEQUOTEHEADER 
TO PUBLIC ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP/CREATEQUOTEHEADER 
TO WOUTER ;
