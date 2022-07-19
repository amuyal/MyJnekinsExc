#!/bin/bash

MEM=`free -m | awk 'NR==2{printf "%.0f\t\t",  $3*100/$2 }'`
ALERT=$1
FLAG=0
#echo $MEM
if [ $MEM -lt $ALERT ] ; then
   FLAG='kill'
fi
echo $FLAG
