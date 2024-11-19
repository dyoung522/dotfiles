COMPOSE_FILE=docker-compose-dev.yaml

DOCKER=$(which docker)

alias de="$DOCKER exec"
alias dc="$DOCKER compose"
alias dc-dev="dc --file ${COMPOSE_FILE}"

alias dcd="dc down --remove-orphans"
alias dcl="dc logs --follow"
alias dcr="dc run --rm"
alias dcs="dc stop"
alias dcu="dc up -d"
alias dcuf="dc up -d --force-recreate"

alias dc-prune-volumes="$DOCKER volume prune --force"
alias dc-prune-images="$DOCKER image prune --force"

alias dc-dev-up="dc-dev up --detach"
alias dc-dev-down="dc-dev down --remove-orphans"
alias dc-dev-logs="dc-dev logs --follow"

alias dc-dev-stop="dc-dev-down && dc-prune-volumes"
alias dc-dev-start="dc-dev-up && dc-dev-logs"
alias dc-dev-restart="dc-dev-stop && dc-dev-start"

