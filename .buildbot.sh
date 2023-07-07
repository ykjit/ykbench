#! /bin/sh

set -eu

rm -fr ./build && mkdir ./build 
cd build

export CARGO_HOME="${PWD}/.cargo"
export RUSTUP_HOME="${PWD}/.rustup"

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rustup.sh
sh rustup.sh --default-host x86_64-unknown-linux-gnu --default-toolchain stable -y --no-modify-path
export PATH="${PWD}/.cargo/bin/:$PATH"

# yk bulid
git clone git@github.com:ykjit/yk.git 
git submodule update --init --recursive
cd yk
cargo build
cd ..

# yklua bulid
git clone git@github.com:ykjit/yklua.git

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
