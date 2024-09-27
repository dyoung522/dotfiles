# Language vars
export LANG=en_US.UTF-8

# If you come from bash you might have to change your $PATH.
addToPathFront /usr/local/sbin
addToPathFront /usr/local/bin
addToPathFront $HOME/bin

# FZF setup
test -f ~/.fzf.zsh && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Console Ninja
test -d "~/.console-ninja" && addToPath ~/.console-ninja/.bin

# Zoxide
evalIfWhich "zoxide" zoxide init zsh

