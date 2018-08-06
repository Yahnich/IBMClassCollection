**FREE
// Vendor Display Formats
// Vendor master File
dcl-f VNDNAM_LF Disk keyed Usage(*Input);
// Display File
dcl-f EX09INTER7 Workstn Sfile(VSearchDta:RRN) IndDS(WkInd);
// Indicator Data Structure
dcl-s RRN Zoned(4);
dcl-s rrnCount Zoned(5);

dcl-s emptySfl Ind;
dcl-ds WkInd;
  exit Ind pos(03);
  pageDown Ind pos(30);
  pageUp Ind pos(31);
  endOfSFL Ind pos(40);
  beginOfSFL Ind pos(41);
  clrSFL Ind pos(75);
  dspDSPCTL Ind pos(85);
  dspDSP Ind pos(95);
  err Ind pos(96);
End-Ds;

ExSr InitSfl;

DoW NOT exit;
    Select;
        When pageDown;
            ExSr NextPage;
        When pageDown;
            ExSr PreviousPage;
        Other;
            ExSR SearchRTN;
     EndSl;
EndDo;

*InLR = *ON;



BegSR InitSfl;
    SflSize = 16;
    endOfSFL = *ON;
    beginOfSFL = *ON;
    dspDSPCTL = *ON;
    Write FKEYS_FMT;
    Write HEADER_FMT;
    ExFmt PROMPT_FMT;
EndSr;

BegSr CheckBOF;
  ReadP VNDNAM_LF;
  beginOfSFL = %EOF(VNDNAM_LF);
  if beginOfSFL;
    SetLL *Start VNDNAM_LF;
  EndIf;
  Read VNDNAM_LF;
EndSr;

BegSR SearchRTN;
    ExSr SflClear;
    SetLL VndNameInq VNDNAM_LF;
    ExSr CheckBOF;
    RRN = 1;
    ExSr Fill;
    ExSr Prompt;
EndSr;

BegSR Fill;
    rrnCount = 1;
    DoW NOT %eof(VNDNAM_LF) AND (RrnCount <= (SflSize - 1));
        Write VSearchDta;
        Read VNDNAM_LF;
        RRN += 1;
        rrnCount += 1;
    EndDo;
    endOfSFL = %eof(VNDNAM_LF);
    emptySfl = (RRN = 0);
EndSr;

BegSr NextPage;
    ExSr Fill;
    ExSr Prompt;
EndSr;

BegSr PreviousPage;
    Chain 1 VSEARCHDTA;
    ExSr SflClear;

    SetLL VNDNAMEINQ VNDNAM_LF;
    ReadP VNDNAM_LF;
    rrnCount = 1;
    DoW (NOT %EOF(VNDNAM_LF) AND (rrnCount <= (SflSize - 1) ) );
        ReadP VNDNAM_LF;
        rrnCount += 1;
    EndDo;
    ExSr CheckBOF;
    rrn = 1;
    ExSr Fill;
    ExSr Prompt;
EndSr;

BegSr Prompt;
    If emptySfl;
        Write MSG;
        beginOfSFL = *On;
        beginOfSFL = *On;
    Else;
        sflRrn = RRN - 1;
    EndIf;
    dspDSP = NOT emptySfl;
    dspDSPCTL = *ON;
    Write VSearchCTL;
    Write VSEARCHCTL;
    ExFmt PROMPT_FMT;
    Read VSEARCHCTL;
EndSr;

BegSr SflClear;
    clrSFL = *ON;
    dspDSPCTL = *OFF;
    dspDSP = *OFF;
    Write VSearchCtl;
    clrSFL = *OFF;
EndSr;
 
