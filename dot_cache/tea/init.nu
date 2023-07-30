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

$env.config = ($env.config | upsert hooks.env_change.PWD {[{ tea_hook }]})
