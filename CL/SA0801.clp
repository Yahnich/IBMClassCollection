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


                DCL &char10 *CHAR 10


                DCL &char24 *CHAR 24


                DCL &dec50 *DEC LEN(5 0)


                DCL &dec72 *DEC LEN(7 2)


                DCL &lgl1 *LGL


/* ======================== ERROR VARIABLES ================================= */


                DCL &MSGID *CHAR 7


                DCL &MSGDTA *CHAR 100


                DCL &MSGF *CHAR 10


                DCL &MSGFLIB *CHAR 10


                DCL &ERRORSW *LGL


                MONMSG MSGID(CPF0000) EXEC(GOTO ERROR)


/* ======================== PROCEDURES ====================================== */


                CHGVAR &char10 'My Library'


                CHGVAR &char24 'This variable is 24 long'


                CHGVAR &dec50  12345


                CHGVAR &dec72  12345,67


                CHGVAR &lgl1   '1'


 DUMP:          DMPCLPGM


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


THEEND:         ENDPGM 
