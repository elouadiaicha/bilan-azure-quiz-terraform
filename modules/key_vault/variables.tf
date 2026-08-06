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

variable "allowed_subnet_ids" {
  description = "Subnets autorisés à accéder au Key Vault"
  type        = list(string)
  default     = []
}
