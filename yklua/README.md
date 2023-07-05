# YkLua benchmarks

[YkLua](https://github.com/ykjit/yklua)

## Benchmarks:

- [fannkuchredux](https://benchmarksgame-team.pages.debian.net/benchmarksgame/program/fannkuchredux-lua-1.html)

- [fasta](https://benchmarksgame-team.pages.debian.net/benchmarksgame/program/fasta-lua-2.html)

- [binary-trees](https://benchmarksgame-team.pages.debian.net/benchmarksgame/program/binarytrees-lua-2.html)

## Running 

```shell
$ YKD_SERIALISE_COMPILATION=1 /path/to/yklua/src/lua ./fannkuchredux.lua 3
$ YKD_SERIALISE_COMPILATION=1 /path/to/yklua/src/lua ./fasta.lua 10
$ YKD_SERIALISE_COMPILATION=1 /path/to/yklua/src/lua ./binary-trees.lua 
```
