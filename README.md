# Text Counter ![Build Status](https://travis-ci.org/davecroman/textcounter.svg?branch=master)

This is a single-paged webapp that measures an input text's word count, readability, and other metrics. This is using Java, Spring MVC. The current app's state is also accessible via heroku through this link:

    https://textcounter.herokuapp.com/

## Running the application locally

First build with:

    $mvn clean install

Then run it with:

    $java -jar target/dependency/webapp-runner.jar target/*.war

