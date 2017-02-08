#!/usr/bin/env bash
#-*- coding: utf-8 -*-
#
# Author: Colin
# Date: 2017-02-08
#


configfile='./6379.conf'
startscript='./redis'

if [ -f ${configfile} ]
then
	cp ${configfile} /usr/local/redis/conf/
else
	echo "There is no init redis config here"
	echo "you need create a new one"
fi

if [ -f ${startscript} ]
then
	cp ${startscript} /etc/init.d/redis 
else
	echo "There is no such start script"
	echo "you need to add a new one"
fi

