let PWD = $env.PWD

def "parse tea vars" [] {
  $in | lines | parse "{name}={value}" | where name != 'undefined'
}
  
def-env tea_hook [] {
  ~/.tea/.local/bin/tea --env --silent
    | parse tea vars
    | transpose --header-row
    | into record
    | load-env
}

# Run hook in home to capture tea home env regardless of the PWD
$env.PWD = $env.HOME
tea_hook
$env.PWD = $PWD

$env.config = ($env.config | upsert hooks.env_change.PWD {[{ tea_hook }]})
