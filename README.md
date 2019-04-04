# Installation for Oh-My-ZSH

## Install theme

To install this theme for use in [Oh-My-Zsh](https://github.com/robbyrussell/oh-my-zsh), clone this repository into your OMZ custom/themes directory.

    $ git clone https://github.com/Flower7C3/oh-flowers-zsh-theme ~/.oh-my-zsh/custom/themes/flower7c3

You then need to select this theme in your `~/.zshrc`:

    ZSH_THEME="flower7c3/flower7c3"
    
## Install Nerd-Fonts
   
The [Nerd-Fonts](https://github.com/ryanoasis/nerd-fonts) project is an effort to create fonts truly tricked out with as many glyphs as possible. After installing `nerd-fonts` configure your terminal emulator to use one.


## Customize (optional)

You can use with following sections in prompt line:
* welcome_sign - for user or sudo
* context - user at host
* path - current directory
* git - nice git status, with branch (or commit hash) and statuses
* clock - time with seconds
* exit_code - last command exit code
* newline
* space

Each section may have prefix and suffix (by default it is null). To add prefix and suffix just add them after dot in section name:
* _newline
* _space
* _null
* _tab

Just add in your `~/.zshrc` variable `ZSH_THEME_FLOWER7C3_PROMPT_LEFT` or `ZSH_THEME_FLOWER7C3_PROMPT_RIGHT`, eg:

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



# Update

To update installed theme just run `upgrade_oh_flowers_zsh_theme` command.



# Preview

<img src="https://github.com/Flower7C3/oh-flowers-zsh-theme/raw/master/screenshot.png" width=600/>



# Credits

* [zsh git status](https://github.com/olivierverdier/zsh-git-prompt) by olivierverdier
* [Oh-My-Zsh](https://github.com/robbyrussell/oh-my-zsh) by robbyrussell
* [Nerd-Fonts](https://github.com/ryanoasis/nerd-fonts) by ryanoasis
