--  Generate SQL 
--  Version:                   	V7R2M0 140418 
--  Generated on:              	04/25/16 17:02:50 
--  Relational Database:       	BMADE 
--  Standards Option:          	DB2 for i 
drop PROCEDURE WORKSHOP.CREATECONTACT ;
CREATE PROCEDURE WORKSHOP.CREATECONTACT ( 
	IN IDCONTACT CHAR(15) , 
	IN IDCUST CHAR(15) , 
	IN LNAME CHAR(30) , 
	IN FNAME CHAR(30) , 
	IN PHONE CHAR(20) , 
	IN MOBILE CHAR(20) , 
	IN EMAIL CHAR(30) , 
	IN TITLE CHAR(15) , 
	IN PREF CHAR(5) , 
	IN LANG CHAR(5) , 
	OUT Success SMALLINT ) 
	LANGUAGE RPGLE 
	SPECIFIC WORKSHOP.CREATECONTACT 
	NOT DETERMINISTIC 
	MODIFIES SQL DATA 
	CALLED ON NULL INPUT 
	EXTERNAL NAME 'WORKSHOP/IOCONTACT(CRTONECONT)' 
	PARAMETER STYLE GENERAL WITH NULLS ; 
  
COMMENT ON SPECIFIC PROCEDURE WORKSHOP.CREATECONTACT 
	IS 'Create a contact for a customer' ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP.CREATECONTACT 
TO MATHY ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE WORKSHOP.CREATECONTACT 
TO PUBLIC ;


set schema workshop;

select * from contact;

call WORKSHOP.CREATECONTACT ('325', '174', 'Test', 'Test', '1111', '2222', 'a@b.com', 'Dir', 'Mr.', 'Fr', 1);
