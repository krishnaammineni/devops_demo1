sudo touch /tmp/hosts /devops_demo1/Master-node/ansible/hosts /devops_demo1/Master-node/ansible/output

sudo chmod 777 /tmp/hosts /devops_demo1/Master-node/ansible/hosts /devops_demo1/Master-node/ansible/output
sudo terraform output -json | jq -r '.[keys[0]].value[]','.[keys[1]].value[]' > /tmp/hosts
sudo awk 'NR==1{print "[Master]"}1 && NR==2{print " "}1 && NR==2{print "[Workers]"}1' /tmp/hosts > /devops_demo1/Master-node/ansible/hosts
sleep 30
export ANSIBLE_HOST_KEY_CHECKING=False
cd /devops_demo1/Master-node/ansible/
ansible-playbook main.yaml -i hosts
ansible-playbook k8.yaml -i hosts --limit 'Master'