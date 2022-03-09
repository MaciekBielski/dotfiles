
fm () {
    tmpfile=$(mktemp --suffix=_vifm)
    vifm --choose-dir=${tmpfile} "$(pwd)"
    cd "$(cat -A ${tmpfile} | tr ' ' '\ ')" && rm ${tmpfile}
}
