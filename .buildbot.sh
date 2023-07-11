#! /bin/sh

set -eu

rm -fr ./build && mkdir ./build 
cd build

export CARGO_HOME="${PWD}/.cargo"
export RUSTUP_HOME="${PWD}/.rustup"

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rustup.sh
sh rustup.sh --default-host x86_64-unknown-linux-gnu \
    --default-toolchain nightly \
    --no-modify-path \
    --profile minimal \
    -y
export PATH=${CARGO_HOME}/bin/:$PATH

rustup toolchain install nightly --allow-downgrade

# yk bulid
git clone --depth=1 https://github.com/ykjit/yk
cd yk
git submodule update --init --recursive
cargo build
cd ..

# yklua bulid
git clone --depth=1 https://github.com/ykjit/yklua

export PATH=${PWD}/yk/bin:${PATH}
export YK_BUILD_TYPE=debug

cd yklua
make
cd ..

cd .. # move to project root directory

# yklua benchmark prob
./build/yklua/src/lua ./yklua/fasta.lua 
./build/yklua/src/lua ./yklua/fannkuchredux.lua 3
./build/yklua/src/lua ./yklua/fasta.lua 10
./build/yklua/src/lua ./yklua/binary-trees.lua
