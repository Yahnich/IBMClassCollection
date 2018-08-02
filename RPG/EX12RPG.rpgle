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


     D  BalanceLow            60     60N



      ******************************************************************



       TodaysDate = %date(*date); // Get date from system


       ExFmt     Prompt_Fmt; // Prompt for vendor number



       DoW Not Exit OR Cancel; // Do the following until user presses F3 (Exit)


           BalanceLow = *Off;


BP         NotFound= *off; // Initialize the record found indicator


           Chain VndNbr Vendor_PF; // Find the vendor record



BP         If %Found(Vendor_PF);  // If we find a valid vendor record:


              If vndBalance > 5000;


                  BalanceLow = *On;


              EndIf;


              ExFmt Dsply_Fmt;    // Disply the vendor record


BP         Else;               // We did not find a record


BP            NotFound = *on;  // Set the record found indicator on


           EndIf;



                 ExFmt Prompt_Fmt; // Prompt for a new vendor number


       EndDo;



       *inLr = *on;  // End the program


      ******************************************************************


 
