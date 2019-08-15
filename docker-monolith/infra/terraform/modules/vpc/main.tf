resource "google_compute_firewall" "reddit_app_port" {
  name    = "allow-reddit-app-port"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }

  target_tags   = ["reddit-app"]
  source_ranges = "${var.source_ranges}"
}
