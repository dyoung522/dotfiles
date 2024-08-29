COMPOSE_FILE=docker-compose-dev.yaml

alias dc-up="docker compose --file ${COMPOSE_FILE} up --detach"
alias dc-down="docker compose --file ${COMPOSE_FILE} down --remove-orphans"
alias dc-logs="docker compose --file ${COMPOSE_FILE} logs --follow"
alias dc-prune-volumes="docker volume prune --force"
alias dc-prune-images="docker image prune --force"
alias dc-old-prune="docker volume rm $(docker volume ls -qf dangling=true)"

alias dc-stop="dc-down && dc-prune-volumes"
alias dc-start="dc-up && dc-logs"
alias dc-restart="dc-stop && dc-start"

run-pa-docker() {
  ADDL_ARGS=""

  VERSION=$1
  [[ $# -gt 0 ]] && shift
  if [[ "$VERSION" == "v3" ]]; then
    alias -g pa-docker-bash="docker exec -it perfect-app-v3 bash"
  else
    alias -g pa-docker-bash="docker exec -it perfect-app bash"
  fi

  CMD=$1
  [[ $# -gt 0 ]] && shift

  case "$CMD" in
    bash)
      [[ -n "$@" ]] && ADDL_ARGS="-c"

      pa-docker-bash $ADDL_ARGS $@
      ;;
    be)
      pa-docker-bash -c "RACK_ENV=development RAILS_ENV=development bundle exec $@"
      ;;
    console)
      pa-docker-bash -c "RACK_ENV=development RAILS_ENV=development bundle exec rails console $@"
      ;;
    guard)
      pa-docker-bash -c "RACK_ENV=test RAILS_ENV=test bundle exec guard $@"
      ;;
    rspec)
      # [[ -n "$@" ]] && ADDL_ARGS="--format=documentation"
      # pa-docker-bash -c "RACK_ENV=test RAILS_ENV=test RUBYOPT=W0 bundle exec rspec $ADDL_ARGS $@"

      pa-docker-bash -c "RACK_ENV=test RAILS_ENV=test RUBYOPT=W0 bundle exec rspec $@"
      ;;
    attach|debug)
      APP="perfect-app"
      [[ "$VERSION" == "v3" ]] && APP="perfect-app-v3"
      echo "Attaching to ${APP}, use CTRL-P, CTRL-Q to exit"
      docker attach $APP
      ;;
    *)
      echo "$0 [bash|be|console|debug|guard|rspec]"
      ;;
  esac
}

pa-docker-v3() {
  run-pa-docker "v3" $@
}

pa-docker() {
  run-pa-docker "v2" $@
}
