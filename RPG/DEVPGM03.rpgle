     D  message        S             30A   INZ('The sum of 2 plus 2 is')


     D  sum            S              3U 0 inz



　


　


　


　


        sum = 2+2;
        message = %trimr(Message) + ' ' + %char(sum);


        Dsply message '*REQUESTER*';


        *InLr = *On; 
