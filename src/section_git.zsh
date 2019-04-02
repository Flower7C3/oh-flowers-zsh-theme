################################################################
# git status
# based on https://github.com/olivierverdier/zsh-git-prompt
################################################################

# see documentation at http://linux.die.net/man/1/zshexpn
# A: finds the absolute path, even if this is symlinked
# h: equivalent to dirname
export __GIT_PROMPT_DIR=${0:A:h}

# Initialize colors.
autoload -U colors
colors

# Allow for functions in the prompt.
setopt PROMPT_SUBST

autoload -U add-zsh-hook

add-zsh-hook chpwd chpwd_update_git_vars
add-zsh-hook preexec preexec_update_git_vars
add-zsh-hook precmd precmd_update_git_vars

## Function definitions
preexec_update_git_vars() {
    case "$2" in
        git*|hub*|gh*|stg*)
        __EXECUTED_GIT_COMMAND=1
        ;;
    esac
}

precmd_update_git_vars() {
    if [ -n "$__EXECUTED_GIT_COMMAND" ] || [ ! -n "$ZSH_THEME_FLOWER7C3_GIT_PROMPT_CACHE" ]; then
        update_current_git_vars
        unset __EXECUTED_GIT_COMMAND
    fi
}

chpwd_update_git_vars() {
    update_current_git_vars
}

update_current_git_vars() {
    unset __CURRENT_GIT_STATUS

    local gitstatus="$__GIT_PROMPT_DIR/gitstatus.py"
    _GIT_STATUS=`python ${gitstatus} 2>/dev/null`
    __CURRENT_GIT_STATUS=("${(@s: :)_GIT_STATUS}")
    GIT_BRANCH=$__CURRENT_GIT_STATUS[1]
	GIT_AHEAD=$__CURRENT_GIT_STATUS[2]
	GIT_BEHIND=$__CURRENT_GIT_STATUS[3]
	GIT_STAGED=$__CURRENT_GIT_STATUS[4]
	GIT_CONFLICTS=$__CURRENT_GIT_STATUS[5]
	GIT_CHANGED=$__CURRENT_GIT_STATUS[6]
	GIT_UNTRACKED=$__CURRENT_GIT_STATUS[7]
}


_theme_section_git() {
	precmd_update_git_vars
	if [[ -n "$GIT_BRANCH" && "$GIT_BRANCH" != ':' ]]; then
		local STATUS=""
		if [[ "$GIT_BRANCH" == :* ]]; then
			STATUS="${STATUS}${ZSH_THEME_FLOWER7C3_GIT_PROMPT_COMMIT}${GIT_BRANCH/:/}%{${reset_color}%}"
		else
			STATUS="${STATUS}${ZSH_THEME_FLOWER7C3_GIT_PROMPT_BRANCH}${GIT_BRANCH}%{${reset_color}%}"
		fi

		local BEHIND=""
		if [ "$GIT_BEHIND" -ne "0" ]; then
			BEHIND="${ZSH_THEME_FLOWER7C3_GIT_PROMPT_BEHIND}${GIT_BEHIND}%{${reset_color}%}"
		fi
		local AHEAD=""
		if [ "$GIT_AHEAD" -ne "0" ]; then
			AHEAD="${ZSH_THEME_FLOWER7C3_GIT_PROMPT_AHEAD}${GIT_AHEAD}%{${reset_color}%}"
		fi
		if [[ -n "$BEHIND" || -n "$AHEAD" ]]; then
			STATUS="${STATUS}${ZSH_THEME_FLOWER7C3_GIT_UPSTREAM_PREFIX}${BEHIND}${AHEAD}${ZSH_THEME_FLOWER7C3_GIT_UPSTREAM_SUFFIX}"
		fi

		STATUS_CHANGES=""
		if [ "$GIT_CHANGED" -eq "0" ] && [ "$GIT_CONFLICTS" -eq "0" ] && [ "$GIT_STAGED" -eq "0" ] && [ "$GIT_UNTRACKED" -eq "0" ]; then
			STATUS_CHANGES="${ZSH_THEME_FLOWER7C3_GIT_PROMPT_CLEAN}%{${reset_color}%}"
		else
			if [ "$GIT_STAGED" -ne "0" ]; then
				if [[ -n "$STATUS_CHANGES" ]]; then
					STATUS_CHANGES="${STATUS_CHANGES}${ZSH_THEME_FLOWER7C3_GIT_CHANGES_SEPARATOR}"
				fi
				STATUS_CHANGES="${STATUS_CHANGES}${ZSH_THEME_FLOWER7C3_GIT_PROMPT_STAGED}${GIT_STAGED}%{${reset_color}%}"
			fi
			if [ "$GIT_CONFLICTS" -ne "0" ]; then
				if [[ -n "$STATUS_CHANGES" ]]; then
					STATUS_CHANGES="${STATUS_CHANGES}${ZSH_THEME_FLOWER7C3_GIT_CHANGES_SEPARATOR}"
				fi
				STATUS_CHANGES="${STATUS_CHANGES}${ZSH_THEME_FLOWER7C3_GIT_PROMPT_CONFLICTS}${GIT_CONFLICTS}%{${reset_color}%}"
			fi
			if [ "$GIT_CHANGED" -ne "0" ]; then
				if [[ -n "$STATUS_CHANGES" ]]; then
					STATUS_CHANGES="${STATUS_CHANGES}${ZSH_THEME_FLOWER7C3_GIT_CHANGES_SEPARATOR}"
				fi
				STATUS_CHANGES="${STATUS_CHANGES}${ZSH_THEME_FLOWER7C3_GIT_PROMPT_CHANGED}${GIT_CHANGED}%{${reset_color}%}"
			fi
			if [ "$GIT_UNTRACKED" -ne "0" ]; then
				if [[ -n "$STATUS_CHANGES" ]]; then
					STATUS_CHANGES="${STATUS_CHANGES}${ZSH_THEME_FLOWER7C3_GIT_CHANGES_SEPARATOR}"
				fi
				STATUS_CHANGES="${STATUS_CHANGES}${ZSH_THEME_FLOWER7C3_GIT_PROMPT_UNTRACKED}${GIT_UNTRACKED}%{${reset_color}%}"
			fi
		fi
		STATUS="${STATUS}${ZSH_THEME_FLOWER7C3_GIT_CHANGES_PREFIX}${STATUS_CHANGES}${ZSH_THEME_FLOWER7C3_GIT_CHANGES_SUFFIX}"
		echo -n "${1}${STATUS}${2}"
	fi
}

