require 'benchmark'
require 'ffi'

module Rust
  extend FFI::Library

  ffi_lib 'target/release/libfib.dylib'

  attach_function :fib, [:int], :int
end

def fib(n)
  if n <= 1
    n
  else
    fib(n - 2) + fib(n - 1)
  end
end

TARGET_NUM = 40
Benchmark.bm 10 do |rep|
  rep.report('Ruby') { fib(TARGET_NUM) }
  rep.report('Rust') { Rust.fib(TARGET_NUM) }
end
