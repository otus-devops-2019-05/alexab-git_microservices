resource "google_compute_instance" "app" {
  count        = "${var.node_count}"
  name         = "docker-app-${count.index}"
  machine_type = "g1-small"
  zone         = "${var.zone}"
  tags         = ["reddit-app", "http-server"]

  boot_disk {
    initialize_params {
      image = "${var.disk_image}"
    }
  }

  network_interface {
    network = "default"

    access_config = {
      nat_ip = "${element(google_compute_address.app_ip.*.address,count.index)}"
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

resource "google_compute_address" "app_ip" {
  count = "${var.node_count}"
  name  = "reddit-app-ip-${count.index}"
}