# Default values for the appearance of the prompt. Configure at will.
ZSH_THEME_FLOWER7C3_GIT_UPSTREAM_PREFIX="%{$fg[cyan]%}[%{${reset_color}%}"
ZSH_THEME_FLOWER7C3_GIT_UPSTREAM_SUFFIX="%{$fg[cyan]%}]%{${reset_color}%}"
ZSH_THEME_FLOWER7C3_GIT_CHANGES_PREFIX="%{$fg[cyan]%}(%G%{${reset_color}%}"
ZSH_THEME_FLOWER7C3_GIT_CHANGES_SEPARATOR="%{$fg[cyan]%}|%G%{${reset_color}%}"
ZSH_THEME_FLOWER7C3_GIT_CHANGES_SUFFIX="%{$fg[cyan]%})%G%{${reset_color}%}"
ZSH_THEME_FLOWER7C3_GIT_PROMPT_BRANCH="%{$fg_bold[cyan]%}$(print_icon 'VCS_BRANCH_ICON')"
ZSH_THEME_FLOWER7C3_GIT_PROMPT_COMMIT="%{$fg_bold[cyan]%}$(print_icon 'VCS_COMMIT_ICON')"
ZSH_THEME_FLOWER7C3_GIT_PROMPT_BEHIND="%{$fg[blue]%}$(print_icon 'VCS_INCOMING_CHANGES_ICON')"
ZSH_THEME_FLOWER7C3_GIT_PROMPT_AHEAD="%{$fg[blue]%}$(print_icon 'VCS_OUTGOING_CHANGES_ICON')"
ZSH_THEME_FLOWER7C3_GIT_PROMPT_STAGED="%{$fg[green]%}$(print_icon 'VCS_STAGED_ICON')"
ZSH_THEME_FLOWER7C3_GIT_PROMPT_CONFLICTS="%{$fg[magenta]%}$(print_icon 'VCS_CONFLICTS')"
ZSH_THEME_FLOWER7C3_GIT_PROMPT_CHANGED="%{$fg[red]%}$(print_icon 'VCS_UNSTAGED_ICON')"
ZSH_THEME_FLOWER7C3_GIT_PROMPT_UNTRACKED="$(print_icon 'VCS_UNTRACKED_ICON')"
ZSH_THEME_FLOWER7C3_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}$(print_icon 'VCS_CLEAN')"