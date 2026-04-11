# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
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

# Use better VIM mode
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# add fzf keybindings again after loading vi-mode plugin 
zvm_after_init() {
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
}

# Add dotnet tools to PATH
path+=('~/.dotnet/tools')

# Alias ssh for kitten
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

# Load prompt depending on theme
source .zsh_prompt


# Load Angular CLI autocompletion.
source <(ng completion script)
