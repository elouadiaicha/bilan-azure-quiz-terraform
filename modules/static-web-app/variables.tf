variable "static_web_app_name" {
  description = "Nom de l'Azure Static Web App hébergeant le frontend Angular"
  type        = string
}

variable "resource_group_name" {
  description = "Nom du Resource Group Azure"
  type        = string
}

variable "location" {
  description = "Région Azure de la Static Web App"
  type        = string
}

variable "sku_tier" {
  description = "Tier de l'Azure Static Web App"
  type        = string
  default     = "Free"
}

variable "sku_size" {
  description = "Taille de l'Azure Static Web App"
  type        = string
  default     = "Free"
}

variable "tags" {
  description = "Tags appliqués à la Static Web App"
  type        = map(string)
  default     = {}
}
