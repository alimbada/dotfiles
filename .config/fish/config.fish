set -gx EDITOR nvim

if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    set -x FZF_DEFAULT_OPTS '--height 30%  --layout reverse --border top'
    fzf --fish | source
    zoxide init --cmd cd fish | source
end

source ~/.config/fish/abbr.fish
abbr -a -- vim nvim
abbr -a -- vi nvim
