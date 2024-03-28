const zellij_dark_theme = `
themes {
    default {
        fg 245
        bg 0
        black 0
        red 161
        green 154
        yellow 3
        blue 4
        magenta 5
        cyan 6
        white 231
        orange 202
    }
}
`

const zellij_light_theme = `
themes {
    default {
        fg 248
        bg 16
        black 231
        red 161
        green 40
        yellow 3
        blue 4
        magenta 5
        cyan 6
        white 246
        orange 9
    }
}
`
export def --env dark [] {
  $env.config.color_config = $dark_theme
  $env.LS_COLORS = (vivid --color-mode 8-bit generate one-dark | str trim)
  $zellij_dark_theme | save --force ~/.config/zellij/themes/theme.kdl
}

export def --env light [] {
  $env.config.color_config = $light_theme
  $env.LS_COLORS = (vivid --color-mode 8-bit generate one-light | str trim)
  $zellij_light_theme | save --force ~/.config/zellij/themes/theme.kdl
}
