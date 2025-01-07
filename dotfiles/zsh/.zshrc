source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"

zplug "chrissicool/zsh-256color"
zplug "mafredri/zsh-async", from:github, use:"async.zsh"
zplug "sindresorhus/pure", from:github, use:"pure.zsh", as:theme

zplug "~/.zsh", from:local, use:"*.zsh"

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load
