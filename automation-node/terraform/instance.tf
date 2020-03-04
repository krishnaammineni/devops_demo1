#data "google_compute_instance" "appserver" {
# name = "instance-1"
#  zone = "us-central1-a"
#}


resource "google_compute_instance" "automation-node" {
  #count = "2"
  #name         = "${var.prefix}-vm-${count.index}"
  name         = "automation-vm"
  machine_type = "n1-standard-1"
  zone         = "${var.region}-c"

  tags = ["automation-node", "webapp"]

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7-v20191014"
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    name = "automation-node"
  #  user-data = "${file("${path.module}/cloud-init.yaml")}"
    ssh-keys = "${var.ssh_user}:${file(var.public_ssh_key)}"
  }
   metadata_startup_script = "${file("deploy.sh")}"
  # We connect to our instance via Terraform and remotely executes our script using SSH
  #provisioner "remote-exec" {
   # script = var.script_path
    #connection {
     # type        = "ssh"
      #host        = google_compute_instance.automation-node.network_interface.0.access_config.0.nat_ip
      #user        = var.ssh_user
      #private_key = file(var.private_ssh_key)
    #}
  #}

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}
