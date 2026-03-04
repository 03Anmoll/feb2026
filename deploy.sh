#!/bin/bash
pwd
cd ~

git clone https://github.com/muktapmandolkar/PracticeSpringBoot.git
pwd

cd ~/PracticeSpringBoot/Parag_StudentMgmtSystem
mvn clean  install -DskipTests

java -jar target/Student-Management-1.0.0.jar 


