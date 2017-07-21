#!/usr/bin/env bash
# -*- coding: utf-8 -*-
#Filename:	build_ssh_tunnel.sh
#Author:	Colin
#Email:		137642091@qq.com
#Date:		2017-06-02
#Desc:		从配置文件读取远程主机的IP和 密码，建议从运维主机到远程主机的ssh免密通道
#

#source /devOps/shell/common/functions


## 写在最前面的初始化
## 避免对于首次连接远程主机需要需要`yes` 更新known_hosts文件的情况
sshconfig="$HOME/.ssh/config"

if [[ ! -f ${sshconfig} ]]; then
	touch ${sshconfig}
elif [[ $(grep  -c 'StrictHostKeyChecking' ${sshconfig}) -eq 0 ]]; then
	sed -i '$aStrictHostKeyChecking no' ${sshconfig}
elif [[ $(grep -c 'UserKnownHostsFile' ${sshconfig}) -eq 0 ]]; then
	sed -i '$aUserKnownHostsFile /dev/null' ${sshconfig}
else
	echo "Already init. Nothing to d!"
fi


## 运维主机的公钥
publicKey='xxxxxxxxxxxxxxxxx'

## 公钥私钥对保存的路径
sshPath='/root/.ssh/'

## 远程主机IP密码配置文件
## examaples:
## cat hostip_passwd.conf
## 192.168.100.2 passwd2
## 192.168.100.2 passwd3
configFile='hostip_passwd.conf'

## 从指定的配置文件读取远程主机的IP和密码
## refer to http://www.jianshu.com/p/815ba3d6995d
cat ${configFile} | while read hostip passwd
do
	echo "build ssh channel to [${hostip}] without entering password"
	sshpass -p ${passwd}  ssh -n ${hostip} "if [ ! -d \"${sshPath}\" ];then mkdir ${sshPath} && chmod 700 ${sshPath}; fi && echo \"${publicKey}\" >> ${sshPath}authorized_keys"
done
