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

function evalIfWhich() {
  which -s "$1" >/dev/null 2>&1 && eval "$(${2})"
}

