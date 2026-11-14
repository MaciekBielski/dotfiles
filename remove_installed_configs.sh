#!/usr/bin/bash

function rmFile() {
    printf "$(tput setaf 1;)[!] Removing: $1$(tput sgr 0)\n\n"
    rm -f "$1"
}

declare -r SCRIPT_DIR=$(readlink -f $(dirname -- "${BASH_SOURCE[0]}"))

pushd "$SCRIPT_DIR"
rmFile ~/.tmux.conf
rmFile ~/.config/vifm/vifmrc
rmFile ~/.config/vifm/vifm_wrapper.sh
rmFile ~/.config/vifm/colors/Default.vifm

rmFile ~/.config/nvim/init.vim
rmFile ~/.config/nvim/functions.vim
rmFile ~/.config/nvim/init_pager.vim

rmFile ~/.config/nvim/lua/opts.lua
rmFile ~/.config/nvim/lua/keymap.lua
rmFile ~/.config/nvim/lua/autocmds.lua

rmFile ~/.gitconfig_inc

rmFile ~/.config/fish/config.fish
rmFile ~/.config/fish/functions/fish_prompt.fish

rmFile ~/.config/nvim/autoload/plug.vim

popd
