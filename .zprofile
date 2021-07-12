if [ -x /usr/libexec/path_helper ]; then
        PATH="" # <- ADD THIS LINE (right before path_helper call)
        eval `/usr/libexec/path_helper -s`
fi


export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles/bottles
