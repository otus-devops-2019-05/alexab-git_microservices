provider "google" {
  #Provider version
  version = "2.0.0"

  project = "${var.project}"
  region  = "${var.region}"
}

module "docker-app" {
  source          = "../modules/docker-app"
  public_key_path = "${var.public_key_path}"
  zone            = "${var.zone}"
  disk_image  = "${var.disk_image}"
  private_key     = "${var.private_key}"
}

module "vpc" {
  source        = "../modules/vpc"
  source_ranges = ["0.0.0.0/0"]
}
