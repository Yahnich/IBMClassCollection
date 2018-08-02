 GREET:      PGM


             DCL        &DAY *CHAR 9 VALUE(WEDNESDAY)



             CHGVAR &DAY VALUE(THURSDAY)


             SNDPGMMSG MSG('VALUE IS' *BCAT &DAY *CAT '/')



             ENDPGM 
