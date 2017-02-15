#!/usr/bin/env bash

cat << 'EOF' >> /etc/yum.repos.d/mongodb-org-3.4.repo
[mongodb-org-3.4]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.4/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-3.4.asc
EOF

sudo yum install -y mongodb-org
echo 'Comment out bindIp line to listen on all interfaces'
sed -i 's/  bindIp/#  bindIp/'  /etc/mongod.conf
echo "/bin/systemctl enable  mongod.service"
/bin/systemctl enable  mongod.service
