variable "storage_account_name" {
  description = "Nom du Storage Account"
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

variable "storage_account_tier" {
  description = "Niveau de performance du Storage Account"
  type        = string
}

variable "storage_replication_type" {
  description = "Type de réplication du Storage Account"
  type        = string
}

variable "tags" {
  description = "Tags Azure"
  type        = map(string)
  default     = {}
}
