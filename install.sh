#!/bin/sh
if [ ! -f ~/.bash_profile ];then
	touch ~/.bash_profile
fi
is_exit=1
is_exit=$(echo awk  "/source \.\/vm\/vmhost\.config/{print 1}" ~/.bash_profile}

if [ is_exit -eq 0 ];then
	echo "#阿里虚拟机相关配置">> ~/.bash_prifile
	echo "source .\/sshclient\/vmhost.config">>~/.bash_profile
else
	exit
fi
