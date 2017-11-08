#!/usr/bin/env bash
#-*- coding: utf-8 -*-
# Author: Colin
# Date: 2017-11-07
# Desc: Centos7 下自动化安装docker-ce版本
# 

# need root to install
if [ $(id -u) -ne 0 ]
then
        echo 'You need to run this script by root'
        exit
fi

# set up the respository
echo 'Try to set up the repository'
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# install 
echo "Try to install docker-ce"
yum install docker-ce -y

# start and verify
systemctl enable docker
systemctl start docker
docker version