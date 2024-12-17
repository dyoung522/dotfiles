which -s direnv >/dev/null 2>&1 || return

eval "$(direnv hook zsh)"

