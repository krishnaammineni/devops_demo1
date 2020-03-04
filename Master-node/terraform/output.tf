output "instanceId1" {
  value = "${google_compute_instance.Master.instance_id}"
}

output "instanceIp1" {
  value = "${google_compute_instance.Master.network_interface.0.network_ip}"
}

output "publicIp1" {
  value = "${google_compute_instance.Master.network_interface.0.access_config.0.nat_ip}"
}