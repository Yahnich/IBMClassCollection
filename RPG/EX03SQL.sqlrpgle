     H option(*srcstmt)

      //  Display file BONUSDSPF is declared.
     FBonusDSPF CF   E             WorkStn InDDS(Indicators)


     D Indicators      DS
     D   Exit                         1N   Overlay(Indicators:03)
     D   Cancel                       1N   Overlay(Indicators:12)
     D   Error                        1N   Overlay(Indicators:90)

     D SqlString       S            100A

      //  Format BONUSFMT from display file BONUSDSPF is written and read.
      //  The user will key values into ADDLBONUS and EMPNO.

      /FREE
       ExSR PrepSQL;
       Exfmt BonusFmt;
       Dow Not Exit;
         ExSr StrSql;
         ExSr Fetch;


         Dow SqlCod = 0;
           // For valid employee, calculate new bonus, update record
           // and display result on workstation
           ExSr Update;
           Exfmt BonusDet;
           Select;
           When Exit;
             *InLR = *ON;
             Return;

           When Cancel;
             Leave;
           EndSl;
           ExSr Fetch;
         EndDo;
         Exfmt BonusFmt;
       EndDo;
       If SqlCod <> 0;
         DSPLY 'SQL Terminated Early' '*REQUESTER*';
       EndIf;
       ExSr EndSQL;
       *InLR = *ON;
       Return;

       BegSR PrepSQL;
         Exec SQL
           set option commit = *none;
         SqlString = 'Select EmpNo, Bonus ' +
                     'From Employee ' +
                     'Where EmpNo = ? ' +
                     'For Update of Bonus';

         EXEC SQL
             Prepare SqlStmt FROM :SqlString;
         EXEC SQL
             DECLARE SqlCsr CURSOR FOR SqlStmt;
       EndSr;

       BegSR Update;
         EXEC SQL
           Update Employee
           SET Bonus = Bonus + :AddLBonus
           WHERE Current of SqlCsr;
       EndSr;

       BegSR Fetch;
         EXEC SQL
           Fetch Next FROM SqlCsr
           Into :EmpNo, :Bonus;
       EndSr;

       BegSr StrSql;
         EXEC SQL
             Open SqlCsr USING :EmpNo;
       EndSr;

       BegSR EndSQL;
         Exec SQL
           Close SqlCsr;
       EndSr;

      /END-FREE 
