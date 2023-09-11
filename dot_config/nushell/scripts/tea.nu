export def-env dev [
  toggle?: string # Toogle dev env
] {
  if $toggle == 'off' {
    # _tea_deactivate
  } else {
    tea env
    | lines
    | parse "{name}={value}"
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
