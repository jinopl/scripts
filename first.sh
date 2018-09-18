#!/bin/bash
# usage use with root permissions
# use "bash first.sh"
#print hostname
#

one(){
    yum update -y >> /dev/null;
    yum install httpd -y 
    systemctl start httpd.service
    systemctl enable httpd.service
    }

two(){

    
    yum localinstall https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm -y 
    yum -y install mysql-community-server
    systemctl start mysqld
    systemctl enable mysqld
} 




echo ' ';
echo "Hostname of this computer is $HOSTNAME";


menu(){
echo ' ';
echo -e '\t\t OPERATIONS';
echo -e '\t\t ==========';
echo -e '\t 1 . Install Apache Webserver ';
echo -e '\t 2 . Install Mysql server ';
echo -e '\t 3 . exit';
echo "please input the number of desired operation";
echo ' ';
}

menu
while :
do
    read INPUT
    case $INPUT in 
        1 )
            one
            menu
            ;;
        2 )
            two
            menu
            ;;
        3 )
            exit
            ;;

    esac
done






