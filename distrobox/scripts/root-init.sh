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
