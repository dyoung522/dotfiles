# fzf only supprts the `--zsh` flags in versions >= 0.48
if which -s fzf >/dev/null 2>&1; then
  if [ $(fzf --version | cut -d' ' -f1 | cut -d'.' -f2) -gt 48 ]; then
    eval "$(fzf --zsh)"
  else
    test -f /usr/share/doc/fzf/examples/key-bindings.zsh && source /usr/share/doc/fzf/examples/key-bindings.zsh
  fi
fi

test -f ~/.fzf.zsh && source ~/.fzf.zsh

