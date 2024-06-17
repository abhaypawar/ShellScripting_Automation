#!/bin/sh  # This line specifies the interpreter to use for this script (sh in this case)
CICD=true  # This line assigns the value "true" to the variable CICD
WORKSPACE=/opt/  # This line assigns the path "/opt/" to the variable WORKSPACE
JOB_BASE_NAME=Test_demo  # This line assigns the string "Test_demo" to the variable JOB_BASE_NAME
BUILD_NUMBER=10  # This line assigns the number 10 to the variable BUILD_NUMBER
if [ $CICD = true ]  # This line checks if the variable CICD is equal to "true"
then
  echo "CI/CD pipe line check"  # If the condition is true, this line prints a message indicating a CI/CD pipeline check
  file="${WORKSPACE}/basic_report.html"  # This line constructs the full path to the file "basic_report.html" within the WORKSPACE directory
  REPORTNAME=${JOB_BASE_NAME}_${BUILD_NUMBER}.Test_demo_10  # This line creates a report name by combining JOB_BASE_NAME, BUILD_NUMBER, and ".Test_demo_10"
  echo "CICD Check starting"  # This line prints a message indicating the start of the CI/CD check
  if [ -f "$file" ]; then  # This line checks if the file specified by "$file" exists
    echo "testReport file found sending to artifactory"  # If the file exists, this line prints a message
    #curl -H X-JFrog-Art-Api:Token -T $file https://oneartifactorycloud/artifactory/CICD/Reports/$REPORTNAME.html  # This line is commented out, but it would upload the file to Artifactory if uncommented. Replace "Token" with your actual API token.
  else
    echo "testReport file not found"  # If the file doesn't exist, this line prints a message
  fi
fi

# A simple report uploader shell script using jfrog and api key
