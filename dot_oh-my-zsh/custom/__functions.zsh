addToPath() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$PATH:$1
    fi
}

addToPathFront() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}

die () {
    echo >&2 "$@"
    exit 1
}

function sourceIfExist() {
  test -f "$1" && source "$1"
}

function sourceIfWhich {
  cmd=$1; shift
  which -s "${cmd}" >/dev/null 2>&1 && source "${@}"
}

function evalIfWhich() {
  cmd=$1; shift
  which -s "${cmd}" >/dev/null 2>&1 && eval "$(${@})"
}

