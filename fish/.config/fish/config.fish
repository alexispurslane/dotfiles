if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_vi_key_bindings
end

fish_add_path "$HOME/.cargo/bin"

abbr -a -g gco git commit -am
abbr -a -g gA git add . -A
abbr -a -g ga git add
abbr -a -g gp git push
abbr -a -g gP git push --force

set -g theme_powerline_fonts no
