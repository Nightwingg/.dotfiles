# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

plugins=(git zsh-autosuggestions z)

source $ZSH/oh-my-zsh.sh
source ~/.dotfiles/zsh-z.plugin.zsh

# Activate FZF shortcuts
source /usr/share/fzf/completion.zsh && source /usr/share/fzf/key-bindings.zsh

alias v="nvim"
alias ls="lsd"
alias radian="~/.local/bin/radian"
alias ipython="~/.local/bin/ipython"
alias xclip="xclip -selection clipboard -i"
alias pdf="okular"
cpwd(){
  pwd=$(pwd)
  echo "cd" $pwd | xclip
}

# keys
bindkey '^ ' autosuggest-accept

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# Remove user from bash and title
export DEFAULT_USER="$(whoami)"
export ZSH_THEME_TERM_TITLE_IDLE="bash: %~"

colorscript random
