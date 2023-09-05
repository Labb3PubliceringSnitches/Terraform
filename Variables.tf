variable "AZURE_SUB_ID_SECRET" {}
variable "AZURE_TENANT_ID_SECRET" {}
variable "AZURE_CLIENT_ID_SECRET" {}
variable "AZURE_CLIENT_SECRET_SECRET" {}

variable "create_resource_group" {
  description = "Set to true to create the resource group, or false to skip creation."
  type        = bool
  default     = true 
}