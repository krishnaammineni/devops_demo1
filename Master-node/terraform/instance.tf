#data "google_compute_instance" "appserver" {
# name = "instance-1"
#  zone = "us-central1-a"
#}

resource "google_compute_instance" "master" {
  count = length(var.user_names)
  name = var.user_names[count.index]
  #name         = "${var.prefix}-vm-${count.index}"
  #name         = "test1"
  #count2 = length(var.machine)
  machine_type = "n1-standard-2"
  zone         = "${var.region}-a"

  tags = ["k8s", "master"]

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
    name = "master"
  #  user-data = "${file("${path.module}/cloud-init.yaml")}"
    #ssh-keys = "${var.ssh_user}:${var.public_ssh_key}"
    #ssh-keys = "${var.ssh_user}:${file("public_ssh_key")}"
    #ssh-keys = "${var.ssh_user}:${file(var.public_ssh_key)}"
    ssh-keys = "${var.ssh_user}:${file(var.public_ssh_key)}"
    #ssh-keys = "${var.ssh_user}:${file("public_ssh_key")}" 
  }

  #metadata_startup_script = "echo hi > /test.txt"

  # provisioner "remote-exec" {
   # script = var.script_path
    #connection {
     # type        = "ssh"
      #host        = google_compute_instance.automation-node.network_interface.0.access_config.0.nat_ip
      #user        = var.ssh_user
      #private_key = file(var.private_ssh_key)
   # }
  #}


  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}

resource "google_compute_instance" "worker" {
count = length(var.worker_name)
  name = var.worker_name[count.index]
  #name         = "${var.prefix}-vm-${count.index}"
  #name         = "test1"
  #count2 = length(var.machine)
  machine_type = "n1-standard-1"
  zone         = "${var.region}-a"

  tags = ["k8s", "worker"]

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
    name = "worker"
  #  user-data = "${file("${path.module}/cloud-init.yaml")}"
    #ssh-keys = "${var.ssh_user}:${file(var.public_ssh_key)}"
    #ssh-keys = "${var.ssh_user}:${file(var.public_ssh_key)}"
    ssh-keys = "${var.ssh_user}:${file(var.public_ssh_key)}"
  }
  //metadata_startup_script = "${file("deploy.sh")}"
  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}