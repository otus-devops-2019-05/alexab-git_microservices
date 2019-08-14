output "app_external_ip" {
  value = "${module.docker-app.external_ip}"
}