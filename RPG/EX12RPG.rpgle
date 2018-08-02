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
     FEX12DSPFS7CF   E             WorkStn InDDS(WkStnInd)
       // Vendor Data File
     FVendor_PF IF   E           K Disk
       // Report Formats
     FVnpAdr    O    E             Printer OflInd(PrtOver)

     D ToDaysDate      S               D
       // Named indicators used with display file
     D WkStnInd        DS
     D  Exit                   3      3N
     D  Cancel                12     12N
     D  NotFound              99     99N
     D  balanceLow            60     60N
     D  lastVndr       S              5I 0

      ******************************************************************

       TodaysDate = %date(*date); // Get date from system
       ExFmt     Prompt_Fmt; // Prompt for vendor number

       lastVndr = VndNbr;
       DoW Not Exit;
           balanceLow = *Off;
           notFound= *off;
           If Not Cancel;
               Chain VndNbr VENDOR_PF;
           Else;
               Chain lastVndr VENDOR_PF;
           EndIf;

           If %Found(Vendor_PF);
               if vndBalance > 5000;
                   balanceLow = *On;
               EndIf;
               lastVndr = VndNbr;
               ExFmt Dsply_Fmt;
           Else;
               notFound = *On;
           EndIf;

           ExFmt Prompt_Fmt;
       EndDo;

       *inLr = *on;  // End the program
      ******************************************************************
