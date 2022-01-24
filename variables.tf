variable "github_token" {
  description   = "Personal Access Token"
  type		= string
}

variable "reviewers_team" {
  description = "Team members responsible for reviewing code"
  type        = list(string)
  default     = ["mjluck"]
}