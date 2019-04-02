
local _newline=$'\n'
local _tab=$'\t'
local _lineup=$'\e[1A'
local _linedown=$'\e[1B'

source ${flower7c3_directory}/git.zsh
function theme_prompt_clock {
  echo -n "%{$fg[white]%}"
  echo -n "$(print_icon 'TIME_ICON')"
  echo -n "%*"
  echo -n "%{${reset_color}%}"
}
function theme_prompt_context {
  echo -n "%{$fg[green]%}"
  echo -n "$(print_icon 'APPLE_ICON') "
  echo -n "%n@%m"
  echo -n "%{${reset_color}%}"
}
function theme_prompt_path {
  echo -n "%{$terminfo[bold]$fg[yellow]%}"
  echo -n "$(print_icon 'FOLDER_ICON') "
  echo -n "%~"
  echo -n "%{${reset_color}%}"
}
function theme_prompt_welcome_sign {
  echo -n "${%$terminfo[bold]}%(#,%{$fg[red]%}#%},%{$fg[cyan]%}$%}) %{${reset_color}%}"
}
function theme_prompt_exit_code {
  echo -n "%(?,, %{$fg[red]%}\u2716%?%{${reset_color}%})"
}

function theme_prompt_special {
  if [[ "$1" == "newline" ]]; then
    echo -n '$_newline'
  elif [[ "$1" == "tab" ]]; then
    echo -n '$_tab'
  elif [[ "$1" == "space" ]]; then
    echo -n ' '
  elif [[ "$1" == "lineup" ]]; then
    echo -n '$_lineup'
  elif [[ "$1" == "linedown" ]]; then
    echo -n '$_linedown'
  elif [[ "$1" == "clock" ]]; then
    echo -n '$(theme_prompt_clock)'
  elif [[ "$1" == "context" ]]; then
    echo -n '$(theme_prompt_context)'
  elif [[ "$1" == "path" ]]; then
    echo -n '$(theme_prompt_path)'
  elif [[ "$1" == "welcome_sign" ]]; then
    echo -n '$(theme_prompt_welcome_sign)'
  elif [[ "$1" == "git" ]]; then
    echo -n '$(theme_prompt_git)'
  elif [[ "$1" == "exit_code" ]]; then
    echo -n '$(theme_prompt_exit_code)'
  else
  	local command_name=theme_prompt_$1
  	echo -n $($command_name)
  fi
}
