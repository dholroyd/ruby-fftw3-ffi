ruby-fftw3-ffi
==============

A [Ruby-FFI](https://github.com/ffi/ffi) wrapper for [libfftw3](http://www.fftw.org/).

Wrapper bootstrapped using [ffi_gen](https://github.com/neelance/ffi_gen) (but with some hand-fixes of the output).

Usage
-----

See the [FFTW documentation](http://www.fftw.org/doc/index.html) for description of the underlying API.

    require 'fftw3/lib'
    
    block_size = ...
    signal = FFTW3::Lib.fftw_alloc_complex(block_size)
    # ... put 'double' values into signal buffer ...
    
    # 'signal' is used for input and output, so this plan performs in-place transforms,
    plan = FFTW3::Lib.fftw_plan_dft_1d(block_size, signal, signal, FFTW3::Lib::FORWARD,  FFTW3::Lib::ESTIMATE)
    
    FFTW3::Lib.fftw_execute(plan)
    
    # ... do something with the transformed data now in 'signal'
    
    # ... further executions of the plan ...
    
    # cleanup,
    FFTW3::Lib.fftw_free(signal)
    FFTW3::Lib.fftw_destroy_plan(plan)
