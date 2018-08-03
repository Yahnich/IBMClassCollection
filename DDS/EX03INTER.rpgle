     A**********************************************************************
     A*                           VNDINQS                             *
     A*              Inquiry by Vendor Number Display File            *
     A**********************************************************************
     A* THIS DISPLAY FILE CONTAINS THESE FORMATS:                     *
     A*                                                               *
     A*     PROMPT_FMT - Prompts for Vendor Number                    *
     A*     DSPLY_FMT  - Displays a vendor record                     *
     A*                                                               *
     A* INDICATORS:                                                   *
     A*   03 - User requests to exit the program                      *
     A*   12 - Cancel (Return to prompt screen)                       *
     A*   60 - Balance due > 5000.00                                  *
     A*   96 - Invalid vendor number                                  *
     A*****************************************************************
     A                                      REF(*LIBL/VENDOR_PF)
     A                                      INDARA
     A          R HEADER_FMT
                                        1  2USER
     A                                  1 30'Vendor Inquiry'
     A                                      COLOR(WHT)
     A                                  1 71SYSNAME
     A            TODAY         20A  O  2 48
     A                                  2 71TIME
     A
     A          R PROMPT_FMT                OVERLAY PUTOVR
     A                                      CA03(03 'End Program')
                                            CA04(04 'Prompt Details')
     A                                  3  3'Vendor number. . . . :'
     A            VNDNBR_INQR     D  B  3 28OVRDTA
                                            COLOR(WHT)
     A                                      REFFLD(VNDNBR DICTIONARY)
     A  96                                  ERRMSG('Invalid vendor number - pre-
     A                                      ss reset and re-enter' 96)
     A          R DSPLY_FMT                 OVERLAY PUTOVR
     A                                  8  3'Name . . . . . . :'
     A                                  9  3'Address  . . . . :'
     A            VNDNAME   R        O  8 24OVRDTA
     A            VNDSTREET R        O  9 24OVRDTA
     A            VNDCITY   R        O 10 24OVRDTA
     A            VNDSTATE  R        O 10 49OVRDTA
     A            VNDZIPCODER        O 10 53OVRDTA
     A                                 11  3'Telephone. . . . :'
     A            VNDAREACD R        O 11 26OVRDTA
     A                                 11 24'('
     A                                 11 30')'
     A            VNDTELNO  R        O 11 33OVRDTA
     A                                      EDTWRD('0  -    ')
     A                                 12  3'Sales Person . . :'
     A            VNDSALES  R        O 12 24OVRDTA
     A                                 13  3'Purchases YTD  . :'
     A            VNDPRCHYTDR          13 24OVRDTA
                                            EDTCDE(J)
     A                                 14  3'Balance Owed . . :'
     A            VNDBALANCER          14 26OVRDTA
                                            EDTCDE(J)
     A  60                                  DSPATR(HI)
     A  60                                  COLOR(RED)
     A

     A          R FKEYS_FMT                 OVERLAY
                                       23  4'F3 = Exit'
     A                                      COLOR(BLU)
                                       23 18'F4 = Display Vendor Detail'
     A                                      COLOR(BLU)
     A                                 22  3'Please press enter to continue'


                R POPUP
                                            WINDOW(07 20 6 40)
                                            WDWBORDER((*COLOR WHT) +
                                            (*CHAR '********'))
                                            WDWTITLE((*TEXT 'Vendor Detail') +
                                            *CENTER *TOP)
     A                                  3  1'Vendor Name. :'
     A                                  4  1'MTD Purchased:'
                  VNDNAME   R        O  3 16
                  VNDPRCHMTDR        O  4 16

                R DUMMY
                                            ASSUME
                                        2  4' '

 
