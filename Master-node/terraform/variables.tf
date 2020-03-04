variable "project"{
    default = "organic-acronym-269914"
}

variable "region" {
    default="asia-south1"
}


variable "prefix" {
    default = "Master"
  
}


variable "ssh_user" {
    default = "automation"
}

variable "public_ssh_key" {
    default = "/home/automation/.ssh/authorized_keys"
}

variable "private_ssh_key" {
    default = "C:/Users/prasammi/.ssh/id_rsa"
}
#variable "script_path" {
 #   default = "C:/Users/prasammi/classes1/devops_demo1/Master-node/deploy.sh"
#}