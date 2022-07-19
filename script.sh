#!/bin/bash

MEM=`free -m | awk 'NR==2{printf "%.0f\t\t",  $3*100/$2 }'`
ALERT=100
FLAG=0
if [ $MEM -lt $ALERT ] ; then
   FLAG='1'
fi
echo $FLAG
