if [ -x /usr/libexec/path_helper ]; then
        PATH="" # <- ADD THIS LINE (right before path_helper call)
        eval `/usr/libexec/path_helper -s`
fi

# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
