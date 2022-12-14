source ~/.config/nushell/aliases.nu

let external_completer = {|spans|
  {
    $spans.0: {carapace $spans.0 nushell $spans | from json } # default
  } | get $spans.0 | each {|it| do $it}
}

let-env config = {
    show_banner: false
    edit_mode: vi
    external_completer: $external_completer
    hooks: {
    pre_prompt: [{
        code: "
          let direnv = (direnv export json | from json)
          let direnv = if ($direnv | length) == 1 { $direnv } else { {} }
          $direnv | load-env
        "
    }]
  }
}

source ~/.cache/starship/init.nu
