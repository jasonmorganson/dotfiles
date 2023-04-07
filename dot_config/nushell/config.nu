source ~/.cache/tea/init.nu
source ~/.cache/rtx/init.nu

def-env pre_prompt_hook [] {
    tea_hook
    rtx_hook
}

def-env env_change_hook [] {
    tea_hook
    rtx_hook
}

let-env config = {
    show_banner: false
    edit_mode: vi
    cursor_shape: {
        vi_insert: underscore
        vi_normal: block
    }
    hooks: {
        pre_prompt: [{
            code: "pre_prompt_hook"
        }]
        env_change: {
            PWD: [{
                code: "env_change_hook"
            }]
        }
    }
}

source ~/.cache/starship/init.nu
source ~/.config/nushell/aliases.nu
