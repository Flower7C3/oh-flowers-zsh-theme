
local _newline=$'\n'
local _space=$'\ '
local _null=$''
local _tab=$'\t'
local _lineup='%{'$'\e[1A''%}'
local _linedown='%{'$'\e[1B''%}'

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
  echo -n "$OS_ICON "
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
  echo -n "%{%(#,$fg[red],$fg[cyan])%}"
  echo -n "%(#,#,$)"
  echo -n "$2"
  echo -n "%{$reset_color%}"
}
function theme_prompt_exit_code {
  echo -n "%{%(?,,$fg[red])%}"
  echo -n "%(?,,$1)"
  echo -n "%(?,,\u2716)"
  echo -n "%(?,,%?)"
  echo -n "%(?,,$2)"
  echo -n "%{%(?,,$reset_color)%}"
}

function theme_prompt_special {
  local command_params=($(echo $command | tr "." " "))
  local command_name=${command_params[1]}
  local command_prefix=\${${command_params[2]:-'_null'}}
  local command_suffix=\${${command_params[3]:-'_null'}}
  if [[ "$command_name" == "none" ]]; then
    # none
  elif [[ "$command_name" == "newline" ]]; then
    echo -n '$_newline'
  elif [[ "$command_name" == "tab" ]]; then
    echo -n '$_tab'
  elif [[ "$command_name" == "space" ]]; then
    echo -n '$_space'
  elif [[ "$command_name" == "lineup" ]]; then
    echo -n '$_lineup'
  elif [[ "$command_name" == "linedown" ]]; then
    echo -n '$_linedown'
  elif [[ "$command_name" == "clock" ]]; then
    echo -n '$(theme_prompt_clock '$command_prefix' '$command_suffix')'
  elif [[ "$command_name" == "context" ]]; then
    echo -n '$(theme_prompt_context '$command_prefix' '$command_suffix')'
  elif [[ "$command_name" == "path" ]]; then
    echo -n '$(theme_prompt_path '$command_prefix' '$command_suffix')'
  elif [[ "$command_name" == "welcome_sign" ]]; then
    echo -n '$(theme_prompt_welcome_sign '$command_prefix' '$command_suffix')'
  elif [[ "$command_name" == "git" ]]; then
    echo -n '$(theme_prompt_git '$command_prefix' '$command_suffix')'
  elif [[ "$command_name" == "exit_code" ]]; then
    echo -n '$(theme_prompt_exit_code '$command_prefix' '$command_suffix')'
  else
    echo -n $command_prefix
    echo -n $command_name
    echo -n $command_suffix
  fi
}
