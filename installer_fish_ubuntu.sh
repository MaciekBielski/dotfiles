#!/usr/bin/bash

declare -r SCRIPT_DIR=$(readlink -f $(dirname -- "${BASH_SOURCE[0]}"))

sudo apt update
sudo apt -y install git tmux vifm cscope xclip ripgrep neovim curl

pushd "$SCRIPT_DIR"
install -m 0644 -T ./tmux.conf ~/.tmux.conf
install -m 0644 -T -D ./vifmrc ~/.config/vifm/vifmrc
install -m 0644 -T -D ./vifm_wrapper.sh ~/.config/vifm/vifm_wrapper.sh
install -m 0644 -T -D ./Default.vifm ~/.config/vifm/colors/Default.vifm

sh -c "curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
install -m 0644 -T ./init.vim ~/.config/nvim/init.vim
install -m 0644 -T ./functions.vim ~/.config/nvim/functions.vim
install -m 0644 -T ./init_pager.vim ~/.config/nvim/init_pager.vim

install -m 0644 -T ./autocmds.lua ~/.config/nvim/lua/autocmds.lua
install -m 0644 -T ./keymap.lua ~/.config/nvim/lua/keymap.lua
install -m 0644 -T ./opts.lua ~/.config/nvim/lua/opts.lua
nvim -c 'PlugInstall' -c 'qall'

install -m 0644 -T -D ./config.fish ~/.config/fish/config.fish
install -m 0644 -T -D ./fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish

install -m 0644 -T -D ./gitconfig_inc ~/.gitconfig_inc


popd

