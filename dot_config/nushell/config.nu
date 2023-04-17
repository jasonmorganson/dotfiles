source ~/.cache/tea/init.nu
source ~/.cache/rtx/init.nu
source ~/.cache/starship/init.nu
source ~/.config/nushell/aliases.nu

let-env config = {
    show_banner: false
    edit_mode: vi
    cursor_shape: {
        vi_insert: underscore
        vi_normal: block
    }
    hooks: {
        pre_prompt: [{
            code: { ||
                tea_hook
                rtx_hook
            }
        }]
        env_change: {
            PWD: [{
                code: { ||
                    tea_hook
                    rtx_hook
                }
            }]
        }
    }
}
