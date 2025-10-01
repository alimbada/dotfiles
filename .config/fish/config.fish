set -gx EDITOR nvim
set -x HOMEBREW_CASK_OPTS "--appdir=~/Applications --fontdir=/Library/Fonts"

if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    set -x FZF_DEFAULT_OPTS '--height 15  --layout reverse --border top'
    fzf --fish | source
    zoxide init --cmd cd fish | source
    mise activate fish | source
else
    mise activate fish --shims | source
end

source ~/.config/fish/abbr.fish
abbr -a -- vim nvim
abbr -a -- vi nvim
