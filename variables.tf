# ==========================================
# 1. PARAMÈTRES GÉNÉRAUX AZURE
# ==========================================

variable "subscription_id" {
  description = "Identifiant de l'abonnement Azure utilisé pour le déploiement"
  type        = string
  default     = "5e683e0f-b00c-48d6-9769-5aaf598de8f1"
}

variable "location" {
  description = "Région Azure principale du déploiement"
  type        = string
  default     = "francecentral"
}

variable "resource_group_name" {
  description = "Nom du Resource Group Azure existant"
  type        = string
  default     = "aelouadiRG"
}

variable "app_service_plan_name" {
  description = "Nom de l'App Service Plan partagé existant"
  type        = string
  default     = "plan-npr-prf2026"
}

variable "service_plan_resource_group_name" {
  description = "Nom du groupe de ressources contenant le plan App Service mutualisé"
  type        = string
}

variable "project_name" {
  description = "Nom court du projet utilisé pour nommer les ressources"
  type        = string
  default     = "quiz"
}

variable "environment" {
  description = "Environnement de déploiement"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "test", "staging", "prod"], var.environment)
    error_message = "L'environnement doit être dev, test, staging ou prod."
  }
}

variable "owner" {
  description = "Nom du propriétaire du projet"
  type        = string
  default     = "aelouadi"
}

# ==========================================
# 2. BACKEND SPRING BOOT
# ==========================================

variable "backend_app_name" {
  description = "Nom de l'Azure App Service hébergeant le backend Spring Boot"
  type        = string
  default     = "app-quiz-backend-aelouadi"
}

variable "backend_java_version" {
  description = "Version Java utilisée par le backend Spring Boot"
  type        = string
  default     = "21"
}

variable "backend_api_key" {
  description = "Clé API utilisée pour sécuriser les appels vers le backend"
  type        = string
  sensitive   = true
  default     = ""
}

# ==========================================
# 3. FRONTEND ANGULAR
# ==========================================

variable "static_web_app_name" {
  description = "Nom de l'Azure Static Web App hébergeant le frontend Angular"
  type        = string
  default     = "stapp-quiz-frontend-aelouadi"
}

variable "static_web_app_sku_tier" {
  description = "Niveau de tarification de l'Azure Static Web App"
  type        = string
  default     = "Free"
}

variable "static_web_app_sku_size" {
  description = "Taille du SKU de l'Azure Static Web App"
  type        = string
  default     = "Free"
}

# ==========================================
# 4. POSTGRESQL FLEXIBLE SERVER
# ==========================================

variable "postgresql_server_name" {
  description = "Nom du serveur Azure PostgreSQL Flexible Server"
  type        = string
  default     = "psql-quiz-aelouadi"
}

variable "postgresql_database_name" {
  description = "Nom de la base de données PostgreSQL"
  type        = string
  default     = "quizdb"
}

variable "postgresql_admin_username" {
  description = "Nom du compte administrateur PostgreSQL"
  type        = string
  default     = "quizadmin"
}

variable "postgresql_admin_password" {
  description = "Mot de passe du compte administrateur PostgreSQL"
  type        = string
  sensitive   = true
  default     = ""
}

variable "postgresql_sku_name" {
  description = "SKU du serveur PostgreSQL Flexible Server"
  type        = string
  default     = "B_Standard_B1ms"
}

variable "postgresql_version" {
  description = "Version de PostgreSQL"
  type        = string
  default     = "16"
}

variable "postgresql_storage_mb" {
  description = "Espace de stockage attribué au serveur PostgreSQL en mégaoctets"
  type        = number
  default     = 32768
}

# ==========================================
# 5. REDIS
# ==========================================

variable "redis_name" {
  description = "Nom de l'instance Redis utilisée par l'application"
  type        = string
  default     = "redis-quiz-aelouadi"
}

variable "redis_sku_name" {
  description = "SKU de l'instance Redis"
  type        = string
  default     = "Basic"
}

variable "redis_family" {
  description = "Famille du SKU Redis"
  type        = string
  default     = "C"
}

variable "redis_capacity" {
  description = "Capacité de l'instance Redis"
  type        = number
  default     = 0
}

# ==========================================
# 6. STORAGE ACCOUNT
# ==========================================

variable "storage_account_name" {
  description = "Nom du compte de stockage Azure"
  type        = string
  default     = "staquizelouadi"
}

variable "storage_account_tier" {
  description = "Niveau de performance du compte de stockage"
  type        = string
  default     = "Standard"
}

variable "storage_replication_type" {
  description = "Type de réplication du compte de stockage"
  type        = string
  default     = "LRS"
}

# ==========================================
# 7. KEY VAULT
# ==========================================

variable "key_vault_name" {
  description = "Nom de l'Azure Key Vault"
  type        = string
  default     = "kv-quiz-aelouadi"
}

variable "key_vault_sku_name" {
  description = "SKU de l'Azure Key Vault"
  type        = string
  default     = "standard"
}

# ==========================================
# 8. TAGS DE GOUVERNANCE
# ==========================================

variable "tags" {
  description = "Tags appliqués aux ressources Azure créées par Terraform"
  type        = map(string)

  default = {
    Project     = "Azure-Quiz"
    Environment = "dev"
    Owner       = "aelouadi"
    ManagedBy   = "Terraform"
  }
}

# ==========================================
# 9. modules backend, Storage et Key Vault
# ==========================================
variable "virtual_network_name" {
  description = "Nom du réseau virtuel Azure Quiz"
  type        = string
  default     = "vnet-quiz-aelouadi"
}

variable "backend_subnet_name" {
  description = "Nom du subnet d’intégration du backend"
  type        = string
  default     = "snet-backend"
}

variable "virtual_network_address_space" {
  description = "Plage d’adresses du réseau virtuel"
  type        = list(string)
  default     = ["10.20.0.0/16"]
}

variable "backend_subnet_prefixes" {
  description = "Plage d’adresses du subnet backend"
  type        = list(string)
  default     = ["10.20.1.0/24"]
}
