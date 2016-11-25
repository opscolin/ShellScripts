## Description
> Create normal account under Centos system and grant the `sudo` privilege to the new account
> and make new account sudo config into `/etc/sudoers.d/custom` file
> Script name: `addUserWithSudo.sh`

---
## Usage

> if not give a certain password parameter, it will generate a default password `pass+username` .
> if your account name is james, and have no input password given, at last will give you a password like `passjames`


    bash addUserWithSudo.sh username [password]
    
---    
## Script

```shell

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

```


## Examples

```shell

## check if exist
    root@pts/2 $ cat /etc/passwd |grep james 

## use script to add without given password
    root@pts/2 $ bash addUserWithSudo.sh james
    [2016-11-25 14:42:14] Adding [james]
    [2016-11-25 14:42:14] Add user sucessfully!
    [2016-11-25 14:42:14] Then set password
    Changing password for user james.
    passwd: all authentication tokens updated successfully.
    [2016-11-25 14:42:14] Set password sucessfully!
    [2016-11-25 14:42:14] Then give sudo privilege
    [2016-11-25 14:42:14] Set sudo privilege successfully!
    [2016-11-25 14:42:14] The new user is:
    		james - passjames
    		
    		
## check if add
root@pts/2 $ cat /etc/passwd |grep james 
james:x:1001:1001::/home/james:/bin/bash

## check if grant the sudo privilege
root@pts/1 $ cat /etc/sudoers.d/custom |grep james 
james	ALL=(ALL)	ALL

## verify the sudo privilege
    root@pts/1 $ su - james 
    i-jbik7obw [~] 2016-11-25 14:59:50
    james@pts/1 $ sudo cat /etc/passwd |grep james 
    
    We trust you have received the usual lecture from the local System
    Administrator. It usually boils down to these three things:
    
        #1) Respect the privacy of others.
        #2) Think before you type.
        #3) With great power comes great responsibility.
    
    [sudo] password for james: 
    james:x:1003:1003::/home/james:/bin/bash



## if add an exist account, show message below and not add in real
    root@pts/2 $ bash addUserWithSudo.sh james
    [2016-11-25 14:42:24] [james] had existed!

```
