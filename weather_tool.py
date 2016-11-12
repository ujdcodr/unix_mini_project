import requests             #HTTP Library For Python 
import sys                  #Library that enables command line input
CITY_NAME=sys.argv[1]       #Variable 'CITY_NAME' for storing the command line input
temp_min=[]                 #List to store minimum temperatures
temp_max=[]                 #List to store maximum temperature
description_array=[]        #List to store weather descriptions

#The JSON format is accessed using an openweather URL in which the city name and the app id will have to be specified.            
URL="http://api.openweathermap.org/data/2.5/forecast/daily?q="+CITY_NAME+"&mode=json&units=metric&cnt=7&appid=f83296f68c28e248cfa10599661ab3f5"
#In the above URL,'CITY_NAME' is the name of the city and 'appid' is the registered key which is available when you have a OpenWeatherMap registered account.
r = requests.get(URL)                                                   #GET request using python 'requests' library 
for i in r.json()['list']:                                              #Running a for loop on r.json() to access contents of 'list'
    temp_min.append(i['temp']['min'])                                   #Storing all the minimum temperatures of 7 days in temp_min list
    temp_max.append(i['temp']['max'])                                   #Storing all the maximum temperatures of 7 days in temp_max list
    description_array.append(str(i['weather'][0]['description']))       #Storing all the weather descriptions of 7 days in description_array list


fo=open("info.txt","w")                                                 #Writing down all the values in a file 'info.txt' which were stored in the respective lists
for item in temp_min:
  fo.write("%s\n" % item)
fo.close()                                                              #Closing the file

fo=open("info.txt","a")
for item in temp_max:
    fo.write("%s\n" % item)
fo.close()                                                              #Closing the file

fo=open("info.txt","a")
for item in description_array:
    fo.write("%s\n" % item)
fo.close()                                                              #Closing the file






