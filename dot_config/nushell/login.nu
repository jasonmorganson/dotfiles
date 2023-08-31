if $env.CODESPACES == "true" {
    let $TEA_FILE = ".tea.yaml"
    let $PWD_TEA_PATH = ($env.PWD | path join $TEA_FILE)
    let $HOME_TEA_PATH = ($env.HOME | path join $TEA_FILE)
    if ($HOME_TEA_PATH | path exists) {
        if ($PWD_TEA_PATH | path exists) {
            let $pwd = (open $PWD_TEA_PATH)
            let $home = (open $HOME_TEA_PATH)
            $pwd | upsert dependencies ($home.dependencies | merge $pwd.dependencies) | save --force $PWD_TEA_PATH
        } else {
            cp $HOME_TEA_PATH $PWD_TEA_PATH
        }
    }
}
