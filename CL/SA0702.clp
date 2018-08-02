/*    SOME DOPE ASS PROGRAMMING YO      */


/* THIS DOES SOMETHING IDK WHAT THO LOL */


PGMSTART:       PGM


/*                             DECLARATIONS                                   */


                DCL &USER *CHAR 10


                DCL &PGRM *CHAR 9 VALUE('SA0701ST7')


                DCLF ARTICLE


                DCL &MSGID *CHAR 7


                DCL &MSGDTA *CHAR 100


                DCL &MSGF *CHAR 10


                DCL &MSGFLIB *CHAR 10


                DCL &ERRORSW *LGL


                MONMSG MSGID(CPF0000) EXEC(GOTO ERROR)



                RTVJOBA    *N &USER



/*                             ROUTINES                                       */


                SNDPGMMSG MSG('I HAVE OPENED THE FILE YAY')


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
