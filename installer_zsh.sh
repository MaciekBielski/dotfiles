#!/usr/bin/bash

# For testing:
# sudo apt install zsh
# sudo chsh -s /usr/bin/zsh <USER_NAME>
# sudo login -f <USER_NAME>

function sourceFirstFromSecond() {
    printf "$(tput setaf 1; tput setab 3)[!] Adding the following line to $2:$(tput sgr 0)\n\n"
    printf "[[ -f $1 ]] && source $1\n\n"

    echo "[[ -f $1 ]] && source $1" >> "$2"
}

declare -r SCRIPT_DIR=$(readlink -f $(dirname -- "${BASH_SOURCE[0]}"))

sudo apt update
sudo apt -y install git tmux vifm cscope fzf xclip ripgrep neovim curl
sudo apt -y install zsh-syntax-highlighting

pushd "$SCRIPT_DIR"
install -m 0644 -T ./tmux.conf ~/.tmux.conf
install -m 0644 -T -D ./vifmrc ~/.config/vifm/vifmrc
install -m 0644 -T -D ./vifm_wrapper.sh ~/.config/vifm/vifm_wrapper.sh
install -m 0644 -T -D ./Default.vifm ~/.config/vifm/colors/Default.vifm

sourceFirstFromSecond '~/.config/vifm/vifm_wrapper.sh' ~/.zshrc

sh -c "curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
install -m 0644 -T ./init.vim ~/.config/nvim/init.vim

install -m 0644 -T -D ./nvim_diff_wrapper.sh ~/.config/nvim/nvim_diff_wrapper.sh
sourceFirstFromSecond '~/.config/nvim/nvim_diff_wrapper.sh' ~/.zshrc

install -m 0644 -T -D ./markdown.vim ~/.config/nvim/after/syntax/markdown.vim
nvim -c 'PlugInstall' -c 'qall'

install -m 0644 -T -D ./env_vars.sh ~/.config/env_vars.sh
sourceFirstFromSecond '~/.config/env_vars.sh' ~/.zshrc

install -m 0644 -T -D ./aliases.sh ~/.config/aliases.sh
sourceFirstFromSecond '~/.config/aliases.sh' ~/.zshrc

install -m 0644 -T ./fzf.zsh ~/.fzf.zsh
sourceFirstFromSecond '~/.fzf.zsh' ~/.zshrc

install -m 0644 -T ./zshenv ~/.zshenv
sourceFirstFromSecond '/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' ~/.zshenv

popd
