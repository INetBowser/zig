# _Zig on ESP32_

## Prerequisites

cmake, ninja

## Getting Started

### 1. Building LLVM toolchain

```
$ git clone https://github.com/espressif/llvm-project llvm-xtensa
$ cd llvm-xtensa
$ mkdir build; cd build
$ cmake -G "Ninja" -DCMAKE_INSTALL_PREFIX="<LLVM install directory>" -DCMAKE_BUILD_TYPE=Release -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD="Xtensa" -DLLVM_ENABLE_PROJECTS="clang;lld" ../llvm
$ cmake --build .
$ cmake --install .
```

### 2. Building Zig with Xtensa support
```
$ git clone https://github.com/INetBowser/zig-xtensa
$ cd zig-xtensa
$ mkdir build; cd build
$ cmake -DCMAKE_PREFIX_PATH="<LLVM install directory>" -DCMAKE_INSTALL_PREFIX="<Zig install directory>" -DZIG_FORCE_EXTERNAL_LLD=true ..
$ make -j <# of preferred jobs>
$ make install
```

## How to build a project
NOTE: Seems like the Xtensa LLVM backend is now capable to generate machine code.

Currently the LLVM backend isn't capable of compiling the generated machine code. So if you try to build your Zig project normally it will fail because the compiler won't be able to compile the code and panic.

In order to compile you need to add these flags to your  ``zig``:
```-fno-emit-bin -femit-asm```

This will generate a .S file, which you then need to compile with the Xtensa GCC compiler ```xtensa-esp32-elf-gcc```.

## About this project
Right now it is not entirely possible to compile a binary but I'm working on it.
