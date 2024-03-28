export-env {
  load-env {
    GITHUB_USER: (gh api https://api.github.com/user | from json | get login)
  }
}
