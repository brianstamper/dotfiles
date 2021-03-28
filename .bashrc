# Parts of the following ~/.bashrc file were taken from
#    http://tldp.org/LDP/abs/html/sample-bashrc.html

# Use Xmodmap to disable Caps Lock so xbindkeys can make it a mouse click
/usr/bin/xmodmap -e "keycode 66="

# If not running interactively, don't do anything
[ -z "$PS1" ] && return



# Normal Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

NC="\e[m"               # Color Reset


ALERT=${BWhite}${On_Red} # Bold White on red background


## Welcome messages

echo -en ${BGreen}
date
echo -en ${Green}
uname -a
echo -en ${BCyan}
w
if [ -x /usr/bin/acpi ]; then
    echo -e ${Yellow}
    acpi -V
fi
if [ -x /usr/games/fortune ]; then
    echo -e ${Purple}
    /usr/games/fortune -s
fi
echo -e ${NC}

##

ulimit -S -c 0      # Don't want coredumps.
set -o notify
set -o noclobber    # Override with a pipe, e.g., ls -1R >| filelist.txt
set -o ignoreeof


# Enable options:
shopt -s cdspell
shopt -s cdable_vars
shopt -s checkhash
shopt -s checkwinsize
shopt -s sourcepath
shopt -s no_empty_cmd_completion
shopt -s cmdhist
shopt -s histappend histreedit histverify
shopt -s extglob       # Necessary for programmable completion.

# Avoid git commit vimrc errors by forcing git to use vim instead of vi
git config --global core.editor vim

# LESS man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\E[01;36m'
export LESS_TERMCAP_md=$'\E[01;36m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Test connection type:
if [ -n "${SSH_CONNECTION}" ]; then
    CNX=${Green}        # Connected on remote machine, via ssh (good).
elif [[ "${DISPLAY%%:0*}" != "" ]]; then
    CNX=${ALERT}        # Connected on remote machine, not via ssh (bad).
else
    CNX=${BCyan}        # Connected on local machine.
fi

# Test user type:
if [[ ${USER} == "root" ]]; then
    SU=${Red}           # User is root.
elif [[ ${USER} != $(logname) ]]; then
    SU=${BRed}          # User is not login user.
else
    SU=${BCyan}         # User is normal (well ... most of us are).
fi



NCPU=$(grep -c 'processor' /proc/cpuinfo)    # Number of CPUs
SLOAD=$(( 100*${NCPU} ))        # Small load
MLOAD=$(( 200*${NCPU} ))        # Medium load
XLOAD=$(( 400*${NCPU} ))        # Xlarge load

# Returns system load
function load()
{
    local SYSLOAD=$(cut -d " " -f1 /proc/loadavg)
    # System load of the current host.
    echo ${SYSLOAD}
}

# Returns a color indicating system load.
function load_color()
{
    local SYSLOAD=$(cut -d " " -f1 /proc/loadavg | tr -d '.')
    if [ ${SYSLOAD} -gt ${XLOAD} ]; then
        echo -en ${ALERT}
    elif [ ${SYSLOAD} -gt ${MLOAD} ]; then
        echo -en ${Red}
    elif [ ${SYSLOAD} -gt ${SLOAD} ]; then
        echo -en ${BRed}
    else
        echo -en ${Green}
    fi
}

# Returns a color according to free disk space in $PWD.
function disk_color()
{
    if [ ! -w "${PWD}" ] ; then
        echo -en ${Red}
        # No 'write' privilege in the current directory.
    elif [ -s "${PWD}" ] ; then
        local used=$(command df -P "$PWD" |
                   awk 'END {print $5} {sub(/%/,"")}')
        if [ ${used} -gt 95 ]; then
            echo -en ${ALERT}           # Disk almost full (>95%).
        elif [ ${used} -gt 90 ]; then
            echo -en ${BRed}            # Free disk space almost gone.
        else
            echo -en ${Green}           # Free disk space is ok.
        fi
    else
        echo -en ${Cyan}
        # Current directory is size '0' (like /proc, /sys etc).
    fi
}

# Return number of suspended jobs
function jobs_s()
{
    echo $(jobs -s | wc -l)
}

# Return number of running jobs
function jobs_r()
{
    echo $(jobs -r | wc -l)
}

# Return prompt string with jobs info, returns nothing if jobs=0
function jobs_info()
{
    if [ $(jobs_r) -gt "0" ]; then
        echo -en ${Black}${On_Green}$(jobs_r)${NC}' '
    fi
    if [ $(jobs_s) -gt "0" ]; then
        echo -en ${Black}${On_Red}$(jobs_s)${NC}' '
    fi
}

# Returns a color according to running/suspended jobs.
function job_color()
{
    if [ $(jobs -s | wc -l) -gt "0" ]; then
        echo -en ${BRed}
    elif [ $(jobs -r | wc -l) -gt "0" ] ; then
        echo -en ${BCyan}
    fi
}

# Adds some text in the terminal frame (if applicable).


# Now we construct the prompt.
PROMPT_COMMAND="history -a"
PBC=${Green}  # Prompt base color
case ${TERM} in
  *term* | rxvt | linux)
        # Time of day:
        PS1="\[${PBC}\][\A "
        # Jobs info:
        PS1=${PS1}"\[\$(jobs_info)\]"
        # Load info:
        PS1=${PS1}"\[\$(load_color)\]\$(load)\[${NC}\]|"
        # User@Host (with connection type info):
        PS1=${PS1}"\[${SU}\]\u\[${NC}\]@\[${CNX}\]\h\[${PBC}\] "
        # PWD (with 'disk space' info):
        PS1=${PS1}"\[\$(disk_color)\]\W\\[${PBC}\]]\[${NC}\] "
        # Set title of current xterm:
        PS1=${PS1}"\[\e]0;[\u@\h] \w\a\]"
        ;;
    *)
        PS1="(\A \u@\h \W) " # --> PS1="(\A \u@\h \w) > "
                               # --> Shows full pathname of current dir.
        ;;
esac




# The following are often set in /etc/profile, but just in case they're not..
alias ll='ls -al --color=tty' 2>/dev/null
alias l.='ls -d .* --color=tty' 2>/dev/null
alias ls='ls --color=tty' 2>/dev/null
alias vi='vim'
alias pacman='pacman --color auto'
alias dmesg='dmesg -H --color'
alias sudo='sudo '

# Simplfy history searching, type partial command and press up/down arrow.
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
alias h='history 50'

export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTIGNORE="&:bg:fg:ll:h"
export HISTTIMEFORMAT="$(echo -e ${BCyan})[%F %T]$(echo -e ${NC}) "
export HOSTFILE=$HOME/.hosts    # Put a list of remote hosts in ~/.hosts

# Set vim as default editor
export VISUAL=/usr/bin/vim
export EDITOR=/usr/bin/vim

# ~/.bashrc-local allows for settings which are unique to specific machines and
# are not included in the github dotfiles repository. It should be called last 
# so that if necessary it may override definitions found in ~/.bashrc and other 
# earlier startup scripts. (Note that ~/.bash_profile gets called before
# ~/.bashrc).

if [ -f ~/.bashrc_local ]; then
    source ~/.bashrc_local
fi

