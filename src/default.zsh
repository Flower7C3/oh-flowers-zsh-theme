################################################################
# Default prompt configuration
################################################################

# see http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Date-and-time
if [ -z "$ZSH_THEME_FLOWER7C3_DATE_FORMAT" ]; then
  ZSH_THEME_FLOWER7C3_DATE_FORMAT="%d.%m.%y"
fi
if [ -z "$ZSH_THEME_FLOWER7C3_TIME_FORMAT" ]; then
  ZSH_THEME_FLOWER7C3_TIME_FORMAT="%K:%M:%S"
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
