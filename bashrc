# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# GAUSSIAN 16
    GAUSS_SCRDIR=/home/sasha/SCRDIR/gau
    g16root=/opt
    export GAUSS_SCRDIR g16root
    source $g16root/g16/bsd/g16.profile

# QCHEM
    . /opt/qchem/qcenv.sh

# INTEL COMPILERS 
    . /opt/intel/parallel_studio_xe_2020.2.108/bin/psxevars.sh
    
# MY ENV VARIABLES
    export CCOMP=icc
    export BINPATH=~/.bin
    export PATH=$PATH:/home/sasha/.bin
    export FCOMP=ifort
    export EDITOR='vi'
    export VISUAL='vi'
    export NODESCRATCH=~/SCRDIR # Slurm does not understand bash variables like
                                # ~ inside quotes.

# TERACHEM
    export TeraChem=/opt/TeraChem
    export NBOEXE=/opt/TeraChem/bin/nbo6.i4.exe
    export OMP_NUM_THREADS=32
    export LD_LIBRARY_PATH=/opt/TeraChem/lib:$LD_LIBRARY_PATH
    export PATH=/opt/TeraChem/bin:$PATH
    source /opt/TeraChem/SetTCVars.sh
    export PATH=$PATH:~/.local/bin

# Vim plugin lightline requirement
export TERM=xterm-256color

# NNN ENVIRONMENT VARIABLES

    if [ -f ~/.bash_nnn ]; then
        . ~/.bash_nnn
    fi

    export NNN_OPENER=xdg-open

# Fuzzy finder
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash
    export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
    export FZF_DEFAULT_OPTS=$( tr -d $'\n' <<< "
            --layout=reverse --border --info inline --no-mouse" ) 
    # Use ~~ as the trigger sequence instead of the default **
    export FZF_COMPLETION_TRIGGER='~~'

    # Options to fzf command
    export FZF_COMPLETION_OPTS='+c -x'

    # Use fd instead of the default find
    # command for listing path candidates.
    _fzf_compgen_path() {
      fd --hidden --follow --exclude ".git" . "$1"
    }

    # Use fd to generate the list for directory completion
    _fzf_compgen_dir() {
      fd --type d --hidden --follow --exclude ".git" . "$1"
    }
# Newton-X
export NX=/opt/NX

# SHARC
export SHARC=/opt/sharc/bin
