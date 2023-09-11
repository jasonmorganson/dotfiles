export-env {
  load-env {
    GIT_AUTHOR_NAME: "Jason Morganson"
    GIT_AUTHOR_EMAIL: "128727+jasonmorganson@users.noreply.github.com"
  }
  load-env {
    GIT_COMMITTER_NAME: $env.GIT_AUTHOR_NAME
    GIT_COMMITTER_EMAIL: $env.GIT_AUTHOR_EMAIL
  }
}
