## Usage:

	bash build_ssh_tunnel.sh

## Description:

+ modify the variable `publicKey` to your own public key in real
+ add config file named `hostip_passwd.conf` under the same folder with `build_ssh_tunnel.sh`



## Records

+ 2017-07-21 
	
		脚本开始添加初始化部分
		目的在于避免对于首次连接远程主机需要手动输入`yes` 更新known_hosts文件的情况
		
+ 2017-05-20

		新增脚本build_ssh_tunnel.sh
		批量添加运维主机到多台远程主机的`免密SSH通道`
		