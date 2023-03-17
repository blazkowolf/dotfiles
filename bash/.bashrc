# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	source /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			source "$rc"
		fi
	done
fi

unset rc

set -o vi

eval "$(starship init bash)"
eval "$(rtx activate bash)"
source /home/blazkowolf/dev/alacritty/extra/completions/alacritty.bash
