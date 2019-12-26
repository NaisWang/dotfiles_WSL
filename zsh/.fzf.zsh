# Setup fzf
# ---------
if [[ ! "$PATH" == */root/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/root/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/root/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/root/.fzf/shell/key-bindings.zsh"

export FZF_DEFAULT_OPTS='--layout=reverse --bind ctrl-e:down,ctrl-u:up --preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500"'

export FZF_COMPLETION_TRIGGER='\'
export FZF_TMUX_HEIGHT='80%'
export FZF_PREVIEW_COMMAND='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500'
export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build} --type f"
