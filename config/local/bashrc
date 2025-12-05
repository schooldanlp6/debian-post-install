# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

RESET='\[\e[0m\]'
RED='\[\e[31m\]'
GREEN='\[\e[32m\]'
YELLOW='\[\e[33m\]'
BLUE='\[\e[34m\]'
CYAN='\[\e[36m\]'
MAGENTA='\[\e[35m\]'

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=6000000
HISTFILESIZE=60000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\] $PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

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

export PATH="~/AppImages/java21/bin/:$PATH"

JAVA_HOME=~/AppImages/java21/bin/java

export PATH="$HOME/flutter/bin:$PATH"
export PATH="$HOME/cmdline-tools/bin:$PATH"
export ANDROID_HOME=~/sdktools
export PATH=$PATH:$HOME/cmdline-tools:$HOME/platform-tools

# Add the directory of Tizen .NET Command Line Tools to user path.
export PATH=/home/danlp6/tizen-studio/tools/ide/bin:$PATH

# override PS1
# Show current git branch in PS1
parse_git_branch() {
    git branch --show-current 2>/dev/null
}
get_date() {
#    date +"%Y-%m-%d %H:%M:%S"
    date +"%A: %d.%m.%Y"
}

format_exit_code() {
    local code=$1
    if [[ $code -ne 0 ]]; then
        echo -e "\[\e[31m\]ERR:$code\[\e[0m\]"
    fi
}

format_uptime() {
    local up=$(cut -d. -f1 /proc/uptime)

    local days=$(( up/86400 ))
    local hours=$(( (up%86400)/3600 ))
    local mins=$(( (up%3600)/60 ))
    local secs=$(( up%60 ))

    if (( days > 0 )); then
        printf "%dd %02d:%02d:%02d" "$days" "$hours" "$mins" "$secs"
    else
        printf "%02d:%02d:%02d" "$hours" "$mins" "$secs"
    fi
}


PROMPT_COMMAND=__prompt_command

__prompt_command() {
    local exit_code=$?                # last command exit code
    local duration=""
    
    # Calculate duration (seconds.milliseconds)
    if [[ -n $LAST_CMD_START ]]; then
        local end=$(date +%s%3N)
        local diff=$((end - LAST_CMD_START))
        duration="$(printf "%d.%03ds" $((diff/1000)) $((diff%1000)))"
    fi
    
    # Save next prompt start time
    LAST_CMD_START=$(date +%s%3N)
}

#update_clock_titlebar() {
#    while true; do
#        printf "\033]0;%s\007" "$(date +'%Y-%m-%d %H:%M:%S')"
#        sleep 1
#    done
#}
# Run in background
#update_clock_titlebar &

#update_title_clock() {
#    while true; do
#        printf "\033]0;%s\007" "$(date +"%Y-%m-%d %H:%M:%S")"
#        sleep 1
#    done
#}
#update_title_clock &

#clock_loop() {
#    while true; do
#        tput sc                # save cursor
#       tput cup 0 $(($(tput cols)-8))   # top right corner
#        printf "%s" "$(date +%H:%M:%S)"
#        tput rc                # restore cursor
#        sleep 1
#    done
#}
#clock_loop &


# --- Live clock in top-right corner without clearing the screen ---
live_clock() {
    local prev_col prev_row

    # Function to draw clock
    draw_clock() {
        local cols=$(tput cols)
        local clock=$(date +%H:%M:%S)

        # Erase previous clock
        if [[ -n $prev_row && -n $prev_col ]]; then
            tput cup $prev_row $prev_col
            printf "%*s" ${#clock} " "  # overwrite with spaces
        fi

        # Move to top-right corner
        local col=$((cols - ${#clock}))
        tput cup 0 $col
        printf "%s" "$clock"

        prev_row=0
        prev_col=$col
    }

    # Handle resize by just redrawing
    trap 'draw_clock' WINCH

    while true; do
        draw_clock
        sleep 1
    done
}

#live_clock &

while true; do
    printf "\033]0;%s\007" "danlp6@danlp6-fw $: - $(date +%H:%M:%S)"
    sleep 1
done &


export PS1="\[\e[32m\]\[\e[1m\]\u@\h\[\e[37m\]: "'\[\e[1;36m\]$(format_uptime)\[\e[0m\]'"\[\e[1m\] - \[\e[33m\]\$(get_date)\[\e[0m\] \[\e[35m\]${duration} \[\e[32m\]\w\[\e[33m\] \$(parse_git_branch)\[\e[0m\] \$(format_exit_code $exit_code)\[\e[0m\]\n-> $: "
clear
