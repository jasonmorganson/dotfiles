def "parse tea vars" [] {
  $in | lines | parse "{name}={value}" | where name != 'undefined'
}

def-env "update tea env" [] {
  for $var in $in {
    let-env $var.name = $"($var.value)"
  }
}
  
def-env tea_hook [] {
  tea --env --silent
    | parse tea vars
    | update tea env
}

export-env { tea_hook }
