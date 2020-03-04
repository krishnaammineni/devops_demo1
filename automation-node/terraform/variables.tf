variable "project"{
    default = "organic-acronym-269914"
}

variable "region" {
    default="asia-east1"
}


variable "prefix" {
    default = "automation-node"
  
}

variable "ssh_user" {
    default = "automation"
}

variable "public_ssh_key" {
    default = "C:/Users/prasammi/.ssh/id_rsa.pub"
}

variable "private_ssh_key" {
    default = "C:/Users/prasammi/.ssh/id_rsa"
}
variable "script_path" {
    default = "C:/Users/prasammi/classes1/devops_demo1/automation-node/terraform/deploy.sh"
}