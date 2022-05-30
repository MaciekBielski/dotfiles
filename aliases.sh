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

# interactive grep
# TESTING: od -vAn -tcx1
irg () {

    _get_fpath() { echo "${1:-''}" | cut -d':' -f1 }
    _get_linenb() {  echo "${1:-''}" | cut -d':' -f2 }

    RG_INC='-g"**/*.[chi]" -g"**/*.py" -g"**/*.py3" -g"**/*.hh" -g"**/*.cc" -g"**/*.cpp" -g"**/*.hpp" -g"**/*.bb" -g"**/*.bbappend" -g"**/*.sh" -g"**/*.txt" -g"**/*.md"'
    fname_ln=$( \
        RG_PREFIX="rg --with-filename -n --no-heading --no-messages --colors='path:fg:cyan' --color=ansi --smart-case ${RG_INC}"
        INITIAL_QUERY="${1:- }"
        FZF_DEFAULT_COMMAND="$RG_PREFIX ''" TERM='tmux-256color' \
            fzf --ansi --query "$INITIAL_QUERY" \
            --delimiter=':' \
            --preview="nvim -u $HOME/.config/nvim/init_pager.vim -c':e {1}' -c ':{2}' -c ':norm zz' -c ':redraw' " \
             --preview-window='up:75%' --sync) \
                 && _fpath=$(_get_fpath "${fname_ln}") \
                 && _line_nb=$(_get_linenb "${fname_ln}") \
                 && nvim ${_fpath} +${_line_nb} -c ':norm zz'
}
