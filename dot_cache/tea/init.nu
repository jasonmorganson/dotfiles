let PWD = $env.PWD

def "parse tea vars" [] {
  $in | lines | parse "{name}={value}" | where name != 'undefined'
}

def-env "update tea env" [] {
  for $var in $in {
    let-env $var.name = $"($var.value)"
  }
}
  
def-env tea_hook [] {
  ~/.tea/.local/bin/tea --env --silent
    | parse tea vars
    | update tea env
}

# Run hook in home to capture tea home env regardless of the PWD
$env.PWD = $env.HOME
tea_hook
$env.PWD = $PWD

$env.config = ($env.config | upsert hooks.env_change.PWD {[{ tea_hook }]})
