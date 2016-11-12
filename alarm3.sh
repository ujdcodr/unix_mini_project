#!/bin/bash

#This is the script that runs the alarm clock application
#when selected from the main menu of the zenity UI
#It takes in the hour, minute and am/pm and ringtone options 
#through a zenity UI prompt and calculates the time remaining in 
#seconds and puts the system to sleep for that amount of time
#After the time is elapsed we use a command called 'play'
#downloaded from the 'sox' package to play a file stored in 
#the '/usr/share/sounds/ubuntu/ringtones/' directory untill
#interrupted by ctrl-Z

#Storing hours of the day for the dropdown menu 
array=( 0 1 2 3 4 5 6 7 8 9 10 11 12 )
#Storing ringtone options for the dropdown menu 
ring=(0 Bliss Celestial Counterpoint Latin Marimbach Soul Supreme Ubuntu)
#am/pm option
ap=(am pm)

#input hours, store in 'H'
H=$(zenity --entry --title "Alarm clock" --text "${array[@]}" --text "Hour")
echo $H

#input minutes, store in 'M'
M=$(zenity --entry --title "Alarm clock"  --text "Minute")
echo $M

#input am/pm, store in 'T'
T=$(zenity --entry --title "Alarm clock" --text "${ap[@]}" --text "AM/PM")
echo $T

#select ringtone, store in 'A'
A=$(zenity --entry --title "Alarm clock" --text "${ring[@]}" --text "Select Ringtone")
echo $A


#if option selected is pm, a 12 hour offset is added(24-hr format) and stores it in variable 'newHour'
p="pm"           
if [ "$T" == "$p" ] 
then
newH=$(echo " $H+12 " |bc)
else
newH=$H
fi

#take system Hour and Minute
curH=`date +"%H"`
curM=`date +"%M"`

y=24
x=59
#failsafe incase 'newHour' exceeds 24(due to invalid input)
if [ "$newH" -gt "$y" ]
then
while [ "$newH" -gt "$y" ]
do
read -p "error please enter appropriate value" H
if [ "$T" == "$p" ] 
then
newH=$(echo " $H+12 " |bc)
else
newH=$H
fi
done

#failsafe incase 'M'(stores user input minute) exceeds 59
if [ "$M" -gt "$x" ]
then
while [ "$M" -gt "$x" ]
do
read -p "error please enter appropriate value" M
done

fi
fi

#calculating the difference in current time and alarm time
#finds the hour difference
if((curH>newH))
then
diffH=$(echo " 24- $curH + $newH " |bc)
else
diffH=$(echo " $newH - $curH " |bc)
fi 

#finds the minute difference
if((curM>M))
then
diffM=$(echo "60- $curM + $M " |bc)
else
diffM=$(echo " $M - $curM " |bc)
fi 

#calculates difference in time in seconds and store in 'total'
sechr=$(echo " $diffH * 3600 " |bc)
secmin=$(echo " $diffM * 60 " |bc)
 
secondH=$((diffH*3600))
secondM=$((diffM*60))
total=$((secondH+secondM))
printf "time left for alarm to ring is %d:%d\n" $diffH $diffM
#do nothing for 'total' number of seconds
sleep $total

#run an infinite loop until ctrl-Z is pressed
x=1
while [ $x -gt 0 ] 
do
#play the .ogg file from the /usr/share/sounds/ubuntu/ringtones/ directory
echo "Press Control Z to switch off alarm"
play "/usr/share/sounds/ubuntu/ringtones/$A.ogg"
done
