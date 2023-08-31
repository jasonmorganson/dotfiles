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

  # Set tea directory to home for first hook run to keep tea from traversing for its directory which is very slow
  $env.TEA_DIR = $env.HOME

  # Run the hook once on load to populate initial env as nu is loading other init scripts
  tea-hook
}

