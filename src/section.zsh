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
  echo -n "%*"
  echo -n "$2"
  echo -n "%{$reset_color%}"
}
_theme_section_context() {
  echo -n "%{$fg[green]%}"
  echo -n "$1"
  echo -n "$OS_ICON "
  echo -n "%n@%m"
  echo -n "$2"
  echo -n "%{$reset_color%}"
}
_theme_section_path() {
  echo -n "%{$terminfo[bold]$fg[yellow]%}"
  echo -n "$1"
  echo -n "$(print_icon 'FOLDER_ICON') "
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
