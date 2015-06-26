#!/bin/ksh
echo $0

filepath=$(echo "$0"|awk -F'/' '
		BEGIN{
		i=2
		}
		{
		while(i<NF) {
			rs=rs"/"$i
			i++
		}
		print rs
		}')
configfile=${filepath}"/"vmlist.ls
if [ ! -f ${configfile} ];then 
	echo $configfile"文件非法"
	exit 1	
fi 
D_USER=root
D_PW=Max6and7
AUTH_FILE=/Users/chenjinlong/.ssh/alivm_rsa
i=1 
cat ${configfile} | while read line
	do
		hostname[${i}]=$(echo $line| awk -F: '{gsub(" |\t","",$1); print $1}')
		hostip[${i}]=$(echo $line| awk -F: '{gsub(" |\t","",$2); print $2}')
		username[${i}]=$(echo $line| awk -F: '{gsub(" |\t","",$3); print $3}')
		passwd[${i}]=$(echo $line| awk -F: '{gsub(" |\t","",$4); print $4}')
		i=$((${i}+1))
	done
hostnum=${#hostname[@]}
i=1
echo "请选择主机(输入序号):"
while (($i<=$hostnum))
	do
		echo $i":" ${hostname[$i]} ${hostip[$i]}
		i=$(($i+1))
	done
select=-1
while [ select -lt 1 -o select -gt $hostnum ] 
	do
		if ${isFirstInput};then
			isFirstInput=false
			echo "请选择:"
		else
			echo "请重新选择:"
		fi
		read select
		
	done
HOST=${hostip[$select]}
USER=${username[$select]:=$D_USER}
PW=${passwd[$select]:=$D_PW}
ssh -i $AUTH_FILE $USER@$HOST
