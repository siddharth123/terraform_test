terraform {
  required_providers {
    databricks = {
      source = "databricks/databricks"
    }
  }
  required_version = ">= 0.12"
}

provider "databricks" {
  host  = var.databricks_host
  token = var.databricks_token
}
