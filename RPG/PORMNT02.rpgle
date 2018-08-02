      //********************************************************************


      //                           PORMNT02                                 *


      //                    PO Maintenance - Open Line Items                *


      //********************************************************************


      //                                                                    *


      // This program allows changes to the Open Line Items:                *


      //        Additions                                                   *


      //        Deletions                                                   *


      //        Changes                                                     *


      //                                                                    *


      // INDICATORS:                                                        *


      //   10 - Record not found                                            *


      //   11 - Record exists (duplicate add)                               *


      //   12 - Record added                                                *


      //   13 - Record deleted                                              *


      //   14 - Record changed                                              *


      //   15 - Invalid Transaction                                         *


      //********************************************************************


      // PO Transaction File


     FPOTRANS_PFIF   E             DISK


      // Open Line Items File


     FPOOPNLI_LFUF A E           K DISK


      // Maintenance Printer File


     FPOPMNT02  O    E             PRINTER OFLIND(OverFlow) INDDS(Indicators)



     D Indicators      DS


     D  RecNotFound           10     10N


     D  RecExists             11     11N


     D  RecAdded              12     12N


     D  RecDeleted            13     13N


     D  RecChanged            14     14N


     D  InvalidTrans          15     15N



　


      // Build the Line Item Key


     C     LItmKey       KLIST


     C                   KFLD                    POTPONBR


     C                   KFLD                    POTITMNBR



      // Write headings on first page of report


      /FREE


       Write Heading;



       // Read first transaction record


       Read POTrans_PF;



       DoW not %eof(POTrans_PF);



         // Reset  Indicators


         RecNotFound = *off;


         RecExists = *off;


         RecAdded = *off;


         RecDeleted = *off;


         RecChanged = *off;


         InvalidTrans = *off;



         // Process transactions


         Select;



         // Add the code to  check for and handle an Add transacation here



         When Trncode = 'D';


           Exsr DelSr;


         When Trncode = 'C';


           Exsr ChgSr;


         When Trncode = 'A';


           Exsr AddSr;


         Other;


           Exsr InvTrSr;



         EndSl;



         // Read next transaction record


         Read POTrans_PF;



       EndDo;                                                                 //END OF DO



       // EOJ Processing


       Exsr PrtTotals;


       *inlr = *on;



       // Additions - Insert your subroutine to handle additions here


       BEGSR AddSR;


         CHAIN (POTPONBR:POTITMNBR) POOPNLI_LF;



         If %found(POOPNLI_LF);


           RecExists = *ON;


           errCnt = errCnt + 1;


         Else;


           ponbr = potponbr;


           ITMNBR = potitmnbr;


           POLQTYOO = POTQTYOO;


           POLITMCOST = POTITMCOST;


           POLDATREC = POTDATREC;


           POLQTYREC = POTQTYREC;


           POLSTATUS = POTSTATUS;



           Write(E) POLINE_FMT;


           If %Error;


              InvalidTrans = *on;


              Errcnt = Errcnt + 1;


           Else;


              RecAdded = *on;


              addCnt = addCnt + 1;


           EndIF;


         EndIf;


         Exsr PrtPOOrig;


         Exsr PrtDetail;


       ENDSR;



       // Deletions


       BEGSR DelSR;



         // Delete the record


         // If no record found (Error), set RecNotFound


         // If record exists (OK), delete and set RecDeleted


         DELETE LItmKey POOPNLI_LF;


         If %found(POOPNLI_LF);


           RecDeleted = *ON;


           PONbr = PotPONbr;


           Itmnbr =  POTITMNBR;


           Delcnt = Delcnt + 1;



         Else;


           RecnotFound = *on;


           Errcnt = Errcnt + 1;


         EndIf;



         Exsr PrtDetail;


       ENDSR;



       // Changes


       BEGSR ChgSr;


         // Check for record


         CHAIN LItmKey POOPNLI_LF;



         If %found(POOPNLI_LF);


           // Print Original fields


           Exsr PrtPOOrig;


           // Update quantity


           ponbr = potponbr;


           ITMNBR = potitmnbr;


           POLQTYOO = POTQTYOO;


           POLITMCOST = POTITMCOST;


           POLDATREC = POTDATREC;


           POLQTYREC = POTQTYREC;


           POLSTATUS = POTSTATUS;


           // Change the record


           UPDATE POLINE_FMT;


           // If record exists, set RecChanged


           RecChanged = *ON;


           Chgcnt = Chgcnt + 1;


         Else;


           RecnotFound = *on;  // Set if no record found


           Errcnt = Errcnt + 1;


         EndIf;



         // Print transaction


         Exsr PrtDetail;



       ENDSR;



       // Invalid Transaction


       BegSr InvTrSr;


         InvalidTrans = *on;


         Errcnt = Errcnt + 1;


         Exsr PrtDetail;


         InvalidTrans = *off;


       EndSr;



       // Print Totals Subroutine


       Begsr PrtTotals;


         TotCnt = ChgCnt + DelCnt + ErrCnt + Addcnt;


         ExSr CheckOV;


         Write Total;


       EndSr;



       //  Print original record fields, transaction and new fields


       BegSr PrtPOOrig;


         ExSr CheckOV;


         Write POOrig;


       EndSr;



       //  Print transaction


       BegSr PrtDetail;


         ExSr CheckOV;


         Write TrnDetail;


       EndSr;



       // Check for Overflow


       BegSr CheckOV;


         If OverFlow;


           Write Heading;


           OverFlow = *off;


         EndIf;


       EndSr;



      /END-FREE 
