# ZSH
export HISTFILE="$HOME/.zsh_history" # The file where the history is stored
export HISTSIZE=10000 # Number of events loaded into memory
export HISTTIMEFORMAT="[%F %T] " # Timestamp format for history
export SAVEHIST=10000 # Number of events stored in the zsh history file

# NVM
export NVM_DIR="$HOME/.nvm" # NVM dir path

# Android
export ANDROID_SDK_ROOT=$HOME/Library/Android/Sdk

# Path
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

export PURE_PROMPT_SYMBOL="»"
