resource "github_repository" "tf" {
    name            = "tf"
    description     = "Terraform management of HephaestusCodes organization's repository"
    private         = false

    has_downloads   = false
    has_issues      = true
    has_projects    = false
    has_wiki        = false

    allow_merge_commit  = false
    allow_rebase_merge  = false
    allow_squash_merge  = true

    auto_init           = true

    topics = [
        "terraform",
        "automation"
    ]

    # to base a repo off of a template (I don't have a template (yet))
    # template {
    #     owner   = "HepheastusCodes"
    #     repo    = "terraform-module-template"
    # }
    # to rename a repo, edit in the browser then run: terraform state rm github_repository.monitoring-app
    # then terraform import github_repository.monitoring-app monitoring-app
}
# A lot of this doesn't work very well with one user :D
resource "github_branch_protection" "tf" {
    repository  = github_repository.tf.name
    branch      = "main" # branch = "release-*" nifty feature

    enforce_admins = true

    require_signed_commits = true

    # required_pull_request_reviews {
    #     dismiss_stale_reviews = true
    #     dismissal_teams = ["reviewers"]
    #     required_approving_review_count = ceil((length(var.reviewers_team)/2))
    # }
}

# resource "github_team_repository" "monitoring-app" {
# team_id = github_team.reviewers.id
# repository = github_repository.monitoring-app.name
# permission = "push"    # Or "admin" or w.e
# }