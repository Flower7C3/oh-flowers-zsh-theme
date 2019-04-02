
local _newline=$'\n'
local _space=$' '
local _null=$''
local _tab=$'\t'
local _lineup=$'\e[1A'
local _linedown=$'\e[1B'

source ${flower7c3_directory}/git.zsh
function theme_prompt_clock {
  echo -n "%{$fg[white]%}"
  echo -n "$1"
  echo -n "$(print_icon 'TIME_ICON')"
  echo -n "%*"
  echo -n "$2"
  echo -n "%{$reset_color%}"
}
function theme_prompt_context {
  echo -n "%{$fg[green]%}"
  echo -n "$1"
  echo -n "$(print_icon 'APPLE_ICON') "
  echo -n "%n@%m"
  echo -n "$2"
  echo -n "%{$reset_color%}"
}
function theme_prompt_path {
  echo -n "%{$terminfo[bold]$fg[yellow]%}"
  echo -n "$1"
  echo -n "$(print_icon 'FOLDER_ICON') "
  echo -n "%~"
  echo -n "$2"
  echo -n "%{$reset_color%}"
}
function theme_prompt_welcome_sign {
  echo -n "%{$terminfo[bold]%}"
  echo -n "$1"
  echo -n "%(#,%{${fg[red]}%}#,%{${fg[cyan]}%}$)"
  echo -n "$2"
  echo -n "%{$reset_color%}"
}
function theme_prompt_exit_code {
  echo -n "%(?,,%{$fg[red]%})"
  echo -n "%(?,,$1)"
  echo -n "%(?,,\u2716)"
  echo -n "%(?,,%?)"
  echo -n "%(?,,$2)"
  echo -n "%(?,,%{$reset_color%})"
}

function theme_prompt_special {
  local command_params=($(echo $command | tr "." " "))
  local command_name=${command_params[1]}
  local command_prefix=\${${command_params[2]:-'_null'}}
  local command_suffix=\${${command_params[3]:-'_null'}}
  theme_prompt_value "$command_name" "$command_prefix" "$command_suffix"
}

function theme_prompt_value {
  # echo $1
  if [[ "$1" == "none" ]]; then
    # none
  elif [[ "$1" == "newline" ]]; then
    echo -n '$_newline'
  elif [[ "$1" == "tab" ]]; then
    echo -n '$_tab'
  elif [[ "$1" == "space" ]]; then
    echo -n '$_space'
  elif [[ "$1" == "lineup" ]]; then
    echo -n '$_lineup'
  elif [[ "$1" == "linedown" ]]; then
    echo -n '$_linedown'
  elif [[ "$1" == "clock" ]]; then
    echo -n '$(theme_prompt_clock '$2' '$3')'
  elif [[ "$1" == "context" ]]; then
    echo -n '$(theme_prompt_context '$2' '$3')'
  elif [[ "$1" == "path" ]]; then
    echo -n '$(theme_prompt_path '$2' '$3')'
  elif [[ "$1" == "welcome_sign" ]]; then
    echo -n '$(theme_prompt_welcome_sign '$2' '$3')'
  elif [[ "$1" == "git" ]]; then
    echo -n '$(theme_prompt_git '$2' '$3')'
  elif [[ "$1" == "exit_code" ]]; then
    echo -n '$(theme_prompt_exit_code '$2' '$3')'
  else
    echo -n '[undefined:'$1']'
    # local command_name=theme_prompt_$1
    # echo -n $($command_name)
  fi
}
