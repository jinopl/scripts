#! /bin/bash

httpd_status_check=`sudo netstat -ntlp | grep httpd | wc -l`
h=$HOSTNAME
if [ $httpd_status_check -eq '1' ] || [ $httpd_status_check -eq '2' ]  ;

then

	a=0
	 
else
echo 

curl -X POST --data-urlencode 'payload={"text": "Droplet:'$h' \n Message : Apache webserver is Down.\nIf you see this meassage consecutively please check server. \nOtherwise apache is successfully Restarted. "}' https://hooks.slack.com/services/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

#sudo apachectl start
fi 

mysql_status_check=`sudo netstat -ntlp | grep mysqld |wc -l`

if [ "$mysql_status_check" != "1" ]
then

echo

curl -X POST --data-urlencode 'payload={"text": "Droplet:'$h' \n Message : Mysql server is Down.\nIf you see this meassage consecutively please check server. \nOtherwise apache is successfully Restarted. "}' https://hooks.slack.com/services/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
#sudo systemctl start mariadb
fi


