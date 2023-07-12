#! /bin/sh

set -eu

lua=$1

if [ ! -f "${lua}" ]; then
    echo "Executable '$lua' not found" > /dev/stderr
    exit 1
fi

hyperfine --warmup 1 --runs 10 "${lua} ./yklua/fannkuchredux.lua 3"
hyperfine --warmup 1 --runs 10 "${lua} ./yklua/fasta.lua 10"
hyperfine --warmup 1 --runs 10 "${lua} ./yklua/binary-trees.lua"
