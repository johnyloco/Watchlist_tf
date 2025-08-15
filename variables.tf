# Main configuration file for Azure resources
variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID"
}

variable "resource_group_name" {
  type        = string
  description = "resource group name"
}

variable "resource_group_location" {
  type        = string
  description = "resource group location"
}

variable "app_service_plan_name" {
  type        = string
  description = "app service plan name"
}

variable "app_service_name" {
  type        = string
  description = "app service name"
}

variable "sql_server_name" {
  type        = string
  description = "SQL server name"
}

variable "sql_database_name" {
  type        = string
  description = "SQL database name"
}

variable "sql_admin_login" {
  type        = string
  description = "SQL admin login"
}

variable "sql_admin_password" {
  type        = string
  description = "SQL admin password"
}

variable "firewall_rule_name" {
  type        = string
  description = "Firewall rule name"
}

variable "repo_github_url" {
  type        = string
  description = "GitHub repository URL for the web app"
}


# Secondary Variable File
variable "os_type" {
  type        = string
  description = "Operating system type for the App Service Plan"
}

variable "sku_name" {
  type        = string
  description = "SKU name for the App Service Plan"
}

variable "sql_version" {
  type        = string
  description = "Version of the SQL Server"
}

variable "sql_collation" {
  type        = string
  description = "Collation for the SQL Database"
}

variable "sql_sku_name" {
  type        = string
  description = "SKU name for the SQL Database"
}

variable "zone_redundant" {
  type        = bool
  description = "Indicates if the SQL Database is zone redundant"
}

variable "start_ip_address" {
  type        = string
  description = "Start IP address for the SQL Server firewall rule"
}

variable "end_ip_address" {
  type        = string
  description = "End IP address for the SQL Server firewall rule"
}


variable "dotnet_version" {
  type        = string
  description = "Version of .NET to be used in the Linux Web App"
}

variable "always_on" {
  type        = bool
  description = "Indicates if the Linux Web App should always be on"
}

variable "connection_string_name" {
  type        = string
  description = "Name of the connection string for the Linux Web App"
}

variable "connection_string_type" {
  type        = string
  description = "Type of the connection string for the Linux Web App"
}

variable "branch" {
  type        = string
  description = "Branch of the GitHub repository to be used for the Linux Web App"
}