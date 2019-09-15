variable disk_image {
  description = "Disk image for reddit app"
  default     = "docker-ubuntu-minimal-1604"
}

variable project {
  description = "My Project"
}

variable region {
  description = "Region"

  # Значение по умолчанию
  default = "europe-west4"
}

variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}

variable private_key {
  # Описание переменной
  description = "Path to the private key used for ssh access"
}

variable zone {
  # Описание переменной
  description = "google compute instance zone"
  default     = "europe-west4-b"
}

variable "node_count" {
  #Описание переменной
  description = "google compute instance count"
  default     = "1"
}
