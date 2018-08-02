DISPLAY:        PGM



　


                DCL        &msgq  *CHAR 10


                DCL        &msgid *CHAR 7


                RTVJOBA    JOB(&msgq)


                MONMSG     CPF0000 EXEC( GOTO ERROR )


                /* MESSAGING */


                SNDMSG     MSG('This is message number 1') TOMSGQ(&msgq)


                SNDMSG     MSG('This is message number 2') TOMSGQ(&msgq)


                SNDMSG     MSG('This is message number 3') TOMSGQ(&msgq)


                RETURN



ERROR:          RCVMSG     MSGID(&msgid)


                SNDPGMMSG  MSGF(QCPFMSG) +


                           MSGID(&msgid) +


                           MSGTYPE(*ESCAPE)



　


　


                ENDPGM



　


　


　


　


             GOTO END


             ENDPGM



　


　


　


　


　


　


　


　


　


　


　


　


　


　


　


　


　


　


 
