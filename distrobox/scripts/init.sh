set -o xtrace

opam init
opam install ocamlbuild ocaml-lsp-server odoc merlin ocamlformat utop 

stat ~/dotfiles || git clone git@github.com:alexispurslane/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow emacs vim fish git
cd ..

git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install

mkdir -p ~/TADS/Extensions/
git clone https://github.com/EricEve/adv3lite ~/TADS/Extensions/adv3lite/

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
