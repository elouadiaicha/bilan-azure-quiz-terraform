terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.81"
    }
  }

  # Le backend Azure sera configuré plus tard,
  # lorsque les informations du Storage Account tfstate seront disponibles.
  # backend "azurerm" {}
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
}
