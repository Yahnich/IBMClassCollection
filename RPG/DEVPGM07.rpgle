FVendor_PF IF   E             Disk


     FVnpadr03  O    E             Printer OflInd(Overflow)



　


     DfirstBlank       S              3I 0



        Read Vendor_PF;


-       Write Heading;


        // Start read loop until end of file


        Dow Not %Eof(Vendor_PF);


            If (vndActive = 'A');


                firstBlank = %scan(' ':vndSales);


                vndSales1 = %subst(vndSales:1:firstBlank);


                count = count + 1;


            EndIf;


            If Overflow;


            Overflow = *Off;


            EndIf;


            Write Detail;


            Read Vendor_PF;


        EndDo;


        Write Total;


        *InLr = *On;
