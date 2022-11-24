terraform {
  required_version = ">= 1.2.9"

  backend "azurerm" {
    subscription_id = "a0939257-9c73-48ab-8daa-51cd49ef6c42"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.33.0"
    }
  }
}

provider "azurerm" {
  subscription_id            = "ed302caf-ec27-4c64-a05e-85731c3ce90e"
  skip_provider_registration = "true"
  features {}
  alias = "vpn"
}
provider "azurerm" {
  subscription_id            = "0978315c-75fe-4ada-9d11-1eb5e0e0b214"
  skip_provider_registration = "true"
  features {}
  alias = "hub-prod"
}
provider "azurerm" {
  features {}
}

provider "azurerm" {
  subscription_id            = "1baf5470-1c3e-40d3-a6f7-74bfbce4b348"
  skip_provider_registration = "true"
  features {}
  alias = "dts-cftptl"
}