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
abbr -a -g zi zypper in 
abbr -a -g zu zypper dup

set -g theme_powerline_fonts no

# opam configuration
source /home/alexispurslane/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/alexispurslane/miniconda3/bin/conda
    eval /home/alexispurslane/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/alexispurslane/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/alexispurslane/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/alexispurslane/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

