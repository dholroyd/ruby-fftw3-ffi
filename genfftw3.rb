require "ffi/gen"

FFI::Gen.generate(
  module_name: "FFTW3::Lib",
  ffi_lib:     "fftw3",
  headers:     ["fftw3.h"],
  cflags:      `pkg-config --cflags fftw3`.split(" "),
  prefixes:    ["FFTW_"],
  output:      "lib/fftw3/lib.rb"
)

