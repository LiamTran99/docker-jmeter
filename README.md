# docker-jmeter
How to set up jmeter using docker to implement load test on your server and evaluate its performance

# [jmeter-scripts](jmeter-scripts) Folder
This is the folder to store jmx file (You can create script.jmx file by using jmeter desktop)
[sample.jmx] is the script file to implement 10 http requests to www.w3schools.com

# [logs](logs) Folder
Folder to store logs file after run load test

# [results](results) Folder
Folder to store result file after run load test

## Getting Start
1. Build Jmeter with Docker by run the following cmd in root folder `docker-compose build`
2. Up docker `docker-compose up -d`
3. Now the container is running without doing anything
4. Access inside docker by running `sudo docker exec -it jmeter-container sh` or `docker exec -it jmeter-container sh`
5. Now using [sample.jmx] to performance 10 requests to www.w3schools.com by running cmd inside docker container
`/opt/apache-jmeter-5.5/bin/jmeter -n -t /jmeter-scripts/sample.jmx -l /results/test-result.csv -j /logs/test-result.log`
6. Wait a moment for jmeter to performance load test, after that you can see there are test-result.csv in results folder 
and test-result.log in logs folder


## You can now create your own JMeter .jmx test file to perform load testing on your server and evaluate its performance.


