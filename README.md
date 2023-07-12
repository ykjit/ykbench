# ykbench

Benchmarks for yk-based projects

[Yk](https://github.com/ykjit/yk)


## Running benchmarks

Prerequisites:

- [hyperfine](https://github.com/sharkdp/hyperfine#installation)

```shell
$ ./yklua/bench.sh ./build/yklua/src/lua # benchmarks with yklua 
$ ./yklua/bench.sh /usr/bin/lua # benchmarks with lua
```