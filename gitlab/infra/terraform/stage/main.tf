provider "google" {
  #Provider version
  version = "2.0.0"

  project = "${var.project}"
  region  = "${var.region}"
}

module "gitlabci-runners-docker" {
  source          = "../modules/gitlabci-runners-docker"
  public_key_path = "${var.public_key_path}"
  zone            = "${var.zone}"
  disk_image      = "${var.disk_image}"
  private_key     = "${var.private_key}"
  node_count      = "${var.node_count}"
}
