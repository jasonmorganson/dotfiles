if $env.CODESPACES? == "true" {
    let $PKGX_FILE = ".pkgx.yaml"
    let $PWD_PKGX_PATH = ($env.PWD | path join $PKGX_FILE)
    let $HOME_PKGX_PATH = ($env.HOME | path join $PKGX_FILE)
    if ($HOME_PKGX_PATH | path exists) {
        if ($PWD_PKGX_PATH | path exists) {
            let $pwd = (open $PWD_PKGX_PATH)
            let $home = (open $HOME_PKGX_PATH)
            $pwd | upsert dependencies ($home.dependencies | merge $pwd.dependencies) | save --force $PWD_PKGX_PATH
        } else {
            cp $HOME_PKGX_PATH $PWD_PKGX_PATH
        }
    }
}
