################################################################
# Utility functions
################################################################

local _newline=$'\n'
local _space=$'\u0020'
local _null=$''
local _tab=$'\t'
local _lineup='%{'$'\e[1A''%}'
local _linedown='%{'$'\e[1B''%}'

case $(uname) in
  Darwin)
    OS='OSX'
    OS_ICON='APPLE_ICON'
  ;;
  CYGWIN_NT-* | MSYS_NT-*)
    OS='Windows'
    OS_ICON='WINDOWS_ICON'
  ;;
  FreeBSD)
    OS='BSD'
    OS_ICON='FREEBSD_ICON'
  ;;
  OpenBSD)
    OS='BSD'
    OS_ICON='FREEBSD_ICON'
  ;;
  DragonFly)
    OS='BSD'
    OS_ICON='FREEBSD_ICON'
  ;;
  Linux)
    OS='Linux'
    if [ -f /etc/os-release ]; then
      [[ ${(f)"$((</etc/os-release) 2>/dev/null)"} =~ "ID=([A-Za-z]+)" ]] && os_release_id="${match[1]}"
    fi
    case "$os_release_id" in
      *arch*)
        OS_ICON='LINUX_ARCH_ICON'
      ;;
      *debian*)
        OS_ICON='LINUX_DEBIAN_ICON'
      ;;
      *ubuntu*)
        OS_ICON='LINUX_UBUNTU_ICON'
      ;;
      *elementary*)
        OS_ICON='LINUX_ELEMENTARY_ICON'
      ;;
      *fedora*)
        OS_ICON='LINUX_FEDORA_ICON'
      ;;
      *coreos*)
        OS_ICON='LINUX_COREOS_ICON'
      ;;
      *gentoo*)
        OS_ICON='LINUX_GENTOO_ICON'
      ;;
      *mageia*)
        OS_ICON='LINUX_MAGEIA_ICON'
      ;;
      *centos*)
        OS_ICON='LINUX_CENTOS_ICON'
      ;;
      *opensuse*|*tumbleweed*)
        OS_ICON='LINUX_OPENSUSE_ICON'
      ;;
      *sabayon*)
        OS_ICON='LINUX_SABAYON_ICON'
      ;;
      *slackware*)
        OS_ICON='LINUX_SLACKWARE_ICON'
      ;;
      *linuxmint*)
        OS_ICON='LINUX_MINT_ICON'
      ;;
      *alpine*)
        OS_ICON='LINUX_ALPINE_ICON'
      ;;
      *aosc*)
        OS_ICON='LINUX_AOSC_ICON'
      ;;
      *nixos*)
        OS_ICON='LINUX_NIXOS_ICON'
      ;;
      *devuan*)
        OS_ICON='LINUX_DEVUAN_ICON'
      ;;
      *manjaro*)
        OS_ICON='LINUX_MANJARO_ICON'
      ;;
      *)
        OS='Linux'
        OS_ICON='LINUX_ICON'
      ;;
    esac
    # Check if we're running on Android
    case $(uname -o 2>/dev/null) in
      Android)
        OS='Android'
        OS_ICON='ANDROID_ICON'
      ;;
    esac
  ;;
  SunOS)
    OS='Solaris'
    OS_ICON='SUNOS_ICON'
  ;;
  *)
    OS=''
    OS_ICON=''
  ;;
esac
