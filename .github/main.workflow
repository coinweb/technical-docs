workflow "Jekyll build now" {
  resolves = [
    "Jekyll Action",
  ]
  on = "push"
}

action "Jekyll Action" {
  uses = "helaili/jekyll-action@master"
  env = {
    SRC = "_site"
  }
  secrets = [
    "JEKYLL_PAT",
    "GITHUB_TOKEN",
  ]
}
