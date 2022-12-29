if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_vi_key_bindings
end
fish_add_path "$HOME/.cargo/bin"
fish_add_path "$HOME/.roswell/bin"
fish_add_path "/usr/local/cuda-11.7/bin/"
fish_add_path "$HOME/.emacs.d/bin"

set -e LD_LIBRARY_PATH
set -xp LD_LIBRARY_PATH "/usr/local/cuda-11.2/lib64"
set -xp LD_LIBRARY_PATH "/usr/local/cuda/lib64"

set -xp TF_ENABLE_ONEDNN_OPTS 0

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/alexispurslane/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

abbr -a -g gco git commit -am
abbr -a -g gA git add . -A
abbr -a -g ga git add
abbr -a -g gp git push
abbr -a -g gP git push --force

alias pluto="julia -e 'import Pluto; Pluto.run();'"

set -g theme_powerline_fonts no
