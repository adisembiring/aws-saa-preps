#!/bin/bash
yum update -y
yum install httpd -y
cd /var/www/html
echo "healthy" > healthy.html
echo "hello web server" > index.html
wget https://s3.amazonaws.com/bucketforwordpresslab-donotdelete/htaccess.txt
mv htaccess.txt .htaccess
chkconfig httpd on
service httpd start