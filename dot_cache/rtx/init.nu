def-env rtx [command?: string, --help, ...rest: string] {
  let commands = ["shell", "deactivate"]
  
  if ($command == null) {
    ^$"($env.HOME)/.local/share/rtx/bin/rtx"
  } else if ($command == "activate") {
    let-env RTX_SHELL = "nu"
  } else if ($command in $commands) {
    ^$"($env.HOME)/.local/share/rtx/bin/rtx" $command $rest
    | parse vars
    | update-env
  } else {
    ^$"($env.HOME)/.local/share/rtx/bin/rtx" $command $rest
  }
}
  
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
  ^$"($env.HOME)/.local/share/rtx/bin/rtx" hook-env -s nu
    | parse rtx vars
    | update rtx env
}

export-env { rtx_hook }
