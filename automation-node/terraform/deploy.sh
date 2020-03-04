#TERRAFORM_DIR="terraform"
#
#cd ${TERRAFORM_DIR}
###### terraform ########
#terraform init
#terraform plan
#terraform apply -auto-approve
public_ip=${terraform output publicIp}
#public_ip2=${terraform output publicIp1}

####### Ansible #########
#sleep 30
#ssh automation@${publicj_ip}  "ifconfig"

#! /bin/bash
yum repolist
yum install wget python36 git unzip -y
python3 -m pip install ansible==2.8.0
wget https://releases.hashicorp.com/terraform/0.12.21/terraform_0.12.21_linux_amd64.zip
unzip terraform_0.12.21_linux_amd64.zip
#sudo chmod -R 757 /bin/
mv terraform /bin
git clone https://github.com/krishnaammineni/devops_demo1.git
cat <<EOF > /devops_demo1/Master-node/terraform/credentials.json
{
  "type": "service_account",
  "project_id": "organic-acronym-269914",
  "private_key_id": "45449117a81fc18b9ee39307e40e33b8c9c82095",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDmxhEAZzrVXRQL\nj9J/m9VoEafM0qiRyRdc2j74qx3Ed5z4AyvJVnziOKVMgAo1+eUkXIkukW+5evv2\ncPFL+7gUecRMUSxHolV6oZ3iDxQ5WoeRZAVM4svtQou8yqacwUiWLp/RYdRt/sdg\nWI0p9tOwvwEjFTVG+LSNnJN98J48W2aa1jsx/T+hn77LwK4viIduW4hcgK9R4rti\nujJYsWYg8a6/Trm5+bVrSU+teN43sjjdrpjmUkMUM7BZWNRKmcxFGAFM2mAO5RZA\nStaMIt6JPSLXbM4haGufLiGoZ4uyGgfNyM6GGRsMKwsFIpsjpmHQnLwUz1UpLWRV\nWUEzd3LVAgMBAAECggEABDTG+Y1oHpxwMZfA++9wr9FmkA6k4Odb5CbcL/cad0rA\n0ypnoWdQpmTm6mKJDRvNZ+DB5VXkRequbfr4Au0HGWRwxf1Sw8l7Kl2IvaaNtU/n\nmahLim+1zNDCMEI3UDMbqhUWd6ADWa/jnWdvxzyG9jk9AZEw4+bDj7MzYv/AOpRd\nCZH3+P8LRvPwcPDiDOoZvTsRoBB1pTHe76WECSZ2tmxya9rWHXHqGcoNeYjpRklb\nY0YcXihCc8lG/IOIxi5EgwW1zG10kLcc9FLjPNbRlcdfPN7+OMLl63OFQAehMSAI\naKsVtvEhuCzQNMBewPiqCQbnGp+mE+s8qQsYeX6boQKBgQD1Ha7xBsRGfODa7Yn7\nxxCgGisuN3PlOqOwZFVqkjP5jXb7XkHYOBe25xFJlhGIoN+4XxtaAtz/o/z+cU25\nggkf0xXHxJp7gm2worxaLfq+XJ0I+/W3PEEx44cLCEBFL9oM68TsCx7UIQf2dIYY\nYBebLVKV08g5c7NmnvvgfIiqBQKBgQDxBVmJnSCya4fVbWoG/74qjY83t/H0fgHT\n6S/OK1NXKy45J476F+W8JGMLbjnVR2PgsbCTl8cAWQSzc470RImqxp2kVsugydRf\noM4f143xHHQpqh+FiN1a4IccuQowKlUVM1lr9UcTGHUwTgzPoUjoWgHKMyZ2WZMn\n+sijj81ukQKBgFr3ky88Nad7PO/C7EyWiiMA0zmptsdBxfH2qoSMkeFxkNClIIaf\n+p0UkCPhH8y295AzK7FyEpaFQ6UiY5gPHFfFPPYQjsx7kT3Wh1RocAAp2tW0vHIu\nWHutVzbO7xs+MQxOi5yWW/CZ+ZyLjiCJuPkMDvQvzsUTnWbeZdfgH9AJAoGBANag\nZPNesNcxWmx8WoaRBs7t8DM14ohODWKfrKpzemuNUEQlLfUXgsTfwjNTnLyILjDR\nCuTjq5prqvwCU7LBtbYV2BuYDwzHrg7aK7O/R+8F34uaqydGkZdzid3SCXiKuel/\nKIoyiXA/v1ucpVvfzATc4eslUYLikWBwumqsi8uBAoGAUu1QokMnOC3OznvU0exa\nPzgB0AOU4Hqp3Khgx6RtMB3926r3PI3fafSvGRSieSbIw3DzbBSxl31A175iZzkl\nNTU2lIHWTOtaYLH3Pm36X7hN6sGZZM6k7yLKjZEo0N3TccHFFKaJErQ7yX2APkfn\nD5En/9AfacomcdljfvfxoVE=\n-----END PRIVATE KEY-----\n",
  "client_email": "devops-test@organic-acronym-269914.iam.gserviceaccount.com",
  "client_id": "106983066910530460654",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/devops-test%40organic-acronym-269914.iam.gserviceaccount.com"
}
EOF

cat <<EOF > /home/automation/.ssh/id_rsa
-----BEGIN OPENSSH PRIVATE KEY-----
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
-----END OPENSSH PRIVATE KEY-----
EOF

#sudo chmod 600 ~/.ssh/id_rsa
#sudo chmod 600 ~/.ssh/id_rsa.pub
#sudo echo ${public_ip} > hosts
#sudo ansible-playbook main.yaml -i hosts --user automation -e "package=nginx" -become

cd /devops_demo1/Master-node/terraform
terraform init
terraform apply -auto-approve
public_ip2=${terraform output publicIp1}
cd ../..
cd automation-node/ansible
sudo echo ${public_ip2} > hosts
sudo ansible-playbook main.yaml -i hosts --user automation -e "package=nginx" -become
