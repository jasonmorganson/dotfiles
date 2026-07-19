# this file is both a valid
# - overlay which can be loaded with `overlay use starship.nu`
# - module which can be used with `use starship.nu`
# - script which can be used with `source starship.nu`
export-env { $env.STARSHIP_SHELL = "nu"; load-env {
    STARSHIP_SESSION_KEY: (random chars -l 16)
    PROMPT_MULTILINE_INDICATOR: (
        ^/Volumes/Home/jasonmorganson/.local/share/mise/installs/starship/1.26.0/starship prompt --continuation
    )

    # Does not play well with default character module.
    # TODO: Also Use starship vi mode indicators?
    PROMPT_INDICATOR: ""

    PROMPT_COMMAND: {||
        (
            # The initial value of `$env.CMD_DURATION_MS` is always `0823`, which is an official setting.
            # See https://github.com/nushell/nushell/discussions/6402#discussioncomment-3466687.
            let cmd_duration = if $env.CMD_DURATION_MS == "0823" { 0 } else { $env.CMD_DURATION_MS };
            ^/Volumes/Home/jasonmorganson/.local/share/mise/installs/starship/1.26.0/starship prompt
                --cmd-duration $cmd_duration
                $"--status=($env.LAST_EXIT_CODE)"
                --terminal-width (term size).columns
                ...(
                    if (which "job list" | where type == built-in | is-not-empty) {
                        ["--jobs", (job list | length)]
                    } else {
                        []
                    }
                )
        )
    }

    config: ($env.config? | default {} | merge {
        render_right_prompt_on_last_line: true
    })

    PROMPT_COMMAND_RIGHT: {||
        (
            # The initial value of `$env.CMD_DURATION_MS` is always `0823`, which is an official setting.
            # See https://github.com/nushell/nushell/discussions/6402#discussioncomment-3466687.
            let cmd_duration = if $env.CMD_DURATION_MS == "0823" { 0 } else { $env.CMD_DURATION_MS };
            ^/Volumes/Home/jasonmorganson/.local/share/mise/installs/starship/1.26.0/starship prompt
                --right
                --cmd-duration $cmd_duration
                $"--status=($env.LAST_EXIT_CODE)"
                --terminal-width (term size).columns
                ...(
                    if (which "job list" | where type == built-in | is-not-empty) {
                        ["--jobs", (job list | length)]
                    } else {
                        []
                    }
                )
        )
    }
}}
$env.FNOX_SHELL = "nu"

def --env _fnox_apply [json: string] {
    let changes = ($json | from json)
    if "set" in $changes and ($changes.set | is-not-empty) {
        $changes.set | load-env
    }
    if "unset" in $changes and ($changes.unset | is-not-empty) {
        for $var in $changes.unset {
            hide-env -i $var
        }
    }
}

def --env --wrapped fnox [...rest] {
    let command = ($rest | first | default "")
    match $command {
        "deactivate" => {
            let result = (do -i { ^"/Volumes/Home/jasonmorganson/.local/share/mise/installs/fnox/1.28.0/fnox" $command ...($rest | skip 1) } | complete)
            if ($result.stderr | str trim | is-not-empty) {
                print -e $result.stderr
            }
            if $result.exit_code == 0 and ($result.stdout | str trim | is-not-empty) {
                _fnox_apply $result.stdout
            }
            if $command == "deactivate" {
                $env.config = ($env.config | upsert hooks.pre_prompt ($env.config.hooks.pre_prompt? | default [] | where { ($in | describe) != "closure" or (view source $in) !~ "_fnox_hook" }))
                hide-env -i FNOX_SHELL
                hide-env -i __FNOX_SESSION
            }
        }
        _ => { ^"/Volumes/Home/jasonmorganson/.local/share/mise/installs/fnox/1.28.0/fnox" ...$rest }
    }
}

def --env _fnox_hook [] {
    let result = (do -i { ^"/Volumes/Home/jasonmorganson/.local/share/mise/installs/fnox/1.28.0/fnox" hook-env -s nu } | complete)
    if ($result.stderr | str trim | is-not-empty) {
        print -e $result.stderr
    }
    if $result.exit_code == 0 and ($result.stdout | str trim | is-not-empty) {
        _fnox_apply $result.stdout
    }
}

$env.config = ($env.config | upsert hooks.pre_prompt ($env.config.hooks.pre_prompt? | default [] | append {|| _fnox_hook }))
_fnox_hook
# worktrunk shell integration for nushell

# Tab completions: calls binary with COMPLETE=nu to get candidates.
# Note: nushell's completion engine bypasses custom completers when the current
# token starts with `-`, so flag completions (e.g. `wt switch --<TAB>`) don't
# appear. Subcommand and value completions work. (nushell/nushell#14504)
export def "nu-complete wt" [spans: list<string>] {
    let worktrunk_bin = if ($env.WORKTRUNK_BIN? | is-not-empty) {
        $env.WORKTRUNK_BIN
    } else {
        let external = (which -a wt | where type == "external")
        if ($external | is-empty) { return [] }
        ($external | get 0.path)
    }

    let result = (do {
        with-env { COMPLETE: nu } { ^$worktrunk_bin -- ...$spans }
    } | complete)
    if $result.exit_code != 0 { return [] }

    $result.stdout | lines | each {|line|
        let parts = ($line | split row "\t")
        if ($parts | length) >= 2 {
            { value: ($parts | get 0), description: ($parts | get 1) }
        } else {
            { value: ($parts | get 0) }
        }
    }
}

