#!/bin/env bash

#find命令用来查找所有文件，然后sed取其扩展名，sort进行排序，sed用来取第几行

math1=$(find . -maxdepth 1 -type f ! -name ".*" | sed 's/.*\.//' | 
    sort -u | wc -w)

#echo $math1
file=$(find . -maxdepth 1 -type f ! -name ".*" | sed 's/.*\.//' | sort -u | sed 's/^\/.*//')
#echo $file
#echo $math1
collect_file(){

find . -maxdepth 1 -type f ! -name ".*" | sed 's/.*\.//' | sort -u | sed 's/^\/.*//' | sed -n "${1}p" 

}
for ((i=1; i<=math1; i++)); do
    file_name=$(collect_file $i)
    [ -z "$file_name" ] && continue
    
    echo $file_name
    new_file=${file_name}_file
        echo "尝试移动: ./*.$file_name"
    mkdir $new_file
    mv ./*."$file_name" "$new_file"/
    
done
    
#echo $(collect_file $math1)

