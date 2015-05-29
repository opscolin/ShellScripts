#!/usr/bin/env bash

## Modified by liuchao at 2015-05-29
## upgrade docker to latest version

## get latest file
wget https://get.docker.io/builds/Linux/x86_64/docker-latest -O /tmp/docker-latest

## backup old and replace with new
## check service if up
flag=`service docker status|grep 'running'|wc -l`
#awk '{print $5}'|awk '{print substr($1,1,7)}'`
if [ ${flag} -eq 1 ]
then
        # up and stop first
        service docker stop
        sleep 5
        # confirm stop again
        flag=`service docker status|grep 'stopped'|wc -l`
        if [ ${flag} -eq 1 ]
        then
                echo "=>Stoped and try to upgrade!"
        fi
else
        ## upgrade
        mv /usr/bin/docker /usr/bin/docker.`date +%Y%,%d`
        mv /tmp/docker-latest /usr/bin/docker
        chmod 775 /usr/bin/docker
fi

# try to start docker
service docker start
sleep 2
docker version
