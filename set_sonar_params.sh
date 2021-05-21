#!/bin/bash

echo "----------------------------------------------------"
echo "Setting your private project parameters"
echo "----------------------------------------------------"

echo "Enter your project's SonarToken and press ENTER:"
read token
export SONAR_TOKEN=${token} 

echo "Enter your sonar.organization and press ENTER:"
read orga

echo "Enter your sonar.projectKey and press ENTER:"
read key 

echo "----------------------------------------------------"