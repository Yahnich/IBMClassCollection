      **********************************************************************
      *                        VNRADR01                                    *
      *                  Vendor Address Inquiry                            *
      **********************************************************************
      * This program prompts the user for a vendor number and displays     *
      * the vendor's address information on the screen.                    *
      *                                                                    *
      * The user has options to exit the program and to print a vendor     *
      * record.                                                            *
      *                                                                    *
      * INDICATORS:                                                        *
      *   Exit      - the user requests to exit the program                *
      *   PrintIt   - the user requests to print vendor address            *
      *   NotFound  -  no vendor found to match the input vendor number    *
      **********************************************************************
      ******************************************************************

       // Vendor Display Formats
             // Vendor master File
     FVendor_PF IF   E           K Disk
      // Display File
     FEX04INTER7CF   E             Workstn IndDS(WkIndicators)
      // Indicator Data Structure
     D MonEnum         S              9A   DIM(12) CTDATA PERRCD(6)
     D DateSigEnum     S              2A   DIM(4) CTDATA
     D dayEnd          S              1A
     D WkIndicators    DS
     D Exit                    3      3N
     D ShowPrompt              4      4N
     D HighBalance            60     60N
     D NotFound               96     96N

     D DataArea        DS                  DTAARA(EX04CMPYS7) Qualified
     D   taxRate                      3  1 Overlay(DataArea:1)
     D   companyName                 57A   Overlay(DataArea:*Next) Inz('help')

       In DataArea;
       dayEnd = %SUBST( %CHAR(*DAY):1 );
       If dayEnd = '0' OR (*DAY > 10 AND *DAY < 20);
           dayEnd = '4';
       EndIf;
       today = %trimr( MonEnum( (*MONTH) ) )
               + ' '
               + %CHAR(*DAY)
               + DateSigEnum( %min( 4:%INT( dayEnd ) ) )
               + ', ' + %CHAR(*YEAR);
       cpyName = DataArea.companyName;
       Write HEADER_FMT;
       Write FKEYS_FMT;
       Exfmt Prompt_fmt; // Display Prompt_Fmt

       Dow NOT Exit;  // Continue process until user presses F3
         Chain Vndnbr_inq Vendor_PF;     // Read record; valid key?
         NotFound = NOT %found(Vendor_PF);
         If ShowPrompt;
       //      Write Popup;
             ExFmt Popup;
         ElseIf %found(Vendor_PF);
             // Check whether balance owed is greater than 5000.00
             vndTax = vndBalance * DataArea.taxRate / 100;
             HighBalance = VndBalance > 5000.00;
             // Display details
             Write DSPLY_FMT;
         EndIf;

         // No Item record found or F12 - display prompt
         Exfmt Prompt_fmt; // Redisplay Prompt format

       enddo;
       *InLR = *ON;

**CtData MonEnum
January  February March    April    May      June
July     August   SeptemberOctober  November December
**CtData DateSigEnum
st
nd
rd
th 
