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
     FEX06INTER7CF   E             Workstn Sfile(VSearchDta:RRN)
     F                                     IndDS(WkIndicators)
      // Indicator Data Structure
     D RRN             S              4  0
     D WkIndicators    DS
     D exit                    3      3N
     D endOfSFL               40     40N
     D clrSFL                 75     75N
     D dspDSPCTL              85     85N
     D dspDSP                 95     95N
     D err                    96     96N
     D showText               20     20N

       ExSr InitSfl;
       DoW NOT exit;
           SetLL VndNameInq VNDNAM_LF;
           Read VNDNAM_LF;
           If NOT %eof(VNDNAM_LF);
             RRN = 1;
           EndIf;
           DoW NOT %eof(VNDNAM_LF) AND NOT exit;
             If %subst(VndName: 1:%len(%trim(VndNameInq))) = VndNameInq;
                 Write VSearchDta;
             EndIf;
             RRN += 1;
             Read VNDNAM_LF;
           EndDo;
           If RRN = 0;
               err = *ON;
           Else;
               dspDSP = *ON;
           EndIf;

           dspDSPCTL = *ON;
           Write VSearchCTL;

           dspDSPCTL = *OFF;
           dspDSP = *OFF;
           showText = *ON;
           ExFmt PROMPT_FMT;
           err = *Off;

           ExSR SflClear;
       EndDo;

       *InLR = *ON;



       BegSR InitSfl;
           Write FKEYS_FMT;
           Write HEADER_FMT;
           RRN = 0;
           ExFmt PROMPT_FMT;

           showText = *OFF;
           endOfSFL = *ON;
       EndSr;

       BegSR SflClear;
           clrSFL = *ON;
           Write VSearchCtl;
           clrSFL = *OFF;
           RRN = 0;
       EndSr; 
