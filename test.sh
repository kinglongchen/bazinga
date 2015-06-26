#!/bin/ksh
i=1
cat vmlist.ls|while read line
	do
		b[${i}]=$i
		echo $i
	done
echo ${b[@]}

asdfa
a\b\c
a\b\c
a\b\c
