#!/usr/bin/bash

function sourceFromBashRc() {
    local -r RED='\033[0;31m'
    local -r NC='\033[0m' # No Color

    printf "${RED}[!] Adding the following line to ~/.bashrc:${NC}\n\n"
    printf "[[ -f $1 ]] && source $1\n\n"

    echo "[[ -f $1 ]] && source $1" >> ~/.bashrc
}

declare -r SCRIPT_DIR=$(readlink -f $(dirname -- "${BASH_SOURCE[0]}"))

sudo apt update
sudo apt -y install git tmux vifm cscope fzf xclip ripgrep neovim curl

pushd "$SCRIPT_DIR"
install -m 0644 -T ./tmux.conf ~/.tmux.conf
install -m 0644 -T -D ./vifmrc ~/.config/vifm/vifmrc
install -m 0644 -T -D ./vifm_wrapper.sh ~/.config/vifm/vifm_wrapper.sh
install -m 0644 -T -D ./Default.vifm ~/.config/vifm/colors/Default.vifm

sourceFromBashRc '~/.config/vifm/vifm_wrapper.sh'

sh -c "curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
install -m 0644 -T ./init.vim ~/.config/nvim/init.vim

install -m 0644 -T -D ./markdown.vim ~/.config/nvim/after/syntax/markdown.vim
nvim -c 'PlugInstall' -c 'qall'

install -m 0644 -T -D ./env_vars.sh ~/.config/env_vars.sh
sourceFromBashRc '~/.config/env_vars.sh'

install -m 0644 -T -D ./aliases.sh ~/.config/aliases.sh
sourceFromBashRc '~/.config/aliases.sh'

install -m 0644 -T ./fzf.bash ~/.fzf.bash
sourceFromBashRc '~/.fzf.bash'

popd

