/*    SOME DOPE ASS PROGRAMMING YO      */


/* THIS DOES SOMETHING IDK WHAT THO LOL */


PGMSTART:       PGM


/*                             DECLARATIONS                                   */


                DCL &DAY *CHAR 2


                DCL &MONTH *CHAR 2


                DCL &YEAR *CHAR 2


                DCL &MSGID *CHAR 7


                DCL &MSGDTA *CHAR 100


                DCL &MSGF *CHAR 10


                DCL &MSGFLIB *CHAR 10


                DCL &ERRORSW *LGL


                MONMSG MSGID(CPF0000) EXEC(GOTO ERROR)


/*                             ROUTINES                                       */


                RTVSYSVAL SYSVAL(QDAY) RTNVAR(&DAY)


                RTVSYSVAL SYSVAL(QMONTH) RTNVAR(&MONTH)


                RTVSYSVAL SYSVAL(QYEAR) RTNVAR(&YEAR)


                SNDPGMMSG MSG('THE CURRENT DATE IS ' *CAT &DAY *CAT '/' +


                *CAT &MONTH *CAT '/' *CAT &YEAR)


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
