def "parse tea vars" [] {
  $in | lines | parse "{name}={value}"
}
  
def-env tea_hook [] {
  tea --env --silent
    | parse tea vars
    | transpose --header-row
    | into record
    | load-env
}

# Run hook in home to capture tea home env regardless of the PWD
export-env {
  load-env {

    # Make sure that tea itself is in the PATH
    PATH: ($env.PATH | prepend ($env.HOME | path join ".tea" "tea.xyz" "v*" "bin"))

    # Run hook when the PWD changes
    config: ($env.config? | default {} | upsert hooks.env_change.PWD {[{
      tea_hook
    }]})
  }

  # Run the hook once on load to populate initial env as nu is loading other init scripts
  tea_hook
}

