################################################################
# Default prompt configuration
################################################################

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

# see http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Date-and-time
if [ -z "$ZSH_THEME_FLOWER7C3_DATE_FORMAT" ]; then
  ZSH_THEME_FLOWER7C3_DATE_FORMAT='%d.%m.%y'
fi
if [ -z "$ZSH_THEME_FLOWER7C3_TIME_FORMAT" ]; then
  ZSH_THEME_FLOWER7C3_TIME_FORMAT='%K:%M:%S'
fi

if [ -z "$ZSH_THEME_FLOWER7C3_GIT_UPSTREAM_PREFIX" ]; then
    ZSH_THEME_FLOWER7C3_GIT_UPSTREAM_PREFIX='['
fi
if [ -z "$ZSH_THEME_FLOWER7C3_GIT_UPSTREAM_SUFFIX" ]; then
    ZSH_THEME_FLOWER7C3_GIT_UPSTREAM_SUFFIX=']'
fi
if [ -z "$ZSH_THEME_FLOWER7C3_GIT_CHANGES_PREFIX" ]; then
    ZSH_THEME_FLOWER7C3_GIT_CHANGES_PREFIX='('
fi
if [ -z "$ZSH_THEME_FLOWER7C3_GIT_CHANGES_SEPARATOR" ]; then
    ZSH_THEME_FLOWER7C3_GIT_CHANGES_SEPARATOR='|'
fi
if [ -z "$ZSH_THEME_FLOWER7C3_GIT_CHANGES_SUFFIX" ]; then
    ZSH_THEME_FLOWER7C3_GIT_CHANGES_SUFFIX=')'
fi
