# If you come from bash you might have to change your $PATH.
addToPathFront /usr/local/sbin
addToPathFront /usr/local/bin
addToPathFront $HOME/bin

# FZF setup
test -f ~/.fzf.zsh && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Console Ninja
test -d "~/.console-ninja" && addToPath ~/.console-ninja/.bin

which -s zoxide  2>&1 >/dev/null && eval "$(zoxide init --cmd cd zsh)"

