variable "app_name" {
  description = "Nom de l'Azure Linux Web App hébergeant le backend"
  type        = string
}

variable "location" {
  description = "Région Azure de l'Azure Linux Web App"
  type        = string
}

variable "resource_group_name" {
  description = "Nom du Resource Group Azure"
  type        = string
}

variable "service_plan_id" {
  description = "Identifiant de l'App Service Plan existant"
  type        = string
}

variable "java_version" {
  description = "Version Java utilisée par le backend Spring Boot"
  type        = string
  default     = "17"
}

variable "environment" {
  description = "Environnement de déploiement"
  type        = string
  default     = "dev"
}

variable "tags" {
  description = "Tags appliqués à l'Azure Linux Web App"
  type        = map(string)
  default     = {}
}

variable "virtual_network_subnet_id" {
  description = "Identifiant du subnet d’intégration App Service"
  type        = string
}
