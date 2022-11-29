#!/usr/bin/bash

function rmFile() {
    printf "$(tput setaf 1; tput setab 3)[!] Removing: $1$(tput sgr 0)\n\n"
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
rmFile '~/.config/nvim/init_pager.vim'

rmFile '~/.config/nvim/after/syntax/markdown.vim'

rmFile '~/.config/env_vars.sh'
sed -i '/~\/.config\/env_vars.sh/ d' ~/.zshrc

rmFile '~/.config/aliases.sh'
sed -i '/~\/.config\/aliases.sh/ d' ~/.zshrc

rmFile '~/.gitconfig_inc'

rmFile '~/.fzf.zsh'
sed -i '/~\/.fzf.zsh/ d' ~/.zshrc

rmFile '~/.zshenv'

popd
