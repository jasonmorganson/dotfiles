def "parse rtx vars" [] {
  $in | lines | parse "{op},{name},{value}"
}

def-env "update rtx env" [] {
  for $var in $in {
    if $var.op == "set" {
      let-env $var.name = $"($var.value)"
    } else if $var.op == "hide" {
      hide-env $var.name
    }
  }
}
  
def-env rtx_hook [] {
  rtx hook-env -s nu
    | parse rtx vars
    | update rtx env
}

export-env { rtx_hook }
