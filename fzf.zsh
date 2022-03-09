# Setup fzf - not needed if installed from .deb
# ---------
# if [[ ! "$PATH" == */opt/fzf/bin* ]]; then
#   export PATH="${PATH:+${PATH}:}/opt/fzf/bin"
# fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/share/doc/fzf/examples/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/usr/share/doc/fzf/examples/key-bindings.zsh"
