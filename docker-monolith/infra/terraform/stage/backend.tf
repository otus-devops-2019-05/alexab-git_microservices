terraform {
  backend "gcs" {
    bucket = "docker-apps-bucket"
    prefix = "stage"
  }
}
