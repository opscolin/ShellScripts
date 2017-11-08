#!/usr/bin/env bash
#-*- coding:utf-8 -*-
# Author: Colin
# Date:
# Desc: Centos下安装配置maven, 默认安装大版本3
#

if [ $# -eq 1 ]
then
        if [ "$1" == '-h' ] || [ "$1" == "-H" ]
        then
                echo "`basename $0` mvn_version"
                echo "mvn_version取值为类似:  3.5.2"
                echo "下载地址: http://mirrors.shuosc.org/apache//maven/maven-3/"
                exit
        else
                mvn_version="$1"
        fi
else
        mvn_version="3.5.2"
fi


download_url="https://mirrors.tuna.tsinghua.edu.cn/apache//maven/maven-3/${mvn_version}/binaries/apache-maven-${mvn_version}-bin.tar.gz"
config_profile="/etc/profile.d/mvn.sh"
# download
cd /tmp
wget ${dowload_url}

# install
tar -zxvf apache-maven-${mvn_version}-bin.tar.gz
mv apache-maven-${mvn_version}-bin /usr/local/maven

# config
touch ${config_profile}
cat ${config_profile} <<EOF
M2_HOME="/usr/local/maven"
export PATH=${M2_HOME}/bin:$PATH

EOF

# verify
mvn -v