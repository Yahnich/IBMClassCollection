      //*************************************************************************


      //                         VNRADR05


      // Active Vendor Report


      //*************************************************************************


      // Print listing of ACTIVE vendors from Vendor_PF file.


      //


      // INDICATORS:


      //   LR - Last record


      //*************************************************************************


     HDATFMT(*USA)


      //*************************************************************************


     FVendor_PF IF   E           K DISK


      // Printer file is program described using system supplied Qprint PRTF


     FQprint    O    F  132        Printer OflInd(*InOF)



      //*************************************************************************


     DToDaysDate       S               D


     DTime             S              6  0


     DCount            S             15  0


      // Add alpha field to contain all of salesperson name that fits report


     DVndSales16       S             16


      //*************************************************************************


      //


      /FREE


       // Obtain job date and current time for report heading


       Eval TodaysDate = %date(*date);


       Except ExcVndHdr;                                                      //Print page 1 heading


       // Using Except opcode to print printer formats defined in O-Specifications


       Read Vendor_Fmt;


       //


       DoW Not %EOF(Vendor_PF);                                               //Process all records


         //                                                                     until End of File


         // Include selection for only active records


         If VndActive = 'A';


           // Move lefmost characters of salesperson into a field that fits report


           VndSales16 = %Subst(VndSales:1:16);



           Except ExcVndDtl;                                                  //Print detail record


           // Keep a count of the records processed


           Count=Count+1;



         EndIf;


         // Read second and subsequent records


         Read Vendor_Fmt;


       EndDo;



       Except ExcVndTot;                                                      //Print record count


       *InLr = *on;


       //*************************************************************************


      /END-FREE


       // Printer output is defined in program written output specifications. You


       // will encounter code like this when maintaining programs that were coded


       // using RPG/400 (RPG III). You should use the RPG IV reference manuals for


       // further information.


     OQPrint    E            ExcVndHdr      3 06


     O         OR    OF


      //                      Page Heading


     O                                              'Page'


     O                       Page             +   2


     O                                           55 'Active Vendors'


     O                       TodaysDate         122


     O                       Time               132 '  :  :  '



     O          E            ExcVndHdr      1


     O         OR    OF


      //                      Column Heading Line # 1


     O                                          114 'Vend'


     O                                          122 'Vendor'



     O          E            ExcVndHdr      1


     O         OR    OF


      //                      Column Heading Line # 2


     O                                            5 'Vend'


     O                                           89 'VND'


     O                                           98 'Zip'


     O                                          104 'Area'


     O                                          114 'Tel'


     O                                          121 'Sales'



     O          E            ExcVndHdr      2


     O         OR    OF


      //                      Column Heading Line # 3


     O                                            5 'Num'


     O                                           32 'Vendor Name              '


     O                                           59 'Vendor Street            '


     O                                           84 'Vendor City            '


     O                                           91 'State'


     O                                           98 'Code'


     O                                          104 'Code'


     O                                          114 'No'


     O                                          122 'Person'



      //*************************************************************************


     O          EF           ExcVndDtl      2


      //                      Vendor Detail Information


     O                       VndNbr        Z      5


     O                       VndName             32


     O                       VndStreet           59


     O                       VndCity             84


     O                       VndState            88


     O                       VndZipcode          98


     O                       VndAreaCd          104


     O                       VndTelNo           114 '0   -    '


     O                       VndSales16         132



     O          EF           ExcVndTot   2


     O                                           32 'Number of active vendors:'


     O                       Count         1     45


     O                                           47 '*' 
