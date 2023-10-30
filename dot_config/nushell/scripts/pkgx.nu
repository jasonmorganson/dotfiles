export def-env dev [
  toggle?: string # Toogle dev env
] {
  if $toggle == 'off' {
    # _pkgx_deactivate
  } else {
    pkgx env
    | lines
    | parse "{name}={value}"
    | where not name in ["FILE_PWD", "CURRENT_FILE"]
    | transpose --header-row
    | into record
    | load-env
  }
}

export-env {
  load-env {
    config: (
      $env.config?
      | default {}
      | upsert hooks {
        env_change: {
          PWD: {
            dev
          }
        }
      }
    )
  }
}
