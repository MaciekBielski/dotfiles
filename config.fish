if status is-interactive
	alias la='ls -la -h --color'
	alias ls='ls -1F --color'
	alias ls='ls -1v --color'
	alias ll='ls -l -h --color'
	alias lt='ls -lct -h --color'
	alias lv='ls -1v --color'
	alias e='nvim'
	alias grep='grep --color'
	alias egrep='egrep --color'
	alias fgrep='fgrep --color'
	alias gdb='gdb -q'
	alias less='less -r'
	alias srcgrep='find . -type f -print0 | xargs -0 egrep -n --color'
	alias now="awk '/^now/ {print $3; exit}' /proc/timer_list"
	alias rngrep="grep -rn"

	set -g --export MANPATH /usr/share/man:/usr/local/man:$HOME/.local/share/man
	set -g --export EDITOR /usr/bin/nvim
	set -g --export PAGER "/usr/bin/less -r"
	set -g --export HISTSIZE 10000
	set -g --export SAVEHIST 10000
	set -g --export HISTCONTROL ignorespace
	set -g --export HOSTNAME "$(/bin/cat /etc/hostname)"
	set -g --export GCC_COLORS 'error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
	set -g --export PATH "$HOME/.local/bin:$HOME/bin:/usr/bin/X11:/usr/lib64/ccache:$PATH"

	set fish_greeting ""

end
