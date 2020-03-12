variable "project"{
    default = "organic-acronym-269914"
}

variable "region" {
    default="asia-east1"
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

#variable "public_ssh_key" {
#    default = "C:/Users/prasammi/.ssh/id_rsa.pub"
#}

variable "private_ssh_key" {
    default = "/home/automation/.ssh/id_rsa"
}

#variable "private_ssh_key" {
#    default = "C:/Users/prasammi/.ssh/id_rsa"
#}


#variable "script_path" {
#    default = "C:/Users/prasammi/classes1/devops_demo1/Master-node/deploy.sh"
#}

variable "user_names" {
  type        = list(string)
  default     = ["master"]
}


variable "worker_name" {
  type        = list(string)
  default     = ["worker1","worker2"]
}
#variable "machine" {
#    type = list(string)
#    default = ["n1-standard-1", "n1-standard-2"]
#}