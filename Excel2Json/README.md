Introductions
====

How to get this script
----

    wget https://github.com/opscolin/ShellScripts/blob/master/Excel2Json/Excel2Json.sh


Example excel file
----

### one level example 
    refer to example file : LevelOne.xlsx
    
### two level example 
    refer to example file : LevelTwo.xlsx
    
Usage
----
  
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
    
