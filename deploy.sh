-------------------------------------------#!/bin/bash

mkdir khushi
echo "Directory created successfully"

cd khushi
rm -rf *

pwd

git clone https://github.com/muktapmandolkar/PracticeSpringBoot.git 
echo "Cloned the repo successfully"
pwd
sudo apt update
sudo apt install nginx
echo "installed nginx successfully"
systemctl start nginx
echo "status of the nginx is in running state"

sudo apt install openjdk-17-jdk
echo "java is installed successfully"

sudo apt install maven
echo " installed maven successfully"
pwd

cd ~/khushi/PracticeSpringBoot/Parag_StudentMgmtSystem
pwd
mvn clean install -DskipTests
echo "build successfully"

echo "Updating packages..."
sudo apt update -y

echo "Installing MySQL..."
sudo apt install mysql-server -y

echo "Starting MySQL service..."
sudo systemctl start mysql
sudo systemctl enable mysql

echo "Configuring database..."
DB_NAME="studentdb"
DB_USER="parag"
DB_PASS="password123"

sudo mysql <<EOF
CREATE DATABASE IF NOT EXISTS ${DB_NAME};

CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}';

GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'localhost';

FLUSH PRIVILEGES;
EOF

echo "MySQL database and user configured successfully"


cd /home/nn/khushi/PracticeSpringBoot/Parag_StudentMgmtSystem/target
pwd
java -jar Student-Management-1.0.0.jar
echo "executing the jar file successfully"


