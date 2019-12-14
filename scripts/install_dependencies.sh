#!/usr/bin/env bash

amazon-linux-extras install docker
service docker start
usermod -a -G docker ec2-user

chkconfig docker on
curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose version