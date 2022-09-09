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
  default = "idp-poc-infra"
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
  type = string
}

variable "environment" {
  type = string
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
