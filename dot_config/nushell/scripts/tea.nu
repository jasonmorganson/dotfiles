export-env {
  load-env {
    config: (
      $env.config?
      | default {}
      | upsert hooks {
        env_change: {
          PWD: {
            ~/.tea/tea.xyz/v0/bin/tea --chaste --env --keep-going --silent
            | lines
            | parse "{name}={value}"
            | transpose --header-row
            | into record
            | load-env
          }
        }
      }
    )
  }
}
