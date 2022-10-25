ZPLUGINDIR=$HOME/.zsh/plugins

# Simple function to load plugins. Copied from https://github.com/mattmc3/zsh_unplugged
function plugin-load {
  local repo plugdir initfile
  ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}
  for repo in $@; do
    plugdir=$ZPLUGINDIR/${repo:t}
    initfile=$plugdir/${repo:t}.plugin.zsh
    if [[ ! -d $plugdir ]]; then
      echo "Cloning $repo..."
      git clone -q --depth 1 --recursive --shallow-submodules https://github.com/$repo $plugdir
    fi
    if [[ ! -e $initfile ]]; then
      local -a initfiles=($plugdir/*.plugin.{z,}sh(N) $plugdir/*.{z,}sh{-theme,}(N))
      (( $#initfiles )) || { echo >&2 "No init file found '$repo'." && continue }
      ln -sf "${initfiles[1]}" "$initfile"
    fi
    fpath+=$plugdir
    (( $+functions[zsh-defer] )) && zsh-defer . $initfile || . $initfile
  done
}

plugins=(
    sindresorhus/pure # Pretty, minimal and fast ZSH prompt.
    zsh-users/zsh-autosuggestions # It suggests commands as you type based on history and completions.
    zsh-users/zsh-completions # Additional completion definitions for Zsh.
    zsh-users/zsh-syntax-highlighting # Syntax highlighting for the shell.
    Tarrasch/zsh-bd # Quickly go back to a specific parent directory.
)

plugin-load $plugins

bindkey '^ ' autosuggest-accept # zsh-autosuggestions: ctrl + space to accept the current suggestion

source ~/.zsh_aliases

# ZSH history config
setopt HIST_SAVE_NO_DUPS # Do not write a duplicate event to the history file.
setopt HIST_FIND_NO_DUPS # Do not find duplicate command when searching
setopt INC_APPEND_HISTORY # Commands are added immediately to the history, instead of at shell termination
setopt EXTENDED_HISTORY # History includes the timestamps when the commands where executed ($ history -E)

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

autoload -U compinit; compinit
