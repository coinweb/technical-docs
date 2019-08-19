workflow "Jekyll build now" {
  resolves = [
    "Jekyll Action",
  ]
  on = "push"
}

action "Filters for GitHub Actions" {
  uses = "actions/bin/filter@b2bea0749eed6beb495a8fa194c071847af60ea1"
  args = "branch develop"
}

action "Jekyll Action" {
  needs = "Filters for GitHub Actions"
  uses = "shalzz/zola-deploy-action@master"
  env = {
    PAGES_BRANCH = "gh-pages"
  }
  secrets = ["TOKEN"]
}
