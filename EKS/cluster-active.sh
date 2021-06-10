#!/bin/bash
check_status(){
    status=$(aws eks describe-cluster --name EKS_NAME | grep status | awk 'NR==1 {print $2}' | sed 's/\(.*\),/\1 /' | sed 's/"//g')
    if [ $status != "ACTIVE" ] && [ $status == "CREATING" ]
    then
      check_status
    elif [ $status == "ACTIVE" ]
    then
      add=$(aws cloudformation create-stack --stack-name mynodesautomation --template-body file://node-group.yaml --region us-east-1)
      echo $update
    else 
      echo "Failed"
    fi
}

EKS=$(check_status)
echo 