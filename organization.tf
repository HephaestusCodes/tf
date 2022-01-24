# Adding members
# resource "github_membership" "hephaestus" {
#   username = "hephaestus"
#   role     = "member"
# }

# Team management
resource "github_team" "reviewers" {
    name            = "reviewers"
    description     = "Reviewer Team"
    privacy         = "closed"
}

resource "github_team_membership" "reviewers" {
    count = length(var.reviewers_team)
    team_id = github_team.reviewers.id
    username = element(var.reviewers_team, count.index)
    role = "maintainer"
}