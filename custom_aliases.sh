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

