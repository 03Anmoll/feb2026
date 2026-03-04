#!/bin/bash

mkdir aleena
echo "directory created successfully"
cd aleena

sudo apt update
sudo apt install git -y

pwd
echo "installed git successfully"
rm -rf *
git clone https://github.com/muktapmandolkar/PracticeSpringBoot.git main
echo "clone the repository successfully"

sudo apt update
sudo apt install nginx
echo "installed nginx successfully"
sudo systemctl enable nginx
sudo systemctl start nginx
echo "status of nginx is in running state"

sudo apt install openjdk-17-jdk -y
echo "jave installed successfully"

sudo apt install maven -y
echo "Maven installed successfully"

sudo apt update
sudo apt install mysql-server -y
echo "installing mysql"
sudo systemctl enable mysql
sudo systemctl start mysql
sudo systemctl status mysql
echo "status of the mysql is in running state"

cd ~/main/Parag_StudentMgmtSystem

mvn clean install -DskipTests
echo "Build successfully"

echo "configuring database"
DB_NAME="studentdb"
DB_USER="parag"
DB_PASS="password123"
 
sudo mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS ${DB_NAME};

CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}';

GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'localhost';

FLUSH PRIVILEGES;
EOF

echo "mysql database and user configured successfully"

cd /home/nn/main/Parag_StudentMgmtSystem/target
pwd
java -jar Student-Management-1.0.0.jar
echo "executing the jar file asuccessfully" 
