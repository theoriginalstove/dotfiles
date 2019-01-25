# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias ll="ls -aF --group-directories-first"
alias c="clear"
source `which activate.sh`

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /home/steven/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

export TERM="screen-256color"
