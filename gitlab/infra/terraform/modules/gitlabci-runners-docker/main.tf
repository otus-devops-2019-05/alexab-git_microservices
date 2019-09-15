resource "google_compute_instance" "runner" {
  count        = "${var.node_count}"
  name         = "gitlabci-runners-${count.index}"
  machine_type = "g1-small"
  zone         = "${var.zone}"
  tags         = ["gitlabci-runners"]

  boot_disk {
    initialize_params {
      image = "${var.disk_image}"
    }
  }

  network_interface {
    network = "default"

    access_config = {
      nat_ip = "${element(google_compute_address.runner_ip.*.address,count.index)}"
    }
  }

  metadata {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }

  connection {
    type  = "ssh"
    user  = "appuser"
    agent = false

    # путь до приватного ключа
    private_key = "${file(var.private_key)}"
  }
}

resource "google_compute_address" "runner_ip" {
  count = "${var.node_count}"
  name  = "gitlabci-runners-ip-${count.index}"
}
