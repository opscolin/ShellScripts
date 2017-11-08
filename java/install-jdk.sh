#!/usr/bin/env bash
#-*- coding: utf-8 -*-
# Author: Colin
# Date: 2017
# Desc: 安装jdk，这里可选1.7.80 和 1.8.151 两个版本,
#       默认安装最新1.8
#


if [ $# -eq 1 ]
then
        if [ "$1" == '-h' ] || [ "$1" == "-H" ]
        then
                echo "`basename $0` 7/8"
                echo "7 代表jdk1.7; 8代表jdk1.8"
                exit
        else
                java_version=$1
        fi
else
        java_version=8
fi



echo "You will install jdk${java_version}"
if [ "${java_version}" == 8 ]
then
        rpm -ivhU http://download.oracle.com/otn/java/jdk/7u80-b15/jdk-7u80-linux-x64.rpm
elif [ "${java_version}" == 7 ]
then
        rpm -ivhU http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jdk-8u151-linux-x64.rpm
fi


echo "Try to configuration java home"
touch /etc/profile.d/java.sh
cat /etc/profile.d/java.sh <<EOF
# add by Colin
JAVA_HOME='/usr/java/default'
PATH=$JAVA_HOME/bin:$PATH

EOF


echo "Try to verify the installation"
java -version