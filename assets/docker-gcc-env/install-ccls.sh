#!/usr/bin/env bash

cd /var/tmp
git clone --depth=1 --recursive https://github.com/MaskRay/ccls
cd ccls
cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_PREFIX_PATH=/usr/lib/llvm-9 \
    -DLLVM_INCLUDE_DIR=/usr/lib/llvm-9/include \
    -DLLVM_BUILD_INCLUDE_DIR=/usr/include/llvm-9/
cmake --build Release --target install
