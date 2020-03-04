
#!/bin/bash

ANSIBLE_DIR="ansible"
GIT_DIR="devops_demo/Master-node"
#public_Ip=${terraform output publicIp}
public_ip2=${terraform output publicIp1}

sudo yum repolist
sudo yum install wget unzip git python36 -y
sudo python3 -m pip install ansible==2.8.0
sudo wget https://releases.hashicorp.com/terraform/0.12.21/terraform_0.12.21_linux_amd64.zip
sudo unzip terraform_0.12.21_linux_amd64.zip
sudo mv terraform /bin/
sudo git clone https://github.com/krishnaammineni/devops_demo.git
sudo chmod -R 757 ${GIT_DIR}
cd ${GIT_DIR}
sudo mkdir ansible
cd ${ANSIBLE_DIR}
#sudo chmod 600 ~/.ssh/id_rsa
sudo echo ${public_ip2} > hosts
sudo ansible-playbook main.yaml -i hosts --user automation -e "package=nginx" -become

