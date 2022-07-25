# To delete only one terraform resource: $terraform destroy --target github_repository.terraform-second-repo

resource "github_repository" "terraform-first-repo" {
  name        = "first-repo-from-terraform"
  description = "My first resource for my youtube videos"
  visibility = "public"
  # To create readme file
  auto_init = true
}

resource "github_repository" "terraform-second-repo" {
  name        = "second-repo-from-terraform"
  description = "My first resource for my youtube videos"
  visibility = "public"
  # To create readme file
  auto_init = true
}

# To get only part from output. Example html url of github repository
# use value as resource_type.resource_name.attributes
# Example for Github will be:
# https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository#attributes-reference

output "terraform-first-repo-url" {
  value = github_repository.terraform-first-repo.html_url
}

/*

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # github_repository.terraform-first-repo will be created
  + resource "github_repository" "terraform-first-repo" {
      + allow_auto_merge       = false
      + allow_merge_commit     = true
      + allow_rebase_merge     = true
      + allow_squash_merge     = true
      + archived               = false
      + auto_init              = true
      + branches               = (known after apply)
      + default_branch         = (known after apply)
      + delete_branch_on_merge = false
      + description            = "My first resource for my youtube videos"
      + etag                   = (known after apply)
      + full_name              = (known after apply)
      + git_clone_url          = (known after apply)
      + html_url               = (known after apply)
      + http_clone_url         = (known after apply)
      + id                     = (known after apply)
      + name                   = "first-repo-from-terraform"
      + node_id                = (known after apply)
      + private                = (known after apply)
      + repo_id                = (known after apply)
      + ssh_clone_url          = (known after apply)
      + svn_url                = (known after apply)
      + visibility             = "public"
    }

Plan: 1 to add, 0 to change, 0 to destroy.

*/