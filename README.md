# 导语
> 整理工作中日常用到的有用脚本

---
## Excel2Json

  Usage:

    bash Excel2Json.sh LevelOne.xlsx > LevelOne.txt
    bash Excel2Json.sh 2 LevelTwo.xlsx > LevelTwo.txt
    
    or you cat get usage by 
    [root@localtest /tmp ]# bash Excel2Json.sh 
    ====================================================
    Usage:
    	#convert Level one
    	Excel2Json.sh LevelOne.xlsx > LevelOne.txt
    	#convert Level two
    	Excel2Json.sh 2 LevelTwo.xlsx > LevelTwo.txt
    ====================================================

  Description:
    Excel内容转化成 JSON 格式，可以实现 一级和 二级 JSON 格式的转化
  
  
---  
## upgrade-docker
  
    Usage:
        bash upgrade_docker.sh

    Description:
        Centos下 docker 自动升级脚本    
    
---
## addUserWithSudo

    Usage:
      bash addUserWithSudo.sh username [password]

    Description:
      Centos下添加普通账号同时赋予 sudo 权限

---
## install_redis

	Usage:
		bash install_redis.sh [version]
			here version is the parameter which control the redis version you want to install 
		bash init_redis.sh
			init redis config file and start script which run redis serivice by redis user

	Description:
		Linux下自动化安装redis服务。特点如下：
		1、支持一个参数自定义安装脚本 
		2、初始化一个配置文件和redis服务启动停止脚本，该脚本用redis用户启动服务而非root用户

		注意：
			如果修改了redis的安装路径，请确保配置文件和启动脚本中对话的参数也作相应的修改。
