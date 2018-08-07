**FREE
// Vendor Display Formats
// Vendor master File
ctl-opt option(*SRCSTMT);
dcl-f VNDNAM_LF Disk keyed Usage(*Input);
// Display File
dcl-f EX11INTER7 Workstn Sfile(VSearchDta:RRN) IndDS(WkInd);

// Indicator Data Structure
dcl-s RRN Zoned(4);
dcl-s rrnCount Zoned(5);

dcl-pr AddProgram extpgm('*LIBL/ADDPROGRAM');

End-Pr;
dcl-pr ChgProgram extpgm('*LIBL/CHGPROGRAM');
   position Packed(5);
End-Pr;
dcl-pr DltProgram extpgm('*LIBL/DLTPROGRAM');
   position Packed(5);
End-Pr;

dcl-s emptySfl Ind;
dcl-ds WkInd;
  exit Ind pos(03);
  create Ind pos(06);
  pageDown Ind pos(30);
  pageUp Ind pos(31);
  endOfSFL Ind pos(40);
  beginOfSFL Ind pos(41);
  clrSFL Ind pos(75);
  dspDSPCTL Ind pos(85);
  dspDSP Ind pos(95);
  showText Ind pos(20);
End-Ds;

ExSr InitSfl;

DoW NOT exit;
    Select;
        When pageDown;
            ExSr NextPage;
        When pageUp;
            ExSr PreviousPage;
        When create;
            ExSr Create;
        Other;
            ExSR SearchRTN;
     EndSl;
EndDo;

*InLR = *ON;



BegSR InitSfl;
    SflSize = 15;
    SflRRN = 1;
    endOfSFL = *ON;
    beginOfSFL = *ON;
    dspDSPCTL = *ON;
    showText = *OFF;
    Write FKEYS_FMT;
    Write HEADER_FMT;
    ExFmt PROMPT_FMT;
EndSr;

BegSr CheckBOF;
    ReadP VNDNAM_LF;
    beginOfSFL = %EOF(VNDNAM_LF);
    if %EOF(VNDNAM_LF);
      SetLL *Start VNDNAM_LF;
    EndIf;
    Read VNDNAM_LF;
EndSr;

BegSR SearchRTN;
    ExSr SflClear;
    SetLL VndName VNDNAM_LF;
    ExSr CheckBOF;

    RRN = 1;
    ExSr Fill;
    ExSr Prompt;
EndSr;

BegSR Fill;
    rrnCount = 1;
    DoW NOT %eof(VNDNAM_LF) AND (RrnCount <= (SflSize));
        Write VSearchDta;
        Read VNDNAM_LF;
        RRN += 1;
        rrnCount += 1;
    EndDo;
    endOfSFL = %eof(VNDNAM_LF);
    emptySfl = (RRN <= 1);
EndSr;

BegSr Prompt;
    If emptySfl;
        message = 'No vendors found.';
//        Write FKEYS_FMT;
        Write MSG;
        beginOfSFL = *On;
    Else;
        sflRrn = RRN - 1;
    EndIf;
    dspDSP = NOT emptySfl;
    dspDSPCTL = *ON;
    showText = *On;


    Write VSEARCHCTL;
    Write HEADER_FMT;
    ExFmt PROMPT_FMT;
    Read VSEARCHCTL;
    If NOT emptySfl;
        ExSr Changes;
    EndIf;
EndSr;

BegSr NextPage;
    ExSr SflClear;
    RRN = 1;
    ExSr Fill;
    ExSr Prompt;
EndSr;

BegSr PreviousPage;
    Chain 1 VSEARCHDTA;
    ExSr SflClear;

    SetLL VndName VNDNAM_LF;
    ReadP VNDNAM_LF;
    rrnCount = 1;
    DoW (NOT %EOF(VNDNAM_LF) AND (rrnCount <= (SflSize) ) );
        ReadP VNDNAM_LF;
        rrnCount += 1;
    EndDo;
    ExSr CheckBOF;
    rrn = 1;
    ExSr Fill;
    ExSr Prompt;
EndSr;

BegSr SflClear;
    clrSFL = *ON;
    dspDSPCTL = *OFF;
    dspDSP = *OFF;
    Write VSearchCtl;
    clrSFL = *OFF;
    beginOfSfl = *OFF;
EndSr;

BegSr InitPgmCall;
  dspDSPCTL = *ON;
  dspDsp = *OFF;
  beginOfSfl = *ON;
EndSr;

BegSr Changes;
    ReadC VSEARCHDTA;

    DoW NOT %EOF(EX11INTER7);
        Select;
            When create;
                ExSr InitPgmCall;
                Message = 'Calling Add Program';
                Write Msg;
                ExFmt VSEARCHCTL;
                CallP(E) AddProgram();
                if %error;
                    Message = 'Add Program failed';
                EndIf;
            When VndMntnc = '2';
                ExSr InitPgmCall;
                Message = 'Calling Change Program';
                Write Msg;
                ExFmt VSEARCHCTL;
                CallP(E) ChgProgram( VndNbr );
                if %error;
                    Message = 'Change Program failed';
                EndIf;
            When VndMntnc = '4';
                ExSr InitPgmCall;
                Message = 'Calling Delete Program';
                Write Msg;
                ExFmt VSEARCHCTL;
                CallP(E) DltProgram( VndNbr );
                if %error;
                    Message = 'Delete Program failed';
                EndIf;
        EndSl;
        ReadC VSEARCHDTA;
    EndDo;
EndSr; 
