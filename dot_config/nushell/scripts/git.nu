export-env {
  load-env {
    GIT_AUTHOR_NAME: (gh api https://api.github.com/user | from json | get name)
    GIT_AUTHOR_EMAIL: (gh api https://api.github.com/user/public_emails | from json | take 1 | get email | get 0)
  }
  load-env {
    GIT_COMMITTER_NAME: $env.GIT_AUTHOR_NAME
    GIT_COMMITTER_EMAIL: $env.GIT_AUTHOR_EMAIL
  }
}
