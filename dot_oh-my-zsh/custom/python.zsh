export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
evalIfExist "pyenv", "pyenv init --path"

