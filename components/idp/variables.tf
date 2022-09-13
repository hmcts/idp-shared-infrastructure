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
  default = "idp"
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
  default = "idppoc"
}

variable "postgresql_user" {
  default = "idppocuser"
}

variable "postgresql_subnet_cidr" {}
variable "size_of_fileshare" {}

variable "iaas" {
  type    = string
  default = "10.131.1.96/27"
}
variable "privateendpoints" {
  type    = string
  default = "10.131.1.128/27"
}
variable "appgw" {
  type    = string
  default = "10.131.1.160/27"
}