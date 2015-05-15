#!/usr/bin/env bash

## 
## Modified by Colin at 2015-05-15
## support two level convertion
## 

LevelOne(){
    echo "["
    i=1
    for line in `cat ${file} |sed 's/"//g'|awk -F ','  'BEGIN{OFS=","}{print $1,$2}'`
    do
        num=`cat ${file}|wc -l`
        a1=`echo ${line}|awk -F ',' '{print $1}'`
        a2=`echo ${line}|awk -F ',' '{print $2}'`
        if [ $i -ne ${num} ]
        then
            echo -e "\t{"
            echo -e "\t\t\"id\":${a1},"
            echo -e "\t\t\"name\":\"${a2}\""
            echo -e "\t},"
        else
            echo -e "\t{"
            echo -e "\t\t\"id\":${a1},"
            echo -e "\t\t\"name\":\"${a2}\""
            echo -e "\t}"
        fi
    done
    echo "]"
}

LevelTwo(){
    echo "["
    number=`cat ${file}|sed 's/"//g'|awk -F ','  'BEGIN{OFS=","}{print $1,$2}'|uniq -c|awk 'BEGIN{OFS=","}{print $1,$2}'|wc -l`
    for line in `cat ${file}|sed 's/"//g'|awk -F ','  'BEGIN{OFS=","}{print $1,$2}'|uniq -c|awk 'BEGIN{OFS=","}{print $1,$2}'`
    do
        a0=`echo ${line}|awk -F ',' '{print $1}'`
        a1=`echo ${line}|awk -F ',' '{print $2}'`
        a2=`echo ${line}|awk -F ',' '{print $3}'`
        if [ ${a1} -eq ${a1} ]
        then
            echo -e "\t{"
            echo -e "\t\t\"id\": ${a1},"
            echo -e "\t\t\"name\": \"${a2}\","
            echo -e "\t\t\"List\": ["
            i=1
            for line2 in `cat ${file}|sed 's/"//g' |grep ",${a2},"|awk -F ',' 'BEGIN{OFS=","}{print $3,$4}'`
            do
                a3=`echo ${line2}|awk -F ',' '{print $1}'`
                a4=`echo ${line2}|awk -F ',' '{print $2}'`
                #echo ${a4}
                if [ $i -ne ${a0} ]
                then
                    echo -e "\t\t\t{"
                    echo -e "\t\t\t\t \"id\": ${a3},"
                    echo -e "\t\t\t\t \"name\": \"${a4}\""
                    echo -e "\t\t\t},"
                else
                    echo -e "\t\t\t{"
                    echo -e "\t\t\t\t \"id\": ${a3},"
                    echo -e "\t\t\t\t \"name\": \"${a4}\""
                    echo -e "\t\t\t}"
                fi
                let i=$(($i + 1))
            done
            echo -e "\t\t]"
            if [ ${a1} -eq ${number} ]
            then
                echo -e "\t}"
            else
                echo -e "\t},"
            fi
        fi
    done
    echo "]"
}

if [ $# -eq 1 ]
then
  file=$1
  LevelOne
elif [ $# -eq 2 ] && [ $1 -eq 2 ]
then
  level=$1
  file=$2
  LevelTwo
else
    echo "===================================================="
    echo "Usage:"
    echo -e "\t#convert Level one"
    echo -e "\t`basename $0` LevelOne.xlsx > LevelOne.txt"
    echo -e "\t#convert Level two"
    echo -e "\t`basename $0` 2 LevelTwo.xlsx > LevelTwo.txt"
    echo "===================================================="
fi
