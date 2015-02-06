if [ $UID = 0 ]; then
    export PS1='{\[\033[01;31m\]\u@`hostname`\[\033[00m\]}-> \[\033[01;33m\]\w\[\033[00m\] #'
else
    export PS1='{\[\033[01;32m\]\u@`hostname`\[\033[00m\]}-> \[\033[01;33m\]\w\[\033[00m\] $'
fi
