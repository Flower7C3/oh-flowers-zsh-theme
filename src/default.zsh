################################################################
# Default prompt configuration
################################################################

if [ -z "$ZSH_THEME_FLOWER7C3_MODE" ]; then
  ZSH_THEME_FLOWER7C3_MODE="nerdfont-fontconfig"
fi
if [ -z "$ZSH_THEME_FLOWER7C3_PROMPT_LEFT" ]; then
  ZSH_THEME_FLOWER7C3_PROMPT_LEFT=(
      exit_code
      path._newline
      git._space
      welcome_sign._newline._space
  )
fi
if [ -z "$ZSH_THEME_FLOWER7C3_PROMPT_RIGHT" ]; then
  ZSH_THEME_FLOWER7C3_PROMPT_RIGHT=(
    lineup
    context
    clock._space
    linedown
  )
fi
