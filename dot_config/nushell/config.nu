source ~/.cache/tea/init.nu
source ~/.cache/starship/init.nu
source ~/.config/nushell/aliases.nu

let-env config = {
    edit_mode: vi
    hooks: {
        env_change: {
            PWD: [
                { tea_hook }
            ]
        }
    }
}
