def-env tea-hook [] {
  ~/.tea/tea.xyz/v0/bin/tea --chaste --env --keep-going --silent
    | lines
    | parse "{name}={value}"
    | transpose --header-row
    | into record
    | load-env
}

# Run hook in home to capture tea home env regardless of the PWD
export-env {
  load-env {

    # Run hook when the PWD changes
    config: ($env.config? | default {} | upsert hooks.env_change.PWD ($env.config?.hooks?.env_change?.PWD? | default [] | append { tea-hook }))
  }
}

