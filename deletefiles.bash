#!/bin/bash

file=$1

echo "Delete(D) or compress(C)  $file"

read var

case "$var" in
   "delete")
   echo "$file is deleted"
   echo -ne " $file ">>/home/ec2-user/logDeletedFiles
   rm $file  | date >>/home/ec2-user/logDeletedFiles
   ;;
   "compress")
   gzip $file   
   ;;
esac