# Override wt command with split directive passing.
# Creates two temp files: one for cd (raw path) and one for exec (shell).
# WORKTRUNK_BIN can override the binary path (for testing dev builds).
#
# Nushell pipeline workaround (nushell/nushell#12643):
#
# In POSIX shells, pipes are file-descriptor plumbing — stdout flows through
# the pipe while the shell continues executing post-command logic (directive
# processing, exit codes). In nushell, a function's "output" is its return
# value (the last expression), not bytes written to fd1. When an external
# command isn't the last expression, its stdout goes to the terminal as a
# side effect but doesn't flow through `|`.
#
# This means we can't both stream stdout through a pipe AND do post-processing
# (directives, cleanup) in the same function. We handle this by splitting into
# two paths based on the subcommand:
#
# - `list`: Direct passthrough. The binary is the last expression, so stdout
#   streams to the terminal (progressive rendering) and flows through pipes
#   (`wt list --format json | from json`). No directive processing — `list`
#   never emits directives. No directive env vars are set.
#
# - Everything else: Stdout is redirected to a temp file via `o>`, then
#   returned as the function's last expression after directive processing.
#   Stderr flows to the terminal in real-time. The binary sees non-TTY stdout
#   and uses buffered mode, but commands other than `list` don't benefit from
#   progressive rendering anyway.
#
# Completer wired via `@complete` attribute on an untyped `[...args]` rest.
# The parameter-level `string@"completer"` form keeps tokens literal, which
# blocks nushell's normal argument handling for `--flag="value"` (quote
# stripping) and `~` (path expansion). Untyped rest gets that handling once
# nushell/nushell#18131 ships in stable nu; until then `--flag="value"` still
# arrives quoted. See nushell/nushell#18128 for upstream tracking.
@complete "nu-complete wt"
export def --env --wrapped wt [...args] {
    let worktrunk_bin = if ($env.WORKTRUNK_BIN? | is-not-empty) {
        $env.WORKTRUNK_BIN
    } else {
        # Find the external binary, not the custom function
        # `which -a` is needed because `which` alone only returns the custom command
        let external = (which -a wt | where type == "external")
        if ($external | is-empty) {
            error make {
                msg: "wt binary not found in PATH. Install with 'cargo install --path .' or set $env.WORKTRUNK_BIN"
            }
        }
        ($external | get 0.path)
    }

    # `list` is the only command that benefits from streaming stdout (progressive
    # table rendering). It never emits directives, so we skip directive processing
    # and let the binary be the last expression — stdout flows through pipes.
    # Note: global flags before `list` (e.g. `wt -C /path list`) miss this check
    # and fall through to the buffered path. Output is still correct, just not
    # progressively rendered.
    if (not ($args | is-empty)) and ($args | first) == "list" {
        # Direct passthrough: binary is the last expression of this branch,
        # which is the last expression of the function. Stdout streams to the
        # terminal and flows through nushell pipelines.
        ^$worktrunk_bin ...$args
    } else {
        let cd_file = (mktemp --tmpdir)
        let exec_file = (mktemp --tmpdir)
        let stdout_file = (mktemp --tmpdir)

        # Capture stdout to file for pipeline passthrough; stderr flows to terminal.
        # Nushell 0.98+ throws ShellError on non-zero exit (like bash `set -e`).
        # `try` catches it so directive processing and temp file cleanup still run.
        let exit_code = (try {
            with-env { WORKTRUNK_DIRECTIVE_CD_FILE: $cd_file, WORKTRUNK_DIRECTIVE_EXEC_FILE: $exec_file } {
                ^$worktrunk_bin ...$args o> $stdout_file
            }
            0
        } catch {
            $env.LAST_EXIT_CODE
        })

        # cd file holds a raw path — no shell parsing needed
        if ($cd_file | path exists) and (open $cd_file --raw | str trim | is-not-empty) {
            let target_dir = open $cd_file --raw | str trim
            cd $target_dir
        }

        # exec file holds arbitrary shell (e.g. from --execute).
        # Execute the whole file as one sh invocation so multi-line payloads
        # share a single shell session (matching bash/zsh/fish `source` semantics:
        # variables persist, `cd` affects later commands, etc.).
        # Env changes (export) won't persist in the nushell session, but no
        # worktrunk code emits export directives.
        if ($exec_file | path exists) and (open $exec_file --raw | str trim | is-not-empty) {
            let script = open $exec_file --raw
            ^sh -c $script
        }

        rm -f $cd_file $exec_file
        let output = (open $stdout_file --raw)
        rm -f $stdout_file

        # Return stdout or propagate failure as the function's last expression.
        # Using a failing external command (not `error make`) so nushell treats it
        # identically to the original non-zero exit — minimal display in scripts,
        # no verbose source trace.
        if $exit_code != 0 {
            if ($output | is-not-empty) { print -n $output }
            ^sh -c $"exit ($exit_code)"
        } else if ($output | is-not-empty) {
            $output
        }
    }
}

$env.config.edit_mode = "vi"
$env.config.show_banner = false
