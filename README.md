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
