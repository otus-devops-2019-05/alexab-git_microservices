terraform {
  backend "gcs" {
    bucket = "docker-apps-bucket"
    prefix = "prod"
  }
}
