## Description
> Create normal account under Centos system and grant the `sudo` privilege to the new account
> and make new account sudo config into `/etc/sudoers.d/custom` file
> Script name: `addUserWithSudo.sh`

---
## Usage

> if not give a certain password parameter, it will generate a default password `pass+username` .
> if your account name is james, and have no input password given, at last will give you a password like `passjames`


    bash addUserWithSudo.sh username [password]
    
---    
## Examples

```shell

## check if exist
    root@pts/2 $ cat /etc/passwd |grep james 

## use script to add without given password
    root@pts/2 $ bash addUserWithSudo.sh james
    [2016-11-25 14:42:14] Adding [james]
    [2016-11-25 14:42:14] Add user sucessfully!
    [2016-11-25 14:42:14] Then set password
    Changing password for user james.
    passwd: all authentication tokens updated successfully.
    [2016-11-25 14:42:14] Set password sucessfully!
    [2016-11-25 14:42:14] Then give sudo privilege
    [2016-11-25 14:42:14] Set sudo privilege successfully!
    [2016-11-25 14:42:14] The new user is:
    		james - passjames
    		
    		
## check if add
root@pts/2 $ cat /etc/passwd |grep james 
james:x:1001:1001::/home/james:/bin/bash

## check if grant the sudo privilege
root@pts/1 $ cat /etc/sudoers.d/custom |grep james 
james	ALL=(ALL)	ALL

## verify the sudo privilege
    root@pts/1 $ su - james 
    i-jbik7obw [~] 2016-11-25 14:59:50
    james@pts/1 $ sudo cat /etc/passwd |grep james 
    
    We trust you have received the usual lecture from the local System
    Administrator. It usually boils down to these three things:
    
        #1) Respect the privacy of others.
        #2) Think before you type.
        #3) With great power comes great responsibility.
    
    [sudo] password for james: 
    james:x:1003:1003::/home/james:/bin/bash



## if add an exist account, show message below and not add in real
    root@pts/2 $ bash addUserWithSudo.sh james
    [2016-11-25 14:42:24] [james] had existed!

```
