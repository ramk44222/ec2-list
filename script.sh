#!/bin/bash
service nginx start
mkdir /usr/share/nginx/html/ec2
while true
do
    echo "" > /tmp/index.html
    echo "Gathering instance details..."
    python3 ec2.py >> /tmp/index.html 
    cp /tmp/index.html /usr/share/nginx/html/ec2/index.html
    sleep 1
done