variable "AZURE_SUB_ID_SECRET" {}
data "github_secret" "AZURE_TENANT_ID_SECRET" {
  secret_name = "AZURE_TENANT"
}
data "github_secret" "AZURE_CLIENT_ID_SECRET" {
  secret_name = "AZURE_CLIENT_ID"
}
data "github_secret" "AZURE_CLIENT_SECRET_SECRET" {
  secret_name = "AZURE_CLIENT_SECRET"
}
