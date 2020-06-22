#!/bin/bash

val=$1
re='^[0-9]+$'
if ! [[ $val =~ $re ]] ; then
   echo "1" 
else 
   echo "0"
fi
