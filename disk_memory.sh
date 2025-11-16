#!/bin/env bash

mydisk=$(df -h /home | awk '/^\/dev/ {print $5}' | sed 's/%//')
# -gt是大于的意思,加两个括号，他其实就是防止变量为空，导致shell脚本崩溃,也可以通过加'',把方括号去一个

myMEM=$(free -h | awk '/^内存/ {print $3}')
chekc_disk() {


if [ "$mydisk" -gt 80 ]
then 
    echo "Disk is encough"
else 
    echo "Disk is insufficient"
fi
}

case $1 in
    disk)chekc_disk;;
    Mem) echo $myMEM ;;
    *) echo "please again" && exit 0 ;;
esac
