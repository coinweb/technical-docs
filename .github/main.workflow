workflow "Jekyll build now" {
  resolves = [
    "Jekyll Action",
  ]
  on = "push"
}

action "Jekyll Action" {
  uses = "helaili/jekyll-action@master"
  needs = "Filters for GitHub Actions"
  env = {
    SRC = "_site"
  }
  secrets = ["JEKYLL_PAT"]
}

action "Filters for GitHub Actions" {
  uses = "actions/bin/filter@b2bea0749eed6beb495a8fa194c071847af60ea1"
  args = "branch develop"
}