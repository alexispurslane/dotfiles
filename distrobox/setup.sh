set -o xtrace

cd ~

git clone https://github.com/KhronosGroup/glslang.git
cd glslang
./update_glslang_sources.py
mkdir -p build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$(pwd)/install" .. 1>/dev/null
make -j4 install
cd ../..
rm -rf glslang

git clone https://github.com/realnc/frobtads.git frobtads
cd frobtads
mkdir build
cd build
cmake .. 1>/dev/null
cmake --build . --target install 1>/dev/null
cd ../..
rm -rf frobtads

pip install --break-system-packages tensorflow[and-cuda] spacy[cuda-12x] pyright
zypper -n addrepo -p 100 http://developer.download.nvidia.com/compute/cuda/repos/opensuse15/x86_64/cuda-opensuse15.repo
zypper --gpg-auto-import-keys --non-interactive ref
zypper in -y cuda

rustup toolchain install stable
rustup component add rust-analyzer

opam init
opam install ocaml-lsp-server odoc ocamlformat utop 

npm install -g prettier
npm install -g eslint

stat ~/dotfiles || git clone git@github.com:alexispurslane/dotfiles.git ~/dotfiles
cd dotfiles
stow emacs vim fish git
cd ..

git clone --depth 1 https://github.com/doomeemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install

rm -rf frobtads
mkdir -p ~/TADS/Extensions/
git clone https://github.com/EricEve/adv3lite ~/TADS/Extensions/adv3lite/

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
