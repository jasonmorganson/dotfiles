export-env {
  let-env TEA_SHELL = "nu"
  
  let-env config = ($env.config | upsert hooks {
      pre_prompt: [{
      condition: { "TEA_SHELL" in $env }
      code: { tea_hook }
      }]
      env_change: {
          PWD: [{
          condition: { "TEA_SHELL" in $env }
          code: { tea_hook }
          }]
      }
  })
}
  
def "parse vars" [] {
  $in | lines | parse "{name}={value}" | where name != 'undefined'
}

def-env "update-env" [] {
  for $var in $in {
    let-env $var.name = $"($var.value)"
  }
}
  
def-env tea_hook [] {
  ^"/usr/local/bin/tea" -E
    | parse vars
    | update-env
}

