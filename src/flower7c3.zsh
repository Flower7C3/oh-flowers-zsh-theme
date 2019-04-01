# Clean, simple, compatible and meaningful.
# Tested on Linux, Unix and Windows under ANSI colors.
# It is recommended to use with a dark background.
# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.
#
# Apr 2019 Bartłomiej Kwiatek

# Try to set the installation path
if [[ -n "$FLOWER7C3_THEME_INSTALLATION_DIR" ]]; then
  flower7c3_directory=${FLOWER7C3_THEME_INSTALLATION_DIR:A}
else
  if [[ "${(%):-%N}" == '(eval)' ]]; then
    if [[ "$0" == '-antigen-load' ]] && [[ -r "${PWD}/flower7c3.zsh-theme" ]]; then
      # Antigen uses eval to load things so it can change the plugin (!!)
      # https://github.com/zsh-users/antigen/issues/581
      flower7c3_directory=$PWD
    else
      print -P "%F{red}You must set FLOWER7C3_THEME_INSTALLATION_DIR work from within an (eval).%f"
      return 1
    fi
  else
    # Get the path to file this code is executing in; then
    # get the absolute path and strip the filename.
    # See https://stackoverflow.com/a/28336473/108857
    flower7c3_directory=${${(%):-%x}:A:h}
  fi
fi

source ${flower7c3_directory}/icons.zsh
source ${flower7c3_directory}/git.zsh

local _newline=$'\n'
local _tab=$'\t'
local _lineup=$'\e[1A'
local _linedown=$'\e[1B'

local clock="%{$fg[white]%}%{$(print_icon 'TIME_ICON')%}%*%{${reset_color}%}"
local at_context=" %{$fg[green]%}%{$(print_icon 'APPLE_ICON')%} %n@%m%{${reset_color}%}"
local in_path=" %{$terminfo[bold]$fg[yellow]%}%{$(print_icon 'FOLDER_ICON')%} %~%{${reset_color}%}"
local git_info='$(git_super_status)' # $(git_prompt_info)
local exit_code="%(?,, %{$fg[red]%}%{$(print_icon 'FAIL_ICON')%}%?%{${reset_color}%})"
local prompt_sign="%(#,%{$terminfo[bold]$fg[red]%}#%{${reset_color}%},%{$terminfo[bold]$fg[cyan]%}$%{${reset_color}%}) "

PROMPT="${_newline}${clock}${at_context}${in_path}${git_info}${exit_code}${_newline}${prompt_sign}"
