variable "virtual_network_name" {
  description = "Nom du réseau virtuel"
  type        = string
}

variable "backend_subnet_name" {
  description = "Nom du subnet utilisé par le backend App Service"
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

variable "address_space" {
  description = "Plage d’adresses du VNet"
  type        = list(string)
}

variable "backend_subnet_prefixes" {
  description = "Plage d’adresses du subnet backend"
  type        = list(string)
}

variable "tags" {
  description = "Tags Azure"
  type        = map(string)
  default     = {}
}
