#!/bin/bash
# 快捷登录Linux服务器, 和ssh_pass文件配合使用

RC_ERR_NO_HOST=11
RC_ERR_DATA=21
RC_SUCCESS=0

pass_path=~/.ssh_pass
host=$1


# read file
read_file(){
	IFS=$'\n'
	for i in `cat $1`
	do
		f=`echo ${i:0:1}`
		if [ $f != '#' ]; then
			name=`echo ${i} | cut -d ' ' -f 1`
			ip=`echo ${i} | cut -d ' ' -f 2`
			echo $name'['$ip']'
		fi
	done
	IFS=$bak
}

#sshpass
ssp(){
	item=$1
	ip=`echo ${item} | cut -d ' ' -f 2`
	pass=`echo ${item} | cut -d ' ' -f 3`
	port=`echo ${item} | cut -d ' ' -f 4`
	if [ -z $ip ]; then
	    echo "Error: Data invalid."
	    exit $RC_ERR_DATA
	fi
	sshpass -p $pass ssh -o StrictHostKeyChecking=no -tt -p $port root@$ip
}

# main
if [ -z $host ]; then
	echo "ssp options:"
	echo "usage: ssp "
	echo "    [-h look host list.]"
	echo "    [xxx quick link host.]"
	exit $RC_ERR_NO_HOST
elif [  $host = '-h' ]; then
	echo "Please Enter Number Select:"
	select your in `read_file ${pass_path}`;do
		break
	done
	echo "Your Selected: $your"
	left=`echo $your | cut -d '[' -f 2`
	right=`echo $left | cut -d ']' -f 1`
	param=`grep $right\  $pass_path`
	ssp "`echo $param`"
else
	param=`grep ^$host\  $pass_path`
	ssp "`echo $param`"
fi

# exec sshpass -p $pass  ssh root@$ip -p $port
# sshpass -p $pass ssh -o StrictHostKeyChecking=no -tt -p $port root@$ip
exit $RC_SUCCESS