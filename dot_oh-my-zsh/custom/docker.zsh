COMPOSE_FILE=docker-compose-dev.yaml

DOCKER=$(which docker)

alias dc-up="$DOCKER compose --file ${COMPOSE_FILE} up --detach"
alias dc-down="$DOCKER compose --file ${COMPOSE_FILE} down --remove-orphans"
alias dc-logs="$DOCKER compose --file ${COMPOSE_FILE} logs --follow"
alias dc-prune-volumes="$DOCKER volume prune --force"
alias dc-prune-images="$DOCKER image prune --force"

alias dc-stop="dc-down && dc-prune-volumes"
alias dc-start="dc-up && dc-logs"
alias dc-restart="dc-stop && dc-start"

