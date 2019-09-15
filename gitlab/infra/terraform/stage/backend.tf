terraform {
  backend "gcs" {
    bucket = "gitlabci-runners-bucket"
    prefix = "stage"
  }
}
