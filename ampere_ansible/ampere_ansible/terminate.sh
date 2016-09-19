#!/bin/bash

# Author: Monika Dudhmogre

# This script will terminate the EC2 instance

# Export env variable for ansible inventories
export ANSIBLE_HOSTS=inventories/ec2.py
export EC2_INI_PATH=./inventories/ec2.ini
export ANSIBLE_HOST_KEY_CHECKING=False

key_file_name=$1

if [[ ! ${key_file_name} ]] ; then
    echo "Please provide ssh key-pair name. Exiting..."
    exit
fi

# Declare variables for ssh
ssh_key_file=$HOME/.ssh/${key_file_name}.pem

echo "Add ssh key to a ssh agent" && chmod 400 ${ssh_key_file} > /dev/null
`ssh-add ${ssh_key_file}` > /dev/null

echo "Destroying Ec2 Instance"
echo `ansible-playbook -i $ANSIBLE_HOSTS ./playbook/terminate_ec2.yml`  > /dev/null
