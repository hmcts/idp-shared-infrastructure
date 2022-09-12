variable "vnet_name" {
  type = string
}

variable "location" {
  default = "UK South"
}

variable "env" {
  type = string
}

variable "subscription" {}

variable "address_space" {}

variable "product" {
  default = "cft-platform"
}

variable "component" {
  default = ""
}

variable "virtual_network_type" {
  default = "External"
}

variable "postgresql_subnet_cidr_blocks" {
  type    = set(string)
  default = []
}

variable "builtFrom" {
  default = "idp-shared-infrastructure"
}

# POSTGRES

variable "location_db" {
  type    = string
  default = "UK South"
}

variable "database_name" {
  default = "idp-poc"
}

variable "postgresql_user" {
  default = "ipd-poc"
}

variable "postgresql_subnet_cidr" {}

variable "microsoft_external_dns" {
  default  = "168.63.129.16"
}
