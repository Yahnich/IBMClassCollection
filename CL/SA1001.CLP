/*    SOME DOPE ASS PROGRAMMING YO      */


/* THIS DOES SOMETHING IDK WHAT THO LOL */


/* ===========================================================================*/


/* PROGRAM NAME: Some garbage tbh                                             */


/* Author: Radical Larry                                                      */


/* Date Completed: Some day                                                   */


/* Chapter: 8 Exercise: 1                                                     */


/* Program Description: NO NO NO NO NO NO NON ON ON ON ONO N ONONO NON ON     */



PGMSTART:       PGM


/*                             DECLARATIONS                                   */


                DCL &counter *DEC LEN(2 0) VALUE(0)


                DCL &msg *CHAR 19


                DCL &complete *LGL VALUE('0')


                DCL &user *CHAR 10


                DCL &count *CHAR 2


/* ======================== ERROR VARIABLES ================================= */


                DCL &MSGID *CHAR 7


                DCL &MSGDTA *CHAR 100


                DCL &MSGF *CHAR 10


                DCL &MSGFLIB *CHAR 10


                DCL &ERRORSW *LGL


                MONMSG MSGID(CPF0000) EXEC(GOTO ERROR)


/* ======================== PROCEDURES ====================================== */


                DOUNTIL (&complete = '1')


                    CHGVAR &counter (&counter + 1)


                    IF ( &counter = 10 ) DO


                        CHGVAR &complete '1'


                        LEAVE


                    ENDDO


                    IF ( &counter = 5 ) DO


                        CALLSUBR OUTPGMLIBL


                    ENDDO


                    SELECT


                        WHEN (&counter = 2) CALLSUBR PRNTSTUPRF


                        WHEN (&counter = 8) CALLSUBR PRNTSTULIB


                    ENDSELECT


                    CALLSUBR DSPCNT


                ENDDO



　


　


　


　


　


                RETURN


           /* FIRST ERROR MEASURING */


ERROR:          IF COND(&ERRORSW) THEN( SNDPGMMSG MSGID(CPF9999) MSGF(QCPFMSG) +


                MSGTYPE(*ESCAPE) )


                CHGVAR VAR(&ERRORSW) VALUE('1')


              /* SECOND ERROR MEASURING */


ERROR2:         RCVMSG MSGTYPE(*DIAG) MSGDTA(&MSGDTA) MSGID(&MSGID) +


                MSGF(&MSGF) SNDMSGFLIB(&MSGFLIB)


                IF COND(&MSGID *EQ '       ') THEN( GOTO CMDLBL(ERROR3) )


                SNDPGMMSG MSGID(&MSGID) MSGF(&MSGFLIB/&MSGF) MSGDTA(&MSGDTA) +


                MSGTYPE(*DIAG)


                GOTO CMDLBL(ERROR2)


                /* THIRD ERROR MEASURING */


ERROR3:         RCVMSG MSGTYPE(*EXCP) MSGDTA(&MSGDTA) MSGID(&MSGID) +


                MSGF(&MSGF) SNDMSGFLIB(&MSGFLIB)


                SNDPGMMSG MSGID(&MSGID) MSGF(&MSGFLIB/&MSGF) MSGDTA(&MSGDTA) +


                MSGTYPE(*ESCAPE)



/* =========================== SUBROUTINES ================================= */


                SUBR OUTPGMLIBL


                   DSPLIBL OUTPUT(*PRINT)


                ENDSUBR



                SUBR PRNTSTUPRF


                   DSPLIB  LIB(*CURLIB) OUTPUT(*PRINT)


                ENDSUBR



                SUBR PRNTSTULIB


                   RTVJOBA   USER(&USER)


                   DSPUSRPRF USRPRF(&user) OUTPUT(*PRINT)


                ENDSUBR



                SUBR DSPCNT


                    CHGVAR &COUNT &COUNTER


                    CHGVAR &MSG VALUE('THE COUNT IS NOW' *BCAT &COUNT)


                    SNDPGMMSG MSG(&MSG)


                ENDSUBR



THEEND:         ENDPGM 
