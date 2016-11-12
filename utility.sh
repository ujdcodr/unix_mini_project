#!/bin/bash

#This is the main Window of the utility tool
#On rnning this shell script the user is prompted
#with a radio button zenity User Interface offering three choices
#namely:1.Alarm Clock 2.WeatherNow 3.News
#On selecting the choice, the appropriate shell script runs
opt1="Alarm Clock"
opt2="WeatherNow"
opt3="News"

#'int' stores the input request on clicking the appropriate button 
int=`zenity --height=275 --width=300 --list --radiolist --title 'Tool Selection' --text 'Select the tool you wish to use:' --column 'Select...' --column 'Tool Name' TRUE "$opt1" FALSE "$opt2" FALSE "$opt3" `
echo "Chosen option: "$int

#selecting the required shell script to run
if [ "$int" == "$opt1" ]
then
#run the Alarm Clock script
  echo "`/bin/bash ./alarm3.sh`"
elif [ "$int" == "$opt2" ]
then 
#take in a place name as argument for the WeatherNow script 
  place=$(zenity --entry --title "WeatherNow" --text "Enter place name")
   echo "`/bin/bash ./weather_script.sh $place`"

elif [ "$int" == "$opt3" ]
then 
#run the news script
  echo "`/bin/bash ./news_script.sh`"
else
  echo "No option selected"  
fi
 
 
