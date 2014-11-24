# Text Counter ![Build Status](https://travis-ci.org/davecroman/textcounter.svg?branch=master)

This is a single-paged webapp that measures an input text's word count, readability, and other metrics. This is using Java, Spring MVC. The current app's state is also accessible via heroku through this link:

    https://textcounter.herokuapp.com/


## Setting Up

1. Install **jdk7** if you don't have it yet. You can follow the installation guide from here: https://docs.oracle.com/javase/7/docs/webnotes/install/index.html
2. Install **Maven 3.1.1** Get it from here: https://maven.apache.org/download.cgi
3. Install **Git**
4. Run this command in the terminal

```
git clone https://github.com/davecroman/textcounter.git
cd textcounter
```

## Running the application locally

First build with:
```
mvn clean install
```
Then run it with:
```
java -jar target/dependency/webapp-runner.jar target/*.war
```   
Open the app through localhost:8080
