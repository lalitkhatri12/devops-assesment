#! /bin/sh
###This Script is to count the HTTPS response from Log file###

To=Team@gmail.com
FILENAME=$1

if [ -e $FILENAME ];
then
        #echo "Log filename is: $FILENAME"

        HTTP500=`grep "HTTP/1.1\" 500" $FILENAME | wc -l`
        HTTP400=`grep "HTTP/1.1\" 400" $FILENAME | wc -l`

        responsecount=$((HTTP500 + HTTP400))

else
        echo "$FILENAME doesnt exists"
        exit 1
fi

        ##Send Email to Team if count is high###

if [ -e previouscount.txt ];
then
        previouscount=`cat previouscount.txt`
        count=$((responsecount - previouscount))
        #echo $count
        if [ $count -gt 100 ];
          then
                echo "HTTP Response Time is in $FILENAME, count is $count" > /tmp/emailbody.txt
                echo "sending email"
                echo "Subject:HTTP Response Time in apache log file"|sendmail -v $To < /tmp/emailbody.txt
                echo $responsecount > previouscount.txt
        else
                echo "response count is less than 100"
        fi
else
        echo $responsecount > previouscount.txt
        echo "previous count file is created."
	      if [ $responsecount -gt 100 ];
          then
                echo "HTTP Response Time is in $FILENAME, count is $responsecount" > /tmp/emailbody.txt
                echo "sending email"
                echo "Subject:HTTP Response Time in apache log file"|sendmail -v $To < /tmp/emailbody.txt
        else
                echo "response count is less than 100"
        fi
fi
