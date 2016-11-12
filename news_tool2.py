import requests										#HTTP Library For Python 
titles=[]											#List to store news titles
description=[]										#List to store news descriptions

#The JSON format is accessed using an News API URL in which the source and the apiKey will have to be specified. 
URL1="https://newsapi.org/v1/articles?source=espn&sortBy=top&apiKey=73ba9519386543ea9c08351ddc2ec552"
r1 = requests.get(URL1)								#GET request using python 'requests' library 
for i in r1.json()['articles']:						#Running a for loop on r.json() to access contents of 'articles'
    titles.append(str(i['title']))					#Storing all the news titles in 'titles' list
    description.append(str(i['description']))		#Storing all the news titles in 'description' list


dub_titles=[]
dub_description=[]
for i in range(0,3):
    dub_titles.append(str(titles[i]))
    dub_description.append(str(description[i]))

fo=open("info1.txt","a")							#Writing down all the values in a file 'info1.txt' which were stored in the respective lists
for item in dub_titles:
    fo.write("%s\n" % item)
fo.close() 

fo=open("info1.txt","a")
for item in dub_description:
    fo.write("%s\n" % item)
fo.close()
