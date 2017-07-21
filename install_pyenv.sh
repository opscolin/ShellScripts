#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# Filename:	install_pyenv.sh
# Author:		Colin
# Date:		2017-06-12
# Desc:	目前只支持使用root执行该脚本
#		切记使用如下命令执行安装脚本
#		source install_pyenv.sh
#

#source /devOps/shell/common/functions

if [ $# -eq 0 ]
then
	echo "default install to ~/.pyenv"
	pyenv_path='/root/.pyenv'
else
	echo "install into custom folder $1/.pyenv"
	pyenv_path="$1/.pyenv"
fi



## install related
yum install epel-release git \
	readline readline-devel readline-static \
	openssl openssl-devel openssl-static \
	sqlite-devel bzip2-devel bzip2-libs -y



## git clone
git clone git://github.com/yyuu/pyenv.git $pyenv_path

## git clone virtualenv
git clone https://github.com/yyuu/pyenv-virtualenv.git $pyenv_path/plugins/pyenv-virtualenv

flag=$(cat ~/.bashrc |egrep PYENV_ROOT|wc -l)
if [ ${flag} -eq 0 ]
then
	sed -i "\$aexport PYENV_ROOT=\"$pyenv_path\"" ~/.bashrc
	sed -i "\$aexport PATH=\"\$PYENV_ROOT/bin:\$PATH\"" ~/.bashrc
	sed -i "\$aeval \"\$(pyenv init -)\"" ~/.bashrc
	sed -i "\$aeval \"\$(pyenv virtualenv-init -)\"" ~/.bashrc
else
	echo "had added pyenv config"
fi

source ~/.bashrc
