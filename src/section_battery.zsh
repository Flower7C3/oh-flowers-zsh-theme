################################################################
# battery status
################################################################

_theme_section_battery() {
  # The battery can have four different states - default to 'unknown'.
  local current_state='unknown'

  if [[ $OS =~ OSX && -f /usr/bin/pmset && -x /usr/bin/pmset ]]; then
    # obtain battery information from system
    local raw_data="$(pmset -g batt | awk 'FNR==2{print}')"
    # return if there is no battery on system
    [[ -z $(echo $raw_data | grep "InternalBattery") ]] && return

    # Time remaining on battery operation (charging/discharging)
    local tstring=$(echo $raw_data | awk -F ';' '{print $3}' | awk '{print $1}')
    # If time has not been calculated by system yet
    [[ $tstring =~ '(\(no|not)' ]] && tstring="\u2026"

    # percent of battery charged
    typeset -i 10 bat_percent
    bat_percent=$(echo $raw_data | grep -o '[0-9]*%' | sed 's/%//')

    local remain=""
    # Logic for string output
    case $(echo $raw_data | awk -F ';' '{print $2}' | awk '{$1=$1};1') in
      # for a short time after attaching power, status will be 'AC attached;'
      'charging'|'finishing charge'|'AC attached')
        current_state="charging"
        remain=" ($tstring)"
        ;;
      'discharging')
        current_state="disconnected"
        remain=" ($tstring)"
        ;;
      *)
        current_state="charged"
        ;;
    esac
  elif [[ $OS =~ Linux ]]; then
    local sysp="/sys/class/power_supply"
    # Reported BAT0 or BAT1 depending on kernel version
    [[ -a $sysp/BAT0 ]] && local bat=$sysp/BAT0
    [[ -a $sysp/BAT1 ]] && local bat=$sysp/BAT1

    # Return if no battery found
    [[ -z $bat ]] && return
    local capacity=$(cat $bat/capacity)
    local battery_status=$(cat $bat/status)
    [[ $capacity -gt 100 ]] && local bat_percent=100 || local bat_percent=$capacity
    [[ $battery_status =~ Charging || $battery_status =~ Full ]] && local connected=true
    if [[ -z  $connected ]]; then
      current_state="disconnected"
    else
      [[ $bat_percent =~ 100 ]] && current_state="charged"
      [[ $bat_percent -lt 100 ]] && current_state="charging"
    fi
    if [[ -f /usr/bin/acpi ]]; then
      local time_remaining=$(acpi | awk '{ print $5 }')
      if [[ $time_remaining =~ rate ]]; then
        local tstring="\u2026"
      elif [[ $time_remaining =~ "[[:digit:]]+" ]]; then
        local tstring=${(f)$(date -u -d "$(echo $time_remaining)" +%k:%M 2> /dev/null)}
      fi
    fi
    [[ -n $tstring ]] && local remain=" ($tstring)"
  else
    return ''
  fi

  if [[ "$current_state" == "charging" ]]; then
    color='blue'
    if [[ "$bat_percent" -ge 100 ]]; then
      icon=$(print_icon 'BATTERY_CHARGING_ICON')
    elif [[ "$bat_percent" -ge 90 ]]; then
      icon=$(print_icon 'BATTERY_CHARGING_90_ICON')
    elif [[ "$bat_percent" -ge 80 ]]; then
      icon=$(print_icon 'BATTERY_CHARGING_80_ICON')
    elif [[ "$bat_percent" -ge 70 ]]; then
      icon=$(print_icon 'BATTERY_CHARGING_70_ICON')
    elif [[ "$bat_percent" -ge 60 ]]; then
      icon=$(print_icon 'BATTERY_CHARGING_60_ICON')
    elif [[ "$bat_percent" -ge 50 ]]; then
      icon=$(print_icon 'BATTERY_CHARGING_50_ICON')
    elif [[ "$bat_percent" -ge 40 ]]; then
      icon=$(print_icon 'BATTERY_CHARGING_40_ICON')
    elif [[ "$bat_percent" -ge 30 ]]; then
      icon=$(print_icon 'BATTERY_CHARGING_30_ICON')
    elif [[ "$bat_percent" -ge 20 ]]; then
      icon=$(print_icon 'BATTERY_CHARGING_20_ICON')
    elif [[ "$bat_percent" -ge 10 ]]; then
      icon=$(print_icon 'BATTERY_CHARGING_10_ICON')
    else
      icon=$(print_icon 'BATTERY_CHARGING_ICON')
    fi
  elif [[ "$current_state" == "charged" ]]; then
    color='green'
    icon=$(print_icon 'BATTERY_CHARGING_ICON')
  else
    color='white'
    if [[ "$bat_percent" -ge 100 ]]; then
      icon=$(print_icon 'BATTERY_ICON')
    elif [[ "$bat_percent" -ge 90 ]]; then
      icon=$(print_icon 'BATTERY_90_ICON')
    elif [[ "$bat_percent" -ge 80 ]]; then
      icon=$(print_icon 'BATTERY_80_ICON')
    elif [[ "$bat_percent" -ge 70 ]]; then
      icon=$(print_icon 'BATTERY_70_ICON')
    elif [[ "$bat_percent" -ge 60 ]]; then
      icon=$(print_icon 'BATTERY_60_ICON')
    elif [[ "$bat_percent" -ge 50 ]]; then
      icon=$(print_icon 'BATTERY_50_ICON')
    elif [[ "$bat_percent" -ge 40 ]]; then
      icon=$(print_icon 'BATTERY_40_ICON')
    elif [[ "$bat_percent" -ge 30 ]]; then
      icon=$(print_icon 'BATTERY_30_ICON')
    elif [[ "$bat_percent" -ge 20 ]]; then
      icon=$(print_icon 'BATTERY_20_ICON')
    elif [[ "$bat_percent" -ge 10 ]]; then
      icon=$(print_icon 'BATTERY_10_ICON')
    else
      icon=$(print_icon 'BATTERY_OUTLINE_ICON')
    fi
    if [[ "$bat_percent" -lt "$ZSH_THEME_FLOWER7C3_BATTERY_LOW_THRESHOLD" ]]; then
      icon=$(print_icon 'BATTERY_ALERT_ICON')
      color='red'
    fi
  fi

  local message
  if [[ "$ZSH_THEME_FLOWER7C3_BATTERY_VERBOSE" == true ]]; then
    message="$bat_percent%%$remain"
  else
    message="$bat_percent%%"
  fi

  echo -n "%{$fg[$color]%}"
  echo -n "$1"
  echo -n "$icon"
  echo -n "$message"
  echo -n "$2"
  echo -n "%{$reset_color%}"
}
