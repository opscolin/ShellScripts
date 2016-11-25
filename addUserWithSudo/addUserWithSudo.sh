#!/usr/bin/env bash
#-.- coding:utf-8 -.-
# Filename: addUserWithSudo
# Author:	Liuchao
# Date:		2016-05-11
# Desc:		添加个人账号，并且给定sudo权限
#

source /devOps/shell/common/functions

sudofile='/etc/sudoers.d/customize'

if [ $# -eq 2 ]
then
	username="$1"
	password="$2"
elif [ $# -eq 1 ]
then
	username="$1"
	password="pass${username}"
else
	uLog "Please enter correct parameters!"
	uLog "`basename $0` username [password]"
	exit
fi

## if user exist ?
uflag=$(cat /etc/passwd|egrep "${username}"|wc -l)
if [ ${uflag} -eq 0 ]
then
	uLog "Adding [${username}]"
	/usr/sbin/useradd ${username}
else
	uLog "[${username}] had existed!"
	exit
fi

## if user not exist,then add and set sudo privilege
if [ $? -eq 0 ]
then
	uLog "Add user sucessfully!"
	uLog "Then set password"
	echo "${password}" | /usr/bin/passwd --stdin ${username}
	if [ $? -eq 0 ]
	then
		uLog "Set password sucessfully!"
		uLog "Then give sudo privilege"
		## if not exist file then touch
		[ ! -f  ${sudofile} ] && echo "## users with sudo privilege" >> ${sudofile}
		## if user had own sudo privilege
		flag=$(cat ${sudofile} |egrep "${username}"|wc -l)
		if [ ${flag} -eq 0 ]
		then
			# echo "sed add ..."
			sed -i "\$a${username}\tALL=(ALL)\tALL"  ${sudofile}
			# echo $?
			if [ $? -eq 0 ]
			then
				uLog "Set sudo privilege successfully!"
			else
				uLog "Set sudo privilege failed"
				exit
			fi
		else
			uLog "[${username}] had sudo privilege already"
			exit
		fi
	else
		uLog "Set password failed!"
		exit	
	fi
else
	uLog "Add user failed!"
	exit
fi

## if all is done, print the username and password
if [ $? -eq 0 ]
then
	uLog "The new user is:"
	echo -e "\t\t${username} - ${password}"
fi


