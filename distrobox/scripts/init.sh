set -o xtrace

sudo pip install --break-system-packages tensorflow[and-cuda] spacy[cuda-12x] pyright
python3 -m spacy download en_core_web_trf

rustup toolchain install stable
rustup component add rust-analyzer

opam init
opam install ocamlbuild ocaml-lsp-server odoc merlin ocamlformat utop 

sudo npm install -g prettier eslint stylelint xmllint js-beautify

stat ~/dotfiles || git clone git@github.com:alexispurslane/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow emacs vim fish git
cd ..

git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install

git clone https://github.com/realnc/frobtads.git ~/frobtads
cd ~/frobtads
mkdir build
cd build
cmake .. 1>/dev/null
sudo cmake --build . --target install 1>/dev/null
cd ../..
rm -rf frobtads

mkdir -p ~/TADS/Extensions/
git clone https://github.com/EricEve/adv3lite ~/TADS/Extensions/adv3lite/

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
