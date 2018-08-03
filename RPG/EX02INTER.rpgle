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
     FEX02INTER7CF   E             Workstn IndDS(WkIndicators)
      // Indicator Data Structure
     D WkIndicators    DS
     D Exit                    3      3N
     D ShowPrompt              4      4N
     D HighBalance            60     60N
     D NotFound               96     96N
      /FREE
       Write HEADER_FMT;
       Write FKEYS_FMT;
       Exfmt Prompt_fmt; // Display Prompt_Fmt

       Dow NOT Exit;  // Continue process until user presses F3
         Chain Vndnbr_inq Vendor_PF;     // Read record; valid key?
         NotFound = NOT %found(Vendor_PF);
         If ShowPrompt;
             Write Popup;
             ExFmt Popup;
         ElseIf %found(Vendor_PF);
             // Check whether balance owed is greater than 5000.00
             HighBalance = VndBalance > 5000.00;
             // Display details
             Write DSPLY_FMT;
         EndIf;

         // No Item record found or F12 - display prompt
         Exfmt Prompt_fmt; // Redisplay Prompt format

       enddo;
       *InLR = *ON;
       //
      /END-FREE 
