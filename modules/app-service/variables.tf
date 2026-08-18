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
  default     = "21"
}

variable "environment" {
  description = "Environnement de déploiement"
  type        = string
  default     = "dev"
}

variable "postgresql_url" {
  description = "URL JDBC PostgreSQL"
  type        = string
}

variable "postgresql_username" {
  description = "Utilisateur PostgreSQL"
  type        = string
}

variable "postgresql_password" {
  description = "Mot de passe PostgreSQL"
  type        = string
  sensitive   = true
}

variable "redis_hostname" {
  description = "Hostname Azure Managed Redis"
  type        = string
}

variable "redis_port" {
  description = "Port Redis"
  type        = string
}

variable "redis_password" {
  description = "Mot de passe Redis"
  type        = string
  sensitive   = true
}

variable "storage_account_name" {
  description = "Nom du Storage Account"
  type        = string
}

variable "storage_container_name" {
  description = "Nom du container Blob"
  type        = string
}

variable "backend_api_key" {
  description = "Clé API utilisée pour protéger le backend"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags appliqués à l'Azure Linux Web App"
  type        = map(string)
  default     = {}
}
variable "frontend_origin" {
  description = "Origine autorisée pour les requêtes CORS du frontend"
  type        = string
}
