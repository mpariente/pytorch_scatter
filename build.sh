#!/bin/sh

TORCH=$(python -c "import os; import torch; print(os.path.dirname(torch.__file__))")
SRC_DIR=torch_scatter/kernel
BUILD_DIR=torch_scatter/build

rm -rf $BUILD_DIR
mkdir -p $BUILD_DIR
nvcc -c -o $BUILD_DIR/kernel.so $SRC_DIR/kernel.cu -Xcompiler -fPIC -shared -I$TORCH/lib/include/TH -I$TORCH/lib/include/THC -I$TORCH/lib/include -I$SRC_DIR