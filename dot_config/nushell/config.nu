source ./default_config.nu

$env.config = (
  $env.config
  | upsert edit_mode vi
  | upsert history.file_format "sqlite"
  | upsert history.isolation true
  | upsert cursor_shape {
        emacs: line # block, underscore, line, blink_block, blink_underscore, blink_line, inherit to skip setting cursor shape (line is the default)
        vi_insert: blink_block # block, underscore, line, blink_block, blink_underscore, blink_line, inherit to skip setting cursor shape (block is the default)
        vi_normal: blink_underscore # block, underscore, line, blink_block, blink_underscore, blink_line, inherit to skip setting cursor shape (underscore is the default)
    }
)


use theme.nu
overlay use git.nu
overlay use aliases.nu

source ./scripts/prompt.nu
