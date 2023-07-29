source ~/.cache/tea/init.nu
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
        env_change: {
            PWD: [
                { tea_hook }
            ]
        }
    }
}
