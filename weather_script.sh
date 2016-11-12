#!/bin/bash
python weather_tool.py $1                       #Runs weather_tool.py with command line input
oldIFS="$IFS"                                   #The Internal Field Separator (IFS) that is used for word splitting after expansion and to split lines into words
IFS=$'\n' arr=($(<info.txt))                    #Words produced from (IFS) are strored into an array 'arr' 
IFS="$oldIFS"

days=( Sun Mon Tue Wed Thu Fri Sat )            #An array 'days' for storing all the days of a week

date=$(date +%D)                                #Storing current day's date
day=$(date +%a)                                 #Storing current day

echo "Today: $date,Day: $day"                   #Output of Current Day
echo "-------------------------"                #
echo ${arr[14]}                                 #
echo "Min: ${arr[0]}"                           #
echo "Max: ${arr[7]}"                           #


for (( i=0; i<7; i++ ))                         #Method to get the next days of a week depending on the current day                         
do                                              #
    if [ ${days[i]} == $day ]                   #IF days[i] == current day
    then                                        #
	b=$i                                        #Storing the index of days[i] in variable 'b'
    fi                                          #
done                                            #
                                                #
if [ $b == 6 ]                                  #IF 'b' == 6
then                                            #
    for (( i=0; i<$b; i++ ))                    #Run the FOR loop to run from index 1 to 'b'(exclusive)
    do                                          #
	forecast[i]=${days[i]}                      #Append the values in 'forecast' array
    done                                        #
                                                #
elif [ $b == 0 ]                                #IF 'b' == 0
then                                            #
    for (( i=1; i<7; i++ ))                     #Run the FOR loop to run from index 1 to 7(exclusive)
    do                                          #
	forecast[i]=${days[i]}                      #Append the values in 'forecast' array
    done                                        #
                                                #
else                                            #
    count=0                                     #Initialize the 'count' variable to 0
    for (( i=$((b+1)); i<7; i++ ))              #Run the FOR loop form (b+1) to 7(excluseive)
    do                                          #
	forecast[$count]=${days[i]}                 #Append the values in 'forecast' array using count as the index
	count=$((count+1))                          #Increment the count
    done                                        #
                                                #
    for (( j=0; j<$b; j++ ))                    #Run the FOR loop from 
    do                                          #
	forecast[$count]=${days[j]}                 #Append the values in 'forecast' array using count as the index
	count=$((count+1))                          #Increment the count
    done
fi

echo "Forecast:"                                                                #Output of Forecast
echo "---------"                                                                #
MIN_TEMP_COUNT=1                                                                #
MAX_TEMP_COUNT=8                                                                #
DESCRIPTION_COUNT=15                                                            #
for (( i=0; i<6; i++ ))                                                         #
do                                                                              #
    echo "${forecast[i]}: "                                                     #
    echo "${arr[DESCRIPTION_COUNT]}"                                            #
    echo "Min: ${arr[MIN_TEMP_COUNT]}       Max: ${arr[MAX_TEMP_COUNT]}"        #
                                                                                #
    MIN_TEMP_COUNT=$((MIN_TEMP_COUNT+1))                                        #
    MAX_TEMP_COUNT=$((MAX_TEMP_COUNT+1))                                        #
    DESCRIPTION_COUNT=$((DESCRIPTION_COUNT+1))                                  #
    echo                                                                        #
done                                                                            #









