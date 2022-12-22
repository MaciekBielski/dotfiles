#!/usr/bin/bash

function rmFile() {
    printf "$(tput setaf 1;)[!] Removing: $1$(tput sgr 0)\n\n"
    rm -f "$1"
}

declare -r SCRIPT_DIR=$(readlink -f $(dirname -- "${BASH_SOURCE[0]}"))

pushd "$SCRIPT_DIR"
rmFile '~/.tmux.conf'
rmFile '~/.config/vifm/vifmrc'
rmFile '~/.config/vifm/vifm_wrapper.sh'
rmFile '~/.config/vifm/colors/Default.vifm'

sed -i '/~\/.config\/vifm\/vifm_wrapper.sh/ d' ~/.zshrc

rmFile '~/.config/nvim/init.vim'
rmFile '~/.config/nvim/functions.vim'
rmFile '~/.config/nvim/lua/opts.lua'
rmFile '~/.config/nvim/lua/keymap.lua'
rmFile '~/.config/nvim/lua/autocmds.lua'
rmFile '~/.config/nvim/init_pager.vim'

rmFile '~/.config/nvim/after/syntax/markdown.vim'

rmFile '~/.config/env_vars.sh'
sed -i '/~\/.config\/env_vars.sh/ d' ~/.zshrc

rmFile '~/.config/aliases.sh'
sed -i '/~\/.config\/aliases.sh/ d' ~/.zshrc

rmFile '~/.gitconfig_inc'

# This has to be done before nvim plugins are removed
~/.config/nvim/autoload/fzf/uninstall

rmFile '~/.zshenv'

popd
