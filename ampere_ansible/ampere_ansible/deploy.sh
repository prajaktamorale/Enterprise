#!/bin/bash

#Author: Amit Rajoriya

# This script will create the security group & ec2 instance and deploy the web application over nginx server.

#check if boto is installed

boto_file=$HOME/.boto
key_file_name=$1

if [[ ! ${key_file_name} ]] ; then
    echo "Please provide ssh key-pair name. Exiting..."
    exit
fi

if [[ ! -f ${boto_file} ]] ; then
    echo "${boto_file} is not installed. Please install it, Exiting..."
    exit
fi

# Export env variable for ansible inventories
export ANSIBLE_HOSTS=inventories/ec2.py
export EC2_INI_PATH=./inventories/ec2.ini

# Declare variables for ssh
ssh_key_file=$HOME/.ssh/${key_file_name}.pem

echo "Add ssh key to a ssh agent" && chmod 400 ${ssh_key_file} > /dev/null
`ssh-add ${ssh_key_file}` > /dev/null

echo "Creating Ec2 Instance"
echo `ansible-playbook -i $ANSIBLE_HOSTS ./playbook/create_ec2.yml`  > /dev/null

check_instance_attributes="$($ANSIBLE_HOSTS --list --refresh-cache)"

# Waiting for Instance to be Initialized
sleep 60

echo "Deploying Ec2 Instance"

echo `ansible-playbook -i $ANSIBLE_HOSTS ./playbook/deploy_app.yml` > /dev/null
