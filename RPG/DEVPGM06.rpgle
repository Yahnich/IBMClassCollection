     FITEM_PF   IF   E             Disk


     FITPCOST   O    E             Printer OflInd(Overflow)



        Read ITEM_PF;


        Write Heading;


        // Start read loop until end of file


        Dow Not %Eof(ITEM_PF);


            ITMCOSTOH = ITMCOST * ITMQTYOH;


            TOTCOSTOH = TOTCOSTOH + ITMCOSTOH;


            If Overflow;


            Overflow = *Off;


            EndIf;


            Write Detail;


            Read ITEM_PF;


        EndDo;


        Write Total;


        *InLr = *On
