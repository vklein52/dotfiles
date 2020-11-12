alias father='echo $(curl -s -H \"Accept: text/plain\" https://icanhazdadjoke.com/)'
# alias em='emacsclient -c $@ -a ""'
function em () { emacsclient -c "$@" & }
alias config='/usr/bin/git --git-dir=/home/vklein52/.cfg/ --work-tree=/home/vklein52'
alias up241='~/uiuc/cs241/up.sh'
alias down241='~/uiuc/cs241/down.sh'
alias die='poweroff'
alias redie='reboot'
alias nvset='optirun -b none nvidia-settings -c :8'
alias bb='cat /proc/acpi/bbswitch'
alias bbs='optirun --status'
alias emnw='emacsclient'
function pacman-purge-orphans () { sudo pacman -Rns $(pacman -Qttdq); }
function help () {
    if [ -z "$1" ]
      then
        echo "Did not supply package name. Quitting."
        return -1
    fi
    NAME="$1"
    pygmentize -f terminal -l bash "$HOME/.help.d/$NAME.help"
    return 0
}
alias sudo='sudo '
alias diff='colordiff'
function course () {
    if [ -z "$1" ]
    then
        cd "$HOME/uiuc/"
    else
        grepres=$(ls "$HOME/uiuc/" | grep "$1")
        numwords=$(echo $grepres | wc -w)
        if [ $numwords -eq 0 ]
        then
            echo "Found no matches"
            return -1
        elif [ $numwords -eq 1 ]
        then
            cd "$HOME/uiuc/$grepres"
        else
            echo "Found multiple matches\n$grepres"
            return -1
        fi
    fi
    return 0
}

# function external-monitor-enable () {
    
# }
alias jn='jupyter notebook'
alias touch-date-file='touch $(date +%D | tr "/" "-")'
alias tdf='touch-date-file'
