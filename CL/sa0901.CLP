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


                DCL &num1 *DEC LEN(3 0) VALUE(1)


                DCL &num2 *DEC LEN(3 0) VALUE(2)


                DCL &num3 *DEC LEN(3 0) VALUE(3)


                DCL &num4 *DEC LEN(3 0) VALUE(4)


                DCL &rslt1 *DEC LEN(15 5) VALUE(0)


                DCL &rslt2 *DEC LEN(15 5) VALUE(0)


                DCL &rslt3 *DEC LEN(15 5) VALUE(0)


                DCL &rslt4 *DEC LEN(15 5) VALUE(0)


/* ======================== ERROR VARIABLES ================================= */


                DCL &MSGID *CHAR 7


                DCL &MSGDTA *CHAR 100


                DCL &MSGF *CHAR 10


                DCL &MSGFLIB *CHAR 10


                DCL &ERRORSW *LGL


                MONMSG MSGID(CPF0000) EXEC(GOTO ERROR)


/* ======================== PROCEDURES ====================================== */


EXERC1:         CHGVAR &rslt1 (1 + 2)


                CHGVAR &rslt2 (1 - 2)


                CHGVAR &rslt3 (1 * 2)


                CHGVAR &rslt4 (1 / 2)


                DMPCLPGM


EXERC2:         CHGVAR &rslt1 (&num1 + &num2)


                CHGVAR &rslt1 (&num1 - &num2)


                CHGVAR &rslt1 (&num1 * &num2)


                CHGVAR &rslt1 (&num1 / &num2)


                DMPCLPGM


EXERC3:         CHGVAR &rslt1 (&num1 + &num2)


                CHGVAR &rslt2 (&num1 - &num2)


                CHGVAR &rslt3 (&num1 * &num2)


                CHGVAR &rslt4 (&num1 / &num2)


                DMPCLPGM


EXERC4:         CHGVAR &rslt1 (&num1 * -&num2)


                CHGVAR &rslt2 (&num1 / -&num2)


                CHGVAR &rslt3 (-&num1 * &num2)


                CHGVAR &rslt4 (-&num1 / &num2)


                DMPCLPGM



　


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



　


　


　


　


　


　


　


　


　


　


　


　


　


　


　


　


　


　


THEEND:         ENDPGM 
