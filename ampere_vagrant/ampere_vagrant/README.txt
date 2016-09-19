----------------------------------------------
Assignment to study Vagrant and AWS
----------------------------------------------

Requirements:
Amazon Web Services Account
Vagrant 1.8.5

Steps:
1. Create an AWS account.
2. Create Security Group and add inbound rules.
3. Create User and assign permissions.
4. Create Key Pair and store .pem file
5. Create a shell script and add environment variables
export AWS_KEY_ID=”<AWS Key>”
export AWS_SECRET=”<AWS Secret Key>”
export AWS_KEYNAME=”<AWS Key Pair Name”
export AWS_KEYPATH=”<AWS .pem Key File Path>”
6. Use the command to add into environment:
source ./env.sh
7. Do vagrant initialization:
vagrant init
8. Install AWS plugin:
vagrant plugin install vagrant-aws
9. Add dummy box:
vagrant box add dummy.box
10. Configure VagrantFile that is created in step 7
11. Create an instance on aws with the command:
vagrant up --provider=aws
12. Destroy instance with the command:
vagrant destroy
