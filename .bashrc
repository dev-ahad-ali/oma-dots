# Omarchy environment
# OMARCHY_PATH + PATH, needed even for non-interactive shells
[[ -r /usr/share/omarchy/default/bash/env-bootstrap ]] &&
    source /usr/share/omarchy/default/bash/env-bootstrap

# If not running interactively, don't do anything else
[[ $- != *i* ]] && return

# Omarchy defaults
source "$OMARCHY_PATH/default/bash/rc"


# ============================================================
# Bash completion
# ============================================================

if [[ -r /usr/share/bash-completion/bash_completion ]]; then
    source /usr/share/bash-completion/bash_completion
fi


# ============================================================
# ble.sh
# ============================================================

if [[ -r /usr/share/blesh/ble.sh ]]; then
    source /usr/share/blesh/ble.sh
fi


# ============================================================
# History
# ============================================================

HISTSIZE=5000
HISTFILE=~/.bash_history
HISTFILESIZE=10000

shopt -s histappend
shopt -s cmdhist

HISTCONTROL=ignoreboth:erasedups


# ============================================================
# Bash completion behavior
# ============================================================

bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'

bind '"\C-h": backward-kill-word'

# ============================================================
# pnpm
# ============================================================

export PNPM_HOME='/home/dev-ahad-ali/.local/share/pnpm'

case ":$PATH:" in
    ":$PNPM_HOME/bin:"*) ;;
    *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac


# ============================================================
# Your custom aliases/functions
# ============================================================

# alias p='python'
# alias ll='ls -lah'

# pnpm
export PNPM_HOME='/home/dev-ahad-ali/.local/share/pnpm'
case ":$PATH:" in
  ":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end
