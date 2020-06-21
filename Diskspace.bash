#!/bin/bash

>/tmp/Mail.out
disk=$(df -h | awk '$NF=="/" { printf "%s" ,$5}')

SUBJECT="Disk Space"

MESSAGE="/tmp/Mail.out"

TO="srid199008@gmail.com"

  echo "Disk space: $disk" >> $MESSAGE
