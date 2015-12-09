#/bin/sh
dirpath=$(echo $(pwd)|awk '{gsub(/\//,"\\\/",$0); print $0}')

filename=""
if [ ! -f ~/.bash_profile ];then
	touch ~/.bash_profile
fi
is_exist=$(awk  '/source '$dirpath'\/vmhost.config/ {print 1}' ~/.bash_profile)
is_exist=${is_exist:=0}
echo $dirpath
dirpath=${dirpath//\\/''}
echo $dirpath
if [ ${is_exist} -eq 0 ];then
	echo "#远程主机相关配置">> ~/.bash_profile
	echo "source $dirpath/vmhost.config">>~/.bash_profile
	echo "">./vmhost.config
	echo "alias conn='$dirpath/connvm.sh'">>./vmhost.config
	echo "alias upfile='$dirpath/tfile.sh'">>./vmhost.config
fi
source ~/.bash_profile
