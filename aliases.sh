alias la='ls -la -h --color'
alias ls='ls -1F --color'
alias ls='ls -1v --color'
alias ll='ls -l -h --color'
alias lt='ls -lct -h --color'
alias lv='ls -1v --color'
alias e='nvim'
alias grep='grep --color'
alias egrep='egrep --color'
alias fgrep='fgrep --color'
alias gdb='gdb -q'
alias less='less -r'
alias srcgrep='find . -type f -print0 | xargs -0 egrep -n --color'
alias now="awk '/^now/ {print $3; exit}' /proc/timer_list"
alias rngrep="grep -rn"

ndiff () {

    if [ $# -ne 2 ]; then
        echo "Bad arguments:"
        echo "ndiff <OTHER_ROOT> <LOCAL_FILEPATH>"
        return 127
    fi

    _rel_fp=$(echo $2 | sed 's#^[.][/]##')
    _other_root=$(echo $1 | sed 's#[/]$##')
    nvim -d ${_other_root}/${_rel_fp} $2
}

