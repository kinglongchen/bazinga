#!/bin/ksh
bashpath=`pwd` 
dirname $0|grep "^/" >/dev/null 
if [ $? -eq 0 ];then 
bashpath=`dirname $0` 
else 
dirname $0|grep "^\." >/dev/null 
retval=$? 
if [ $retval -eq 0 ];then 
bashpath=`dirname $0|sed "s#^.#$bashpath#"` 
else 
bashpath=`dirname $0|sed "s#^#$bashpath/#"` 
fi 
fi 
filename=$(echo "$0"|awk -F'/' '{print $NF}')
echo ${basepath}
