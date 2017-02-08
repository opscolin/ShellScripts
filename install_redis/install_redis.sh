#!/usr/bin/env bash
#-*- coding: utf-8 -*-
#
# Author: Colin
# Date: 2017-02-08
#


#source /devOps/shell/common/functions

redisHome='/usr/local/redis/'
redisUser='redis'

## version for install
if [ $# -eq 1 ]
then	
	version="$1"
else
	version="stable"
fi

## check if exist redis user
uflag=$(cat /etc/passwd |grep ${redisUser}|wc -l)
if [ ${uflag} -eq 0 ]
then
	echo "add user ${redisUser}"
	useradd -m -d /usr/local/redis -s /sbin/nologin ${redisUser}
else
	echo "user [redis] had been created"
fi

## check redis home
if [ -d ${redisHome} ]
then
	echo "redis home exist, no need to create"
else
	echo "need to create redis home"
	mkdir -p ${redisHome}
fi

## create all folders
mkdir -p ${redisHome}{bin,conf,logs,data}

## download and install
cd /tmp
pwd
wget http://download.redis.io/releases/redis-${version}.tar.gz
tar -zxf redis-${version}.tar.gz
cd redis-${version}
pwd
make 
cd src
cp redis-server redis-sentinel redis-cli redis-benchmark redis-check-rdb redis-check-aof ${redisHome}bin/


## set privilege and add path
chown -R ${redisUser}:${redisUser} ${redisHome}
pflag=$(cat /etc/profile |grep '/usr/local/redis/bin'|wc -l)
if [ $pflag -eq 0 ]
	sed -i '/PATH=$PATH:.*bin/{s@$@:/usr/local/redis/bin@}'  /etc/profile
fi

echo "install Done"

