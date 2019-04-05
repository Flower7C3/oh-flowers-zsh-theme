

# Installation for Oh-My-ZSH

## Install theme

To install this theme for use in [Oh-My-Zsh](https://github.com/robbyrussell/oh-my-zsh), clone this repository into your OMZ custom/themes directory.

    $ git clone https://github.com/Flower7C3/oh-flowers-zsh-theme ~/.oh-my-zsh/custom/themes/flower7c3

You then need to select this theme in your `~/.zshrc`:

    ZSH_THEME="flower7c3/flower7c3"

## Install Nerd-Fonts
   
The [Nerd-Fonts](https://github.com/ryanoasis/nerd-fonts) project is an effort to create fonts truly tricked out with as many glyphs as possible.
After installing `nerd-fonts` configure your terminal emulator to use one.

## Update theme

To update installed theme just run `upgrade_oh_flowers_zsh_theme` command.


---
# Preview

<img src="https://github.com/Flower7C3/oh-flowers-zsh-theme/raw/master/screenshot.png" width=600/>



# Customize

## Prompt segments

Configure visible segments in your `~/.zshrc` by using following variables:
* `ZSH_THEME_FLOWER7C3_PROMPT_LEFT`
* `ZSH_THEME_FLOWER7C3_PROMPT_RIGHT`

You can use with following segments in prompt line:
* **welcome_sign** - displays sign *$* or *#* (if logged as root) 
* **context** - OS icon and user at host
* **path** - current directory icon (default, etc, root, git, node_modules, home) and directory path
* **git** - nice git status: icon, branch name (or commit hash) and changes (ahead, behind, staged, conflicts, changed, untracked, clean)
* **clock** - clock icon and time in given format
* **calendar** - calendar icon and date in given format
* **exit_code** - last command exit code
* **newline** - just newline character
* **space** - just space character
* **lineup** - useful when You use multilne left prompt and want to move cursor up in right prompt
* **linedown** - useful after moving cursor up

Each segment may have prefix and suffix (by default it is null). To add prefix and suffix just add them after dot in segment name:
* **_newline**
* **_space**
* **_null**
* **_tab**


## Date and time format

Configure format in your `~/.zshrc` by using following variables:
* `ZSH_THEME_FLOWER7C3_DATE_FORMAT`
* `ZSH_THEME_FLOWER7C3_TIME_FORMAT`

Variables take values from the `strftime` function. See man page strftime(3) for more details.


## GIT info

With **git** section You can see changes in GIT repository wrapped with parenthesis and separator.

Configure custom parenthesis and separator in your `~/.zshrc` by using following variables:
* `ZSH_THEME_FLOWER7C3_GIT_UPSTREAM_PREFIX`
* `ZSH_THEME_FLOWER7C3_GIT_UPSTREAM_SUFFIX`
* `ZSH_THEME_FLOWER7C3_GIT_CHANGES_PREFIX`
* `ZSH_THEME_FLOWER7C3_GIT_CHANGES_SEPARATOR`
* `ZSH_THEME_FLOWER7C3_GIT_CHANGES_SUFFIX`



## Icons

Configure custom icons in your `~/.zshrc`. Search given code with [Nerd-Fonts cheat-sheet](http://nerdfonts.com/#cheat-sheet) and specify valid variable.
Eg. `ZSH_THEME_FLOWER7C3_DOLLAR_SIGN='£'`.

See all availible icons with `get_icon_names` command.



## Default configuration

    ZSH_THEME_FLOWER7C3_PROMPT_LEFT=(
        exit_code
        path._newline
        git._space
        welcome_sign._newline._space
    )

    ZSH_THEME_FLOWER7C3_PROMPT_RIGHT=(
        lineup
        context
        clock._space
        linedown
    )
    
    ZSH_THEME_FLOWER7C3_DATE_FORMAT='%d.%m.%y'
    ZSH_THEME_FLOWER7C3_TIME_FORMAT='%K:%M:%S'

    ZSH_THEME_FLOWER7C3_GIT_UPSTREAM_PREFIX='['
    ZSH_THEME_FLOWER7C3_GIT_UPSTREAM_SUFFIX=']'
    ZSH_THEME_FLOWER7C3_GIT_CHANGES_PREFIX='('
    ZSH_THEME_FLOWER7C3_GIT_CHANGES_SEPARATOR='|'
    ZSH_THEME_FLOWER7C3_GIT_CHANGES_SUFFIX=')'



---
# Credits

* [zsh git status](https://github.com/olivierverdier/zsh-git-prompt) by olivierverdier
* [Oh-My-Zsh](https://github.com/robbyrussell/oh-my-zsh) by robbyrussell
* [Nerd-Fonts](https://github.com/ryanoasis/nerd-fonts) by ryanoasis



# License

[MIT](https://github.com/Flower7C3/oh-flowers-zsh-theme/blob/master/LICENSE)
