provider "github" {
    token = "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"

  }

resource "github_repository" "terraform-first-repo" {
  name        = "repo-from-terraform"
  description = "My first respository by terraform"
  visibility = "public"
  auto_init = true

  
}