#!/usr/bin/env bash


/bin/systemctl stop  mongod.service
cp -rf /mongodb/data/* /var/lib/mongo
rm -f /var/lib/mongo/mongod.lock
echo "sudo chown -R mongod:mongod /var/lib/mongo"
sudo chown -R mongod:mongod /var/lib/mongo
echo "Start mongod.service..."
/bin/systemctl start  mongod.service

echo "Waiting for mongod service to start"
sleep 1
while ! grep -m1 'waiting for connections on port 27017' < /var/log/mongodb/mongod.log; do
    sleep 1
done
echo "Service started."
echo "Create mangoAmdin user"
echo 'db.createUser({ "user" : "mongoAdmin", "pwd": "passw0rd", "roles" : [ "readWrite", "dbAdmin"] } ) ' | mongo
