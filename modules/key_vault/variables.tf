variable "key_vault_name" {
  description = "Nom du Key Vault"
  type        = string
}

variable "resource_group_name" {
  description = "Nom du Resource Group"
  type        = string
}

variable "location" {
  description = "Région Azure"
  type        = string
}

variable "tenant_id" {
  description = "Tenant ID Azure"
  type        = string
}

variable "tags" {
  description = "Tags Azure"
  type        = map(string)
  default     = {}
}
