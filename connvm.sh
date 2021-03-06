#/bin
basepath=$(dirname $0)
configfile=$basepath"/"vmlist.ls
#configfile="./"vmlist.ls

if [ ! -f ${configfile} ];then 
	echo $configfile"文件非法"
	exit 1	
fi 
D_USER=root
D_PORT=22
D_PW=Max6and7
AUTH_FILE=~/.ssh/id_rsa
if [ ! -f $AUTH_FILE ];then
	echo $AUTH_FILE"文件不存在"
	exit 1
fi
i=1 
while read line
	do
		hostname[${i}]=$(echo $line| awk -F: '{gsub(" |\t","",$1); print $1}')
		hostip[${i}]=$(echo $line| awk -F: '{gsub(" |\t","",$2); print $2}')
		port[${i}]=$(echo $line| awk -F: '{gsub(" |\t","",$2); print $3}')
		username[${i}]=$(echo $line| awk -F: '{gsub(" |\t","",$3); print $4}')
		passwd[${i}]=$(echo $line| awk -F: '{gsub(" |\t","",$4); print $5}')
		i=$((${i}+1))
	done<${configfile}
hostnum=${#hostname[@]}
i=1
echo "请选择主机(输入序号):"
while (($i<=$hostnum))
	do
		echo $i":" ${hostname[$i]} ${hostip[$i]}
		i=$(($i+1))
	done
select=0
while [ $select -lt 1 -o $select -gt $hostnum ] 
	do
		if [ $select -eq -1 ];then
			exit
		fi
		if ${isFirstInput};then
			isFirstInput=false
			echo "请选择:"
		else
			echo "请重新选择:"
		fi
		read input
		select=$(echo ${input}|awk '{
				if ($0~/[^0-9]+/ && $0!~/quit|exit/){
					print 0
				} 
				if ($0~/exit|quit/){
					print -1
				}
				if ($0~/[0-9]+/){
					print $0
				}
				}')
	done
HOST=${hostip[$select]}
PORT=${port[$select]:=$D_PORT}
USER=${username[$select]:=$D_USER}
PW=${passwd[$select]:=$D_PW}
echo 密码提示：${PW}
ssh -i $AUTH_FILE $USER@$HOST -p $PORT
