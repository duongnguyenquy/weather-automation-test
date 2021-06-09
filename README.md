# weather-automation-test
This project is an automation test script to cover the basic business of Open weather API

Project was built on Robotframework 4.0.3.
Please read this tutorial carefully to run this project smoothly.

This is the project file structure : 

![image](https://user-images.githubusercontent.com/44106286/121363957-91cbdf00-c961-11eb-9088-cc9af37fc3f7.png)

1. Download venv python here : https://drive.google.com/drive/u/0/folders/1Wv8itJWUA74u5ADy7Wsoufu9Bxf60Vn-
2. Create your own app id on Open weather website : https://home.openweathermap.org/. Generate app id
3. Execute automation test script
4. Review robotframework logs

First things is to download the venv, unzip it and put it into the project dir root folder : 

![image](https://user-images.githubusercontent.com/44106286/121364356-ea9b7780-c961-11eb-9cd7-789cda6dbda6.png)

Activate the venv like these command : 

![image](https://user-images.githubusercontent.com/44106286/121364885-61387500-c962-11eb-80a4-8245e660c0f6.png)


Create your own app id on Open Weather and go to App keys page to copy the key : 

![image](https://user-images.githubusercontent.com/44106286/121364519-0dc62700-c962-11eb-8b2d-839df45eb441.png)

Paste the key into this config.yaml file : 

![image](https://user-images.githubusercontent.com/44106286/121364582-1d457000-c962-11eb-8e38-16354355749b.png)


If you want to execute the "behaviour-driven-testing" go cd to the directory and run this command : 

robot -L trace weather-in-the-city.robot

![image](https://user-images.githubusercontent.com/44106286/121365345-c3917580-c962-11eb-8aac-e15eac5c5436.png)


After the execution was completed you would find this log was generated right in "behaviour-driven-testing" folder

![image](https://user-images.githubusercontent.com/44106286/121365021-7ca38000-c962-11eb-866f-446b9c29ebc7.png)

Now paste that log path file to the browser and review the log of every steps are executed by Robotframework

![image](https://user-images.githubusercontent.com/44106286/121365261-b2486900-c962-11eb-959e-ab0bd4fce6af.png)


![image](https://user-images.githubusercontent.com/44106286/121365298-b8d6e080-c962-11eb-8777-a35802530fb6.png)


With the data-driven-testing I've created the file which is : weather-in-the-city.csv 


![image](https://user-images.githubusercontent.com/44106286/121365801-28e56680-c963-11eb-9cbb-24c22e54f1da.png)


All the records here represent a testcase which should be generated at run-time of Robotframework thanks to DataDriver library

![image](https://user-images.githubusercontent.com/44106286/121365636-04898a00-c963-11eb-8822-e735a4200ce9.png)


We can execute those data-driven-testing as we've just did with "behaviour-driven-testing" as above guidance : 


Now I cd to "data-driven-test" and run the command : robot -L trace weather-in-the-city.robot


![image](https://user-images.githubusercontent.com/44106286/121365993-503c3380-c963-11eb-88b7-aed29a8f1143.png)


And let review the result here : 

![image](https://user-images.githubusercontent.com/44106286/121366424-add08000-c963-11eb-9855-06766cf47caf.png)


So that's it. You've now know how to execute a Robotframework.

Happy testing !

