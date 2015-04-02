if [ $UID = 0 ]; then
    export PS1='{\[\033[01;31m\]\u@`hostname`\[\033[00m\]}-> \[\033[01;33m\]\w\[\033[00m\] #'
    umask 022
    user_color='\033[0;31m'
else
    export PS1='{\[\033[01;32m\]\u@`hostname`\[\033[00m\]}-> \[\033[01;33m\]\w\[\033[00m\] $'
    umask 027
    user_color='\033[0;32m'
fi

export HISTCONTROL=ignoreboth

# If non interactive shell then end script
if ! [[ $- == *i* ]]; then
    return
fi

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

color_Off='\033[0m'             # Text Reset
color_Black='\033[0;30m'        # Black
color_Red='\033[0;31m'          # Red
color_Green='\033[0;32m'        # Green
color_Yellow='\033[0;33m'       # Yellow
color_Blue='\033[0;34m'         # Blue
color_Purple='\033[0;35m'       # Purple
color_Cyan='\033[0;36m'         # Cyan
color_White='\033[0;37m'        # White

echo -e "$color_Red
__        __   _                            _ 
\ \      / /__| | ___ ___  _ __ ___   ___  | |
 \ \ /\ / / _ \ |/ __/ _ \| '_ ' _ \ / _ \ | |
  \ V  V /  __/ | (_| (_) | | | | | |  __/ |_|
   \_/\_/ \___|_|\___\___/|_| |_| |_|\___| (_)

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

$color_Purple+------$color_Yellow System Data $color_Purple ---------------------------------------
$color_Purple|$color_White Hostname              $color_Purple = $color_Cyan `hostname`
$color_Purple|$color_White IP address/mask       $color_Purple = $color_Cyan `ip addr | grep 'state UP' -A2 | tail -1 | awk '{print $2}'`
$color_Purple|$color_White Kernel                $color_Purple = $color_Cyan `uname -r`
$color_Purple|$color_White Memory total          $color_Purple = $color_Cyan `cat /proc/meminfo | grep MemTotal | awk {'print $2'}` kB
$color_Purple|$color_White Memory free           $color_Purple = $color_Cyan `cat /proc/meminfo | grep MemFree | awk {'print $2'}` kB
$color_Purple|$color_White System uptime         $color_Purple = $color_Cyan `uptime | awk -F',' '{print $1}' | awk -F'up ' '{print $2}'`
$color_Purple|$color_White User                  $color_Purple = $user_color `whoami`
$color_Purple+-----------------------------------------------------------
$color_Off
"
