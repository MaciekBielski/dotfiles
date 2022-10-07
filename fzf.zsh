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
if [[ -f "/usr/share/doc/fzf/examples/key-bindings.zsh" ]]; then
    source "/usr/share/doc/fzf/examples/key-bindings.zsh"
elif [[ -f "/etc/zsh_completion.d/fzf-key-bindings" ]]; then
    source "/etc/zsh_completion.d/fzf-key-bindings"
fi
