# Enable advanced autocompletion
autoload -Uz compinit
compinit

# Delete an entire word backward with Ctrl + Backspace
bindkey '^H' backward-kill-word

# Delete an entire word forward with Ctrl + Delete
bindkey '^[[3;5~' kill-word

# Command syntax highlighting (e.g., green if command exists, red if invalid)
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Gray auto-suggestions based on your history
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Initialize Starship prompt
eval "$(starship init zsh)"

# Enable zoxide
eval "$(zoxide init zsh)"

# Replace standard 'cat' with 'bat' for syntax highlighting
alias cat="bat"
# Fix SDKMAN looking for Debian's batcat
alias batcat="bat"

# Enable advanced FZF search bindings (Fedora standard path)
source /usr/share/fzf/shell/key-bindings.zsh

# Enable advanced FZF search in history and files
source /usr/share/fzf/shell/key-bindings.zsh

# --- HISTORY CONFIGURATION ---
HISTFILE=~/.zsh_history        # The file where commands are saved
HISTSIZE=10000                 # How many commands to keep in RAM
SAVEHIST=10000                 # How many commands to save to the hard drive

setopt APPEND_HISTORY          # Append commands to the end of the file
setopt SHARE_HISTORY           # Share history in real-time across different tabs/sessions
setopt INC_APPEND_HISTORY      # Save the command instantly
setopt HIST_IGNORE_ALL_DUPS    # Do not save duplicated commands
setopt HIST_REDUCE_BLANKS      # Remove unnecessary blank spaces before saving
