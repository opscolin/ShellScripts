# Upgrade docker to latest version 

## introduction

    If docker service is up, try to stop it first 
    then backup older to /usr/bin/dokcer.`date +%Y%m%d`
    after upgrade try to start docker serivce 
    and try to execute `dokcer version` to confirm
  
  
## e.g.

    [root@192 bin]# bash upgrade_docker.sh
    Stopping docker:                                           [  OK  ]
    =>Stoped and try to upgrade!
    Starting docker:                                           [  OK  ]
    Client version: 1.6.2
    Client API version: 1.18
    Go version (client): go1.4.2
    Git commit (client): 7c8fca2
    OS/Arch (client): linux/amd64
    Server version: 1.6.2
    Server API version: 1.18
    Go version (server): go1.4.2
    Git commit (server): 7c8fca2
    OS/Arch (server): linux/amd64
