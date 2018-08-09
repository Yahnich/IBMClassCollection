      //* Item Master File
     FItem_PF   IF   E           K Disk
      //* Display File
     FItemInqDspCF   E             Workstn

      /FREE
       Dow NOT *In03;
         *In40 = *Off;
         If NOT *In40;
           //* Display details
       EXEC SQL
        SELECT ITMNBR, ITMDESCR, ITMQTYOH, ITMQTYOO, VNDNBR, ITMVNDCAT#
        INTO :ITMNBR, :ITMDESCR, :ITMQTYOH, :ITMQTYOO, :VNDNBR, :ITMVNDCAT#
        FROM Item_PF
        WHERE ITMNBR = :ITMNBR;
           Dow SqlCod = 0;
             *In30 = (ItmQtyOH + ItmQtyOO) < 20;
             Exfmt Detail;

             IF *In03;
               *InLR = *ON;
               Return;
             Endif;
           Enddo;
         Endif;

         //* No Item record found or F12 pressed - display prompt
         *In12 = *OFF;
         Exfmt Prompt;
       Enddo;
       *InLR = *ON;
       Return;

       //***************************************************************
       Begsr *Inzsr;
         PgmNam = 'ITEMINQ';
         Exfmt Prompt;
       Endsr;
      /END-FREE 
