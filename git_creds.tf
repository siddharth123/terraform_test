resource "databricks_git_credential" "git_creds" {
  git_username          = var.git_user
  git_provider          = var.git_provider
  personal_access_token = var.git_token
}