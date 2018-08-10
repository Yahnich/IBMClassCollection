     H DftActGrp(*No) ActGrp(*Caller) Option(*Srcstmt)

     FDynFSDSPF CF   E             Workstn Sfile(Record:Rrn)
     F                                     IndDS(WkStnIndics)

     D WkStnIndics     DS
     D  Exit                   3      3N
     D  SflEnd                90     90N
     D  SflDspCtl             85     85N
     D  SflDsp                95     95N
     D  SflClr                75     75N
     D  Protect               30     30N

     D Rrn             S              4  0 INZ(1)
     D EmptySfl        S               N
     D Sequence        S             20A

     D SqlString       S            100A

      /FREE
       Exec Sql
        set option commit=*none;

      /END-FREE
      /FREE
       DoW not Exit;
         ExSR Search;
       EndDo;

       ExSR CloseCursor;
       *InLr = *on;

        // subroutines
       BegSR *InzSR;     // Initialization subroutine
         Write FNKeys;
         SflDspCtl = *On;
         Exfmt Control;
         ExSR Prepare;
         ExSR Declare;
         Protect = *on;
       Endsr;

       BegSR Search;
         ExSr SFLClear;         // Clear subfile for new search

         ExSR OpenCursor;       // Position file cursor
                                // using search key
         ExSR FetchRow;         // Fetch first row

         Rrn = 1;               // Rrn set to 1 even if we are at EOF
         Exsr Fill;             // Fill Subfile
         Exsr Prompt;           // Prompt for new department
       EndSR;

       Begsr Fill;

        // Load entire subfile
        DoW  SqlCod <> 100 AND (Rrn < 9999);
           Write Record;
           ExSR FetchRow;       // Process remaining rows
           Rrn = Rrn + 1;
         Enddo;

         EmptySfl = (Rrn <= 1); // No records to display?
         SflEnd = (SqlCod = 100); // Also should consider whether or not Sflpage has
                                  // been filled. Future enhancement.
       Endsr;

       Begsr Prompt;

         If NOT EmptySfl;

           SflDspCtl = *ON; // Display Subfile
           SflDsp = *ON;

         Else;

           SflDspCtl = *ON; // No records to view - display message
           SflDsp = *OFF;
           Write Msg;
         Endif;

         Exfmt Control;
       Endsr;

       Begsr SFLCLear;   // Subfile clear subroutine
         SflClr = *on;
         SflDsp = *OFF;
         SflDspCtl = *OFF;
         Write Control;  // New search - clear subfile
         SflClr = *off;
         ExSR CloseCursor;
       EndSR;
      /END-FREE
       // Build Select String Variable and Prepare it once
      /FREE
       BegSR Prepare;

       //  If EMPORDER = 'Y';
       //      Sequence = 'EmpNo';
       //  Else;
       //      Sequence = 'LastName';
       //  EndIf;

         SqlString = 'Select WorkDept, EmpNo, LastName ' +
                     'From EMPLOYEE ' +
                     'Where WorkDept = ''' + WorkDept + ''' ' +
                     'Order by ?';
         EXEC SQL
             Prepare SqlStmt FROM :SqlString;
       EndSR;
       /END-FREE
       // Declare Cursor
       /FREE
       BegSR Declare;
          EXEC SQL
             DECLARE SqlCsr CURSOR FOR SqlStmt;
       EndSR;
       /END-FREE
       // Open Cursor
       /FREE
       BegSR OpenCursor;
         EXEC SQL
             Open SqlCsr;
       EndSR;
       /END-FREE
       // Process a row
       /FREE
       BegSR FetchRow;
          EXEC SQL
             Fetch Next From SqlCsr
             Into :WorkDept, :EmpNo, :LastName;
       EndSR;
       /END-FREE
       // Close cursor
       /FREE
       BegSR CloseCursor;
           Exec SQL
             Close SqlCsr;
       EndSR;
       /END-FREE 
