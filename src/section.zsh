################################################################
# Section functions
################################################################
_theme_section() {
  local section_params=($(echo $command | tr "." " "))
  local section_name=${section_params[1]}
  local section_prefix=\${${section_params[2]:-'_null'}}
  local section_suffix=\${${section_params[3]:-'_null'}}
  if [[ "$section_name" == "none" ]]; then
    # none
  elif [[ "$section_name" == "newline" ]]; then
    echo -n '$_newline'
  elif [[ "$section_name" == "tab" ]]; then
    echo -n '$_tab'
  elif [[ "$section_name" == "space" ]]; then
    echo -n '$_space'
  elif [[ "$section_name" == "lineup" ]]; then
    echo -n '$_lineup'
  elif [[ "$section_name" == "linedown" ]]; then
    echo -n '$_linedown'
  elif [[ "$section_name" == "clock" ]]; then
    echo -n '$(_theme_section_clock '$section_prefix' '$section_suffix')'
  elif [[ "$section_name" == "calendar" ]]; then
    echo -n '$(_theme_section_calendar '$section_prefix' '$section_suffix')'
  elif [[ "$section_name" == "context" ]]; then
    echo -n '$(_theme_section_context '$section_prefix' '$section_suffix')'
  elif [[ "$section_name" == "path" ]]; then
    echo -n '$(_theme_section_path '$section_prefix' '$section_suffix')'
  elif [[ "$section_name" == "welcome_sign" ]]; then
    echo -n '$(_theme_section_welcome_sign '$section_prefix' '$section_suffix')'
  elif [[ "$section_name" == "git" ]]; then
    echo -n '$(_theme_section_git '$section_prefix' '$section_suffix')'
  elif [[ "$section_name" == "exit_code" ]]; then
    echo -n '$(_theme_section_exit_code '$section_prefix' '$section_suffix')'
  else
    echo -n $section_prefix
    echo -n $section_name
    echo -n $section_suffix
  fi
}

_theme_section_clock() {
  echo -n "%{$fg[white]%}"
  echo -n "$1"
  echo -n "$(print_icon 'TIME_ICON')"
  echo -n "%D{$ZSH_THEME_FLOWER7C3_TIME_FORMAT}"
  echo -n "$2"
  echo -n "%{$reset_color%}"
}

_theme_section_calendar() {
  echo -n "%{$fg[white]%}"
  echo -n "$1"
  echo -n "$(print_icon 'DATE_ICON')"
  echo -n "%D{$ZSH_THEME_FLOWER7C3_DATE_FORMAT}"
  echo -n "$2"
  echo -n "%{$reset_color%}"
}
_theme_section_context() {
  echo -n "%{$fg[green]%}"
  echo -n "$1"
  echo -n "$(print_icon 'OS_ICON') "
  echo -n "%n@%m"
  echo -n "$2"
  echo -n "%{$reset_color%}"
}
_theme_section_path() {
  typeset -AH dir_states
  dir_states=(
    "DEFAULT"         "FOLDER_ICON"
    "HOME"            "HOME_ICON"
    "HOME_SUBFOLDER"  "HOME_SUB_ICON"
    "NOT_WRITABLE"    "LOCK_ICON"
    "ETC"             "ETC_ICON"
  )
  local state_path="$(print -P '%~')"
  local state_icon="FOLDER_ICON"
  if [[ $state_path == '/etc'* ]]; then
    state_icon='FOLDER_ETC_ICON'
  elif [[ $state_path == '/root'* || $state_path == '/var/root'* ]]; then
    state_icon='FOLDER_ROOT_ICON'
  elif [[ $state_path == *'/.git'* ]]; then
    state_icon='FOLDER_GIT_ICON'
  elif [[ $state_path == *'/node_modules'* ]]; then
    state_icon='FOLDER_NPM_ICON'
  elif [[ $state_path == '~'* ]]; then
    state_icon="FOLDER_HOME_ICON"
  fi
  echo -n "%{$terminfo[bold]$fg[yellow]%}"
  echo -n "$1"
  echo -n "$(print_icon $state_icon) "
  echo -n "%~"
  echo -n "$2"
  echo -n "%{$reset_color%}"
}
_theme_section_welcome_sign() {
  echo -n "%{$terminfo[bold]%}"
  echo -n "$1"
  echo -n "%{%(#,$fg[red],$fg[cyan])%}"
  echo -n "%(#,$(print_icon 'ROOT_ICON'),$(print_icon 'DOLLAR_ICON'))"
  echo -n "$2"
  echo -n "%{$reset_color%}"
}
_theme_section_exit_code() {
  echo -n "%{%(?,,$fg[red])%}"
  echo -n "%(?,,$1)"
  echo -n "%(?,,$(print_icon 'FAIL_ICON'))"
  echo -n "%(?,,%?)"
  echo -n "%(?,,$2)"
  echo -n "%{%(?,,$reset_color)%}"
}
