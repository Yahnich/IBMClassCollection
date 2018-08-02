 GREET:      PGM        PARM(&txt1 &txt2 &txt3 &dec1 &dec2)


             DCL        &loan *DEC LEN(7 2)


             DCL        &flag *LGL VALUE('0')


             DCLF       WULOANPST7


          /* MONMSG     CPFXXXX EXEC( GOTO INVALID )   */


             CHKOBJ     OBJ(WULOANPST7)  OBJTYPE(*FILE)



             DOUNTIL (&flag *EQ '1')


                 RCVF


                 MONMSG CPF0864 EXEC( GOTO EOF )


                 CHGVAR &loan value(&loan + &arpric)


             ENDDO



END:         RETURN



　


EOF:         GOTO END


             CHGVAR &flag VALUE('1')


INVALID:     SNDPGMMSG MSG('File doesn''t exist or user is not authorized')


             GOTO END


             ENDPGM



　


　


　


　


　


　


　


　


　


　


　


　


　


　


　


　


　


　


 
