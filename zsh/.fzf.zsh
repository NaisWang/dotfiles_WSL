# Setup fzf
# ---------
if [[ ! "$PATH" == */root/.fzf/bin* ]]; then
  export PATH=/root/.fzf/bin:${PATH}
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/root/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/root/.fzf/shell/key-bindings.zsh"
