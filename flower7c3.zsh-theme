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
      flower7c3_theme_directory=${PWD}
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

alias upgrade_oh_flowers_zsh_theme="(cd ${flower7c3_theme_directory} && sudo git pull)"

################################################################
# load resources

source ${flower7c3_theme_directory}/src/default.zsh
source ${flower7c3_theme_directory}/src/icons.zsh
source ${flower7c3_theme_directory}/src/utilities.zsh
source ${flower7c3_theme_directory}/src/section.zsh
source ${flower7c3_theme_directory}/src/section_git.zsh
source ${flower7c3_theme_directory}/src/main.zsh
