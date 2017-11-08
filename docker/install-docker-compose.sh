#!/usr/bin/env bash
#-*- coding: utf-8 -*-
# Author: Colin
# Date: 2017
# Desc: centos下安装docker-compose
#

sudo curl -L https://github.com/docker/compose/releases/download/1.17.0/docker-compose-`uname -s`-`uname -m` -o /usr/bin/docker-compose
chmod a+x /usr/bin/docker-compose