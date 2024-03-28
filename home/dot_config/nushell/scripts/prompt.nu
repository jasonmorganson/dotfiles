source ../default_env.nu

export-env { load-env {
    PROMPT_COMMAND: {|| }
    PROMPT_INDICATOR: {|| "〉" }
    PROMPT_INDICATOR_VI_INSERT: {|| "〉" }
    PROMPT_INDICATOR_VI_NORMAL: {|| ": " }
    PROMPT_MULTILINE_INDICATOR: {|| "::: " }
    PROMPT_COMMAND_RIGHT: {|| }
    TRANSIENT_PROMPT_COMMAND: {|| create_left_prompt }
    TRANSIENT_PROMPT_INDICATOR: {|| " | " }
    TRANSIENT_PROMPT_INDICATOR_VI_INSERT: {|| " | " }
    TRANSIENT_PROMPT_INDICATOR_VI_NORMAL: {|| " | " }
    TRANSIENT_PROMPT_MULTILINE_INDICATOR: {|| " | " }
    TRANSIENT_PROMPT_COMMAND_RIGHT: {|| create_right_prompt }
}}
