terraform {
  backend "azurerm" {
    resource_group_name  = "aelouadiRG"
    storage_account_name = "staelouaditfstate"
    container_name       = "tfstate"
    key                  = "bilan-azure-quiz.tfstate"
    use_azuread_auth     = true
  }
}
