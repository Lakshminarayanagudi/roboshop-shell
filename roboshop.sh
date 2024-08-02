#!/bin/bash

AMI=ami-0b4f379183e5706b9
SG_ID=sg-0d75384e0bdfd9e73 #replace with your SG ID
INSTANCES=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")

for i in "${INSTANCES[@]}"
do
    if [ $i == "mongodb" ] || [ $i == "mysql" ] || [ $i == "shipping" ]
    then
        INSTANCE_TYPE="t3.small"
    else
        INSTANCE_TYPE="t2.micro"
    fi

aws ec2 run-instances --image-id ami-0b4f379183e5706b9 --instance-type $INSTANCCE_TYPE --security-group-ids sg-0d75384e0bdfd9e73

done