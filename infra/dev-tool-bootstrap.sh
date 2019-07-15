#!/bin/bash
curl -sL https://rpm.nodesource.com/setup_10.x | bash -
yum install nodejs -y
yum install git-core -y
yum install httpd-tools -y
yum install docker
service docker start
usermod -a -G docker ec2-user
