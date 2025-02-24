if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    set -x FZF_DEFAULT_OPTS '--height 30%  --layout reverse --border top'
    zoxide init --cmd cd fish | source
end

source ~/.config/fish/abbr.fish
