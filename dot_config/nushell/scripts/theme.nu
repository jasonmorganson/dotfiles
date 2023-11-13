module theme {
  export def dark [] {
    $env.config.color_config = $dark_theme
  }

  export def light [] {
    $env.config.color_config = $light_theme
  }
}
