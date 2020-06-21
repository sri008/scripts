#!/bin/bash
service=httpd
email=srid199008@gmail.com


host=`hostname -f`
if (( $(ps -ef | grep -v grep | grep $service | wc -l) > 0 ))
then
   echo "$service is running"
   subject="$service is running"
   echo "$service at $host is running fine!!!" | mail -s "$subject" $email
else
   /etc/init.d/$service start
   if (( $(ps -ef | grep -v grep | grep $service | wc -l) > 0 ))
   then
   subject="$service at $host has been started"
   echo "$service at $host wasn't running and has been started" | mail -s "$subject" $email
   else
   subject="$service at $host is not running"
   echo "$service at $host is stopped and cannot be started!!!" | mail -s "$subject" $email
fi
fi
