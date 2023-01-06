
fm () {
    read -r parent < "/proc/$PPID/comm"
    if [[ ${parent} == 'vifm' ]]; then
        # Prevent vifm from being nested from its own terminal. Exit to parent
        # instead

        # echo 'parent is vifm'
        exit
    else
        # Launch vifm
        echo 'parent is NOT vifm'
        vifm "$@"
    fi
}
