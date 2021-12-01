#!/bin/bash

sudo su -root

s3_bucket=upgrad_athira

myname=Athira

timestamp=$(date +%d%m%Y-%H%M%S)

apt update -y

apt install apache2 -y

systemctl start apache2 

systemctl enable apache2

cd /var/log/apache2/

tar -cf /tmp/${myname}-httpd-logs-${timestamp}.tar *.log

cd /root

aws s3 cp /tmp/${myname}-httpd-logs-${timestamp}.tar s3://${s3_bucket}/${myname}-httpd-logs-${timestamp}.tar