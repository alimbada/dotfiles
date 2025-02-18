set -gx EDITOR nvim

if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
#    fzf --fish | source
    zoxide init --cmd cd fish | source
end

source ~/.config/fish/abbr.fish
