#!/bin/bash
python news_tool.py 					#Runs news_tool.py
python news_tool1.py         			#Runs news_tool1.py
python news_tool2.py 					#Runs news_tool2.py

oldIFS="$IFS"							#The Internal Field Separator (IFS) that is used for word splitting after expansion and to split lines into words
IFS=$'\n' arr=($(<info1.txt))			#Words produced from (IFS) are strored into an array 'arr' 
IFS="$oldIFS"

echo "World News"
for (( i=0; i<3; i++ ))					#Running the for loop to extract the data of World new for array 'arr'
do
    echo "${arr[i]}"
    echo "${arr[i+3]}"
    echo
done
echo
echo

echo "Technology"						#Running the for loop to extract the data of Technology news for array 'arr'
for (( i=6; i<9; i++ ))
do
    echo "${arr[i]}"
    echo "${arr[i+3]}"
    echo
done
echo
echo

echo "Sports"							#Running the for loop to extract the data of Sports news for array 'arr'
for (( i=12; i<15; i++ ))
do
    echo "${arr[i]}"
    echo "${arr[i+3]}"
    echo
done


