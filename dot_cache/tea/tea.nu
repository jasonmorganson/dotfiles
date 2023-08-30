def "parse tea vars" [] {
  $in | lines | parse "{name}={value}"
}
  
def-env tea_hook [] {
  tea --chaste --env --keep-going --silent
    | parse tea vars
    | transpose --header-row
    | into record
    | load-env
}

# Run hook in home to capture tea home env regardless of the PWD
export-env {
  load-env {

    # Make sure that tea itself is in the PATH
    PATH: ($env.PATH | append ($env.HOME | path join ".tea" ".local" "bin") | prepend ($env.HOME | path join ".tea" "tea.xyz" "v0" "bin"))

    # Run hook when the PWD changes
    config: ($env.config? | default {} | upsert hooks.env_change.PWD {[{
      tea_hook
    }]})
  }

  # Set tea directory to home for first hook run to keep tea from traversing for its directory which is very slow
  TEA_DIR = $env.HOME

  # Run the hook once on load to populate initial env as nu is loading other init scripts
  tea_hook
}

