workflow "Jekyll build now" {
  resolves = [
    "Jekyll Action",
  ]
  on = "push"
}

action "Jekyll Action" {
  uses = "helaili/jekyll-action@master"
  env = {
    SRC = "."
  }
  secrets = [
    "JEKYLL_PAT",
    "GITHUB_TOKEN",
  ]
}

action "Filters for GitHub Actions" {
  uses = "actions/bin/filter@b2bea0749eed6beb495a8fa194c071847af60ea1"
  args = "branch master"
}
