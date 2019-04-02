################################################################
# Oh-My-ZSH theme
################################################################
# Tested on OSX ANSI colors.
# It is recommended to use with a dark background.
# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.
#
# Apr 2019 Bartłomiej Kwiatek
################################################################

# Try to set the installation path
if [[ -n "$FLOWER_THEME_INSTALLATION_DIR" ]]; then
  flower7c3_theme_directory=${FLOWER_THEME_INSTALLATION_DIR:A}
else
  if [[ "${(%):-%N}" == '(eval)' ]]; then
    if [[ "$0" == '-antigen-load' ]] && [[ -r "${PWD}/flower7c3.zsh-theme" ]]; then
      # Antigen uses eval to load things so it can change the plugin (!!)
      # https://github.com/zsh-users/antigen/issues/581
      flower7c3_theme_directory=$PWD
    else
      print -P "%F{red}You must set FLOWER_THEME_INSTALLATION_DIR work from within an (eval).%f"
      return 1
    fi
  else
    # Get the path to file this code is executing in; then
    # get the absolute path and strip the filename.
    # See https://stackoverflow.com/a/28336473/108857
    flower7c3_theme_directory=${${(%):-%x}:A:h}
  fi
fi

################################################################
# load resources

source ${flower7c3_theme_directory}/default.zsh
source ${flower7c3_theme_directory}/icons.zsh
source ${flower7c3_theme_directory}/utilities.zsh
source ${flower7c3_theme_directory}/section.zsh
source ${flower7c3_theme_directory}/section_git.zsh

################################################################
# generate prompt using config

PROMPT=""
for command in "${ZSH_THEME_FLOWER7C3_PROMPT_LEFT[@]}"; do
  PROMPT="${PROMPT}$(_theme_section ${command})"
done
RPROMPT=""
for command in "${ZSH_THEME_FLOWER7C3_PROMPT_RIGHT[@]}"; do
  RPROMPT="${RPROMPT}$(_theme_section ${command})"
done
