# _Zig on ESP32_

## Prerequisites

`gcc`, `cmake`, `ninja`, (maybe [`xtensa-esp32-elf-gcc`](https://docs.espressif.com/projects/esp-idf/en/v3.3.4/get-started/linux-setup.html#toolchain-setup) for its linker)

## Getting Started

*NOTE:* As install directory for both LLVM and Zig, you can use `~/.local`. Most shells have `~/.local` already in their `$PATH` which means after building & installing, you can directly use `zig`.

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
$ cmake -DCMAKE_PREFIX_PATH="<LLVM install directory>" -DCMAKE_INSTALL_PREFIX="<Zig install directory>" ..
$ make -j <# of preferred jobs>
$ make install
```

## How to build a project
Currently you can only build object files with the Xtensa LLVM project because [LLD doesn't support](https://github.com/espressif/llvm-project/issues/11) Xtensa as target (yet). Instead you can use the [`xtensa-esp32-elf-gcc`](https://docs.espressif.com/projects/esp-idf/en/v3.3.4/get-started/linux-setup.html#toolchain-setup) toolchain (to be more specific: `xtensa-esp32-elf-ld`) for linking.
```
$ zig build-obj -target xtensa-freestanding -mcpu <esp32,esp8266,esp32-s2> [other options] <your .zig file>
```
