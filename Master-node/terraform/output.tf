/*output "MasterInstanceId" {
  value = "${google_compute_instance.Master[0].instance_id}"
}

output "MasterInstanceIP" {
  value = "${google_compute_instance.Master[0].network_interface.0.network_ip}"
}


output "MasterInstancePublicIp" {
  value = "${google_compute_instance.master.[0].network_interface.0.access_config.0.nat_ip}"
}
*/
#########################
/*
output "Worker1InstanceId" {
  value = "${google_compute_instance.Master[1].instance_id}"
}

output "Worker1InstanceIp" {
  value = "${google_compute_instance.Master[1].network_interface.0.network_ip}"
}

output "Worker1PublicIp" {
  value = "${google_compute_instance.master.[1].network_interface.0.access_config.0.nat_ip}"
}
*/
##############################
/*
output "Worker2InstanceId" {
  value = "${google_compute_instance.Master[2].instance_id}"
}

output "Worker2InstanceIp" {
  value = "${google_compute_instance.Master[2].network_interface.0.network_ip}"
}

output "Worker2PublicIp" {
  value = "${google_compute_instance.master.2.network_interface.0.access_config.0.nat_ip}"
}
*/

output "instance_ips" {
  #value = "${google_compute_instance.Master.*.network_interface.0.access_config.0.nat_ip}"
  value = "${google_compute_instance.master.*.network_interface.0.access_config.0.nat_ip}"
}

output "worker_ips" {
  #value = "${google_compute_instance.Master.*.network_interface.0.access_config.0.nat_ip}"
  value = "${google_compute_instance.worker.*.network_interface.0.access_config.0.nat_ip}"
}

output "worker1_ip" {
  #value = "${google_compute_instance.Master.*.network_interface.0.access_config.0.nat_ip}"
  value = "${google_compute_instance.worker.1.network_interface.0.access_config.0.nat_ip}"
}
#output "all_ip" {
#  value = values(google_compute_instance.Master)[*].network_interface.0.access_config.0.nat_ip
#}