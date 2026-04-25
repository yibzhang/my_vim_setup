# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
# Source git-prompt.sh if available
if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
    source /usr/share/git-core/contrib/completion/git-prompt.sh
    # Optional: Show dirty state (modified files)
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
fi

_PS1_COLOR_RED='\[\e[01;31m\]'
_PS1_COLOR_GREEN='\[\e[01;32m\]'
_PS1_COLOR_BLUE='\[\e[01;34m\]'
_PS1_COLOR_WHITE='\[\e[00m\]'

_PS1_TIME_DATE="$_PS1_COLOR_WHITE[\t \d]"
_PS1_USER_AND_HOST="$_PS1_COLOR_GREEN[\u@\h]"
_PS1_WORK_DIR="$_PS1_COLOR_BLUE\w"
_PS1_GIT='$(__git_ps1 "(%s)")'

PS1="\
$_PS1_TIME_DATE\
$_PS1_USER_AND_HOST\
$_PS1_WORK_DIR\
$_PS1_COLOR_RED\
$_PS1_GIT\
$_PS1_COLOR_WHITE\
\$ "

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
