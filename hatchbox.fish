function hb
    set -l user "deploy"
    set -l address "XX.XXX.XXX.X" # REPLACE ME

    if [ (count $argv) -lt 2 ]
        echo "HatchBox CLI: Must provide an app slug and command, e.g hb <app> <command>"
        echo ""
        echo "Available commands:"
        echo "hb <app> console         Run rails console for <app>"
        echo "hb <app> logs            Read live logs for <app>"
        return
    end

    set -l app $argv[1]
    set -l action $argv[2]

    if [ "$action" = "logs" ]
        echo "tailing the $app logs..."
        set action "journalctl --user --unit=$app-server" # HatchBox v2.0
        # set action "tail -f ~/$app/current/log/production.log" # enable for HatchBox Classic
    else if [ "$action" = "console" ]
        echo "opening the $app console..."
        set action "cd ~/$app/current && bundle exec rails console"
    end

    ssh -t $user@$address $action
end
