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
     FVNDNAM_LF IF   E           K Disk
      // Display File
     FEX05INTER7CF   E             Workstn Sfile(VSearchDta:RRN)
     F                                     IndDS(WkIndicators)
      // Indicator Data Structure
     D RRN             S              4  0
     D WkIndicators    DS
     D exit                    3      3N
     D endOfSFL               40     40N

       Write FKEYS_FMT;
       Write HEADER_FMT;
       Read VNDNAM_LF;
       RRN = 1;
       DoW NOT %eof(VNDNAM_LF);
           Write VSearchDta;
           Read VNDNAM_LF;
           RRN += 1;
       EndDo;
       endOfSFL = *ON;

       DoW NOT exit;
         ExFmt VSearchCtl;
       EndDo;
       *InLR = *ON;
 
