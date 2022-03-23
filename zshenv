# If the user doesn't have a .inputrc, use the one in /etc.
if [ ! -r "$HOME/.inputrc" ]; then
  export INPUTRC=/etc/inputrc
fi

# Set TERM to linux for unknown type or unset variable:
if [ "$TERM" = "" -o "$TERM" = "unknown" ]; then
 TERM=linux
fi

# Set a default shell prompt:
if [ "$SHELL" = "/usr/bin/zsh" -o "$SHELL" = "/bin/zsh" ]; then
    export WORDCHARS="*?.[]~=&;!#$%^"
    bindkey -e
    bindkey -er keymap accept-line-and-down-history

    autoload -Uz compinit &&  compinit
    autoload -U colors && colors
    autoload -Uz prompt_special_chars && prompt_special_chars
    zstyle ':completion:*' menu select

    setopt extendedglob notify
    unsetopt appendhistory autocd beep
    setopt append_history
    setopt extended_history         # save timestamp of command and duration
    setopt inc_append_history       # Add comamnds as they are typed, dont wait until shell exit
    setopt hist_expire_dups_first   # when trimming history, lose oldest duplicates first
    setopt hist_ignore_dups         # Do not write events to history that are duplicates of previous events
    setopt hist_ignore_space        # remove command line from history list when first character on the line is a space
    setopt hist_find_no_dups        # When searching history dont display results already cycled through twice
    setopt hist_reduce_blanks       # Remove extra blanks from each command line being added to history
    setopt hist_verify          # dont execute, just expand history
    #setopt share_history       # imports new commands and appends typed commands to history
    # ===== Completion
    setopt always_to_end    # When completing from the middle of a word, move the cursor to the end of the word
    setopt menu_complete    # complete with the first match, tab and C-O to go through completion list
    setopt LIST_ROWS_FIRST
    #bindkey undefined-key accept-line-and-down-history
    bindkey '^I' menu-complete
    bindkey '^O' reverse-menu-complete
    # setopt auto_menu      # show completion menu on successive tab press. needs unsetop menu_complete to work
    setopt auto_name_dirs   # any parameter that is set to the absolute name of a directory immediately becomes a name for that directory
    setopt complete_in_word     # Allow completion from within a word/phrase

    # ===== Prompt
    #setopt prompt_subst    # Enable parameter expansion, command substitution, and arithmetic expansion in the prompt
    setopt transient_rprompt    # only show the rprompt on the current prompt

    sch1=$'\xe2\x94\x94' # |_
    sch2=$'\xe2\x94\x8c'
    # sch3=$'\u2344' # _|
    # sch4=$'\xe2\x96\x91' # sqare of dots

    # git prompt settings
    # zstyle ':vcs_info:*' formats "%F{6}(%b)%f"

    precmd(){
        # vcs_info
        if [ `id -u` -eq 0 ]; then
            PS1=$'\n'"%F{red}[You are a root!]"$'\n'"%F{red}%n@%m: %F{yellow}%~%b%F{white}"$'\n'"%f%b%(?.%F{green}$%f.%F{red}$%f) "
        else
            PS1=$'\n'"%F{red}%n@%m: %F{yellow}%~%b%F{white}"$'\n'"%f%b%(?.%F{green}$%f.%F{red}$%f) "
            # RPROMPT="%B${vcs_info_msg_0_}%b"
        fi
    }
fi
#prompt setting for bash
PS2='> '
export DISPLAY LESS TERM PS1 PS2

# Default umask.  A umask of 022 prevents new files from being created group
# and world writable.
umask 022

# Append any additional sh scripts found in /etc/profile.d/:
for profile_script in /etc/profile.d/*.sh ; do
  if [ -x $profile_script ]; then
    . $profile_script
  fi
done
unset profile_script
# invoke pkgfile once the command is not found
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets line)
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=green'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=green'
ZSH_HIGHLIGHT_STYLES[path]='none'
ZSH_HIGHLIGHT_STYLES[path_prefix]='none'

