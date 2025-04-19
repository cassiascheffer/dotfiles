export XDG_CONFIG_HOME="$HOME/.config"
# export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export EDITOR='nvim'

# Enable persistent REPL history for `node`.
export NODE_REPL_HISTORY=~/.node_history;
# Allow 32³ entries; the default is 1000.
export NODE_REPL_HISTORY_SIZE='32770';
# Use sloppy mode by default, matching web browsers.
export NODE_REPL_MODE='sloppy';

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';

# Increase Bash history size. Allow 32³ entries; the default is 500.
export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";
# History filepath
export HISTFILE="$ZDOTDIR/.zhistory"
# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

# Don't clear the screen after quitting a manual page.
export MANPAGER='bat';

# Avoid issues with `gpg` as installed via Homebrew.
# https://stackoverflow.com/a/42265848/96656
export GPG_TTY=$(tty)

# Colours
export TERM=xterm-256color

[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
fpath+=("/usr/local/share/zsh/site-functions")

# auto-complete and syntax
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-completions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


# help info on tab
plug "zap-zsh/supercharge"
plug "zap-zsh/vim"
plug "Aloxaf/fzf-tab"

# ls
plug "zap-zsh/exa"

# git
plug "chivalryq/git-alias"
plug "so-fancy/diff-so-fancy"

# functions
fpath=($HOME/dotfiles/zsh/functions $fpath)
autoload -Uz $fpath[1]/*(.:t)

source $ZDOTDIR/.zaliases

# Load and initialise completion system
autoload -Uz compinit
compinit

# prompt
eval "$(starship init zsh)"
