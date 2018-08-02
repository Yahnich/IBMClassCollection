DISPLAY:        PGM


                DCLF SA1501DSP


                SNDRCVF



　


                SELECT


                    WHEN ( &option = '1' ) DSPJOB


                    WHEN ( &option = '2' ) WRKSPLF


                    WHEN ( &option = '3' ) WRKSBMJOB


                    OTHERWISE  SNDPGMMSG MSG('YA DONE FUCKED UP NOW')


                ENDSELECT



                RETURN


                ENDPGM



　


　


　


　


             GOTO END


             ENDPGM



　


　


　


　


　


　


　


　


　


　


　


　


　


　


　


　


　


　


 
