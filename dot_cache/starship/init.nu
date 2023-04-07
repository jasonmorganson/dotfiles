let-env STARSHIP_SHELL = "nu"
let-env STARSHIP_SESSION_KEY = (random chars -l 16)
let-env PROMPT_MULTILINE_INDICATOR = (^/usr/local/bin/starship prompt --continuation)

# Does not play well with default character module.
let-env PROMPT_INDICATOR = ""

# TODO: Also Use starship vi mode indicators?
let-env PROMPT_INDICATOR_VI_INSERT = ""
let-env PROMPT_INDICATOR_VI_NORMAL = ""

let-env PROMPT_COMMAND = {
    # jobs are not supported
    let width = (term size).columns
    ^/usr/local/bin/starship prompt $"--cmd-duration=($env.CMD_DURATION_MS)" $"--status=($env.LAST_EXIT_CODE)" $"--terminal-width=($width)"
}

# Whether we have config items
let has_config_items = (not ($env | get -i config | is-empty))

let-env config = if $has_config_items {
    $env.config | upsert render_right_prompt_on_last_line true
} else {
    {render_right_prompt_on_last_line: true}
}

let-env PROMPT_COMMAND_RIGHT = {
    let width = (term size).columns
    ^/usr/local/bin/starship prompt --right $"--cmd-duration=($env.CMD_DURATION_MS)" $"--status=($env.LAST_EXIT_CODE)" $"--terminal-width=($width)"
}
