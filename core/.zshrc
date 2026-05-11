HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt autocd              # change directory just by typing its name
setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt

# configure key keybindings
bindkey -e                                        # emacs key bindings
bindkey ' ' magic-space                           # do history expansion on space
bindkey '^U' backward-kill-line                   # ctrl + U
bindkey '^[[3;5~' kill-word                       # ctrl + Supr
bindkey '^H' backward-kill-word
bindkey '^[[3~' delete-char                       # delete
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[H' beginning-of-line                  # home
bindkey '^[[F' end-of-line                        # end
bindkey '^[[Z' undo                               # shift + tab undo last action
bindkey    "^[OH"    beginning-of-line
bindkey    "^[OF"    end-of-line

# The following lines were added by compinstall
zstyle :compinstall filename '/home/julian/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Display system information
if [[ $TERM == xterm-kitty ]]; then
	fastfetch --config $HOME/.config/fastfetch/config-compact.jsonc
fi

# yazi shortcut
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# Auto completion for dotnet
eval "$(dotnet completions script zsh)"

# Enable fzf
source <(fzf --zsh)

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh 2>/dev/null || source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan

# enable auto-suggestions based on the history
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Use better VIM mode
# source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# add fzf keybindings again after loading vi-mode plugin 
zvm_after_init() {
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
}

# Add dotnet tools to PATH
path+=('~/.dotnet/tools')

# Alias ssh for kitten
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

alias l="ls -lFh"
alias la="ls -lAFh"
alias lr="ls -tRFh"
alias lt="ls -ltFh"
alias ll="ls -l"
alias ff="find . -type f -name"

# Load prompt depending on theme
source ~/.zsh_prompt


# Load Angular CLI autocompletion.
source <(ng completion script)
