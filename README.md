# Installation for Oh-My-ZSH

## Install theme

To install this theme for use in [Oh-My-Zsh](https://github.com/robbyrussell/oh-my-zsh), clone this repository into your OMZ custom/themes directory.

    $ git clone https://github.com/Flower7C3/oh-my-zsh-theme ~/.oh-my-zsh/custom/themes/flower7c3

You then need to select this theme in your `~/.zshrc`:

    ZSH_THEME="flower7c3/flower7c3"
    
## Install Nerd-Fonts
   
The [Nerd-Fonts](https://github.com/ryanoasis/nerd-fonts) project is an effort to create fonts truly tricked out with as many glyphs as possible. After installing `nerd-fonts` and configuring your terminal emulator to use one, configure Powerlevel9k by putting the following in your `~/.zshrc`:
   
    ZSH_THEME_MODE="nerdfont-fontconfig"


## Customize

You can use with following sections in prompt line:
* welcome_sign - for user or sudo
* context - user at host
* path - current directory
* git - nice git status, with branch (or commit hash) and statuses
* clock - clock with seconds
* exit_code - last command exit code
* newline
* space

Just add in your `~/.zshrc` variable `ZSH_THEME_PROMPT_LEFT` or `ZSH_THEME_PROMPT_RIGHT`, eg:

    ZSH_THEME_PROMPT_LEFT=(
        newline
        context
        space
        path
        git
        exit_code
        newline
        welcome_sign
    )
  	ZSH_THEME_PROMPT_RIGHT=(
    	clock
	)
