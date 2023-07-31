def "parse tea vars" [] {
  $in | lines | parse "{name}={value}"
}
  
def-env tea_hook [] {
  ~/.tea/.local/bin/tea --env --silent
    | parse tea vars
    | transpose --header-row
    | into record
    | load-env
}

# Run hook in home to capture tea home env regardless of the PWD
export-env {

  # Run the hook once on load to populate initial env as nu is loading other init scripts
  tea_hook
}

$env.config = ($env.config | upsert hooks.env_change.PWD {[{ tea_hook }]})
