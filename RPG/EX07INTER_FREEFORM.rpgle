**FREE
// Vendor Display Formats
// Vendor master File
dcl-f VNDNAM_LF Disk keyed Usage(*Input);
// Display File
dcl-f EX06INTER7 Workstn Sfile(VSearchDta:RRN)IndDS(WkInd);
// Indicator Data Structure
dcl-s RRN Zoned(4);
dcl-ds WkInd;
  exit Ind pos(03);
  endOfSFL Ind pos(40);
  clrSFL Ind pos(75);
  dspDSPCTL Ind pos(85);
  dspDSP Ind pos(95);
  err Ind pos(96);
  showText Ind pos(20);
End-Ds;

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
 
