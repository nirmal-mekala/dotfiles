# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
[[ -f ~/.z-jump/z.sh ]] && . ~/.z-jump/z.sh
[[ -f ~/.zsh-fns ]] && source ~/.zsh-fns
[[ -f ~/.zsh-aliases ]] && source ~/.zsh-aliases
[[ -f ~/.localshrc ]] && source ~/.localshrc
[[ -f "$POWERLEVEL_THEME_LOCATION" ]] && source "$POWERLEVEL_THEME_LOCATION"

# check_command comes from zsh-fns
# fzf zsh completion requries version >= 0.48.0
check_command fzf && [[ $(printf '%s\n' $(fzf --version | awk '{print $1}') "0.48.0" | sort -V | head -n1)  == "0.48.0" ]] && source <(fzf --zsh)

autoload -Uz compinit && compinit # autocomplete
bindkey -r "^X" # give vim ctrl x
export EDITOR="nvim" # neovim default editor
setopt HIST_IGNORE_SPACE
stty -ixon # disable ctrl-s so vim can use it
