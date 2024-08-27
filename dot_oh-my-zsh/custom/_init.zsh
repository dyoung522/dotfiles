# If you come from bash you might have to change your $PATH.
addToPathFront /usr/local/sbin
addToPathFront /usr/local/bin
addToPathFront $HOME/bin

# Go
export GOBIN=$HOME/bin

# rbenv setup
if which rbenv >/dev/null; then eval "$(rbenv init -)"; fi

# pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
addToPath $PYENV_ROOT/bin
if which pyenv >/dev/null; then eval "$(pyenv init --path)"; fi

# FZF setup
test -f ~/.fzf.zsh && source ~/.fzf.zsh

# NVM setup
export NVM_DIR="$HOME/.nvm"
test -s "/usr/local/opt/nvm/nvm.sh" && . "/usr/local/opt/nvm/nvm.sh"                                       # This loads nvm
test -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Console Ninja
test -d "~/.console-ninja" && addToPath ~/.console-ninja/.bin


# 1Password
if [ -f /mnt/c/Users/dyoung/AppData/Local/Microsoft/WinGet/Links/op.exe ]; then
	alias op=/mnt/c/Users/dyoung/AppData/Local/Microsoft/WinGet/Links/op.exe
fi

# zoxide init
which -s zoxide && eval "$(zoxide init --cmd cd zsh)"

