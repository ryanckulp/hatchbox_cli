
function hb() {
  user="deploy"
  address="xxx.xxx.xxx.xxx" # REPLACE ME

  if [[ $# < 2 ]]; then
    echo "HatchBox CLI: Must provide an app slug and command, e.g hb <app> <command>"
    echo ""
    echo "Available commands:"
    echo "hb <app> console         Run rails console for <app>"
    echo "hb <app> logs            Read live logs for <app>"
    return
  fi

  app=${1}
  action=${2}

  if [[ ${action} == 'logs' ]]; then
    echo "tailing the ${app} logs..."
    action="journalctl --user --unit=${app}-server" # HatchBox v2.0
    # action="tail -f ~/${app}/current/log/production.log" # enable for HatchBox Classic
  elif [[ ${action} == 'console' ]]; then
    echo "opening the ${app} console..."
    action="cd ~/${app}/current && bundle exec rails console"
  fi

  ssh -t ${user}@${address} ${action}
}