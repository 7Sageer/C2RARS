# C2RARS: A solution to solve the problem of C to RISC-V in RARS

**Warning** : The project is still in an early stage. But it is already possible to do the conversion of simple programs.

The project is of narrow use **unless** you are mad in debugging RISC-V assembly code in RARS.

## Usage

Firstly, you should install riscv64-unknown-elf-gcc. You can install it by the following command in Ubuntu:

``` bash
sudo apt-get install gcc-riscv64-unknown-elf
```

Or you prefer riscv32-unknown-elf-gcc, you can clone and compile it by the following command(although it could take 1-2 hours):

``` bash
git clone https://github.com/riscv/riscv-gnu-toolchain
cd riscv-gnu-toolchain
git submodule update --init --recursive
./configure --prefix=/opt/riscv --with-arch=rv32gc --with-abi=ilp32d
sudo make
```

If you are using Windows, you are highly recommended to use WSL.


Write your code in C, download and include `syscall.h` in your code. **Remember don't use std library in your code** such as `printf`, `scanf`, etc. Instead, you need to use the function in `syscall.h`. At the end of your C code, you should add `exit_program()` to make sure the program can exit correctly.

Up to now, you can use the following functions:

`read_int()`

`print_int(int value)`

`read_double()`

`print_double(double value)`

`read_str(char *buf, int len)`

`print_str(char* str)`

`exit_program()`

You can edit `syscall.h` to customize your own functions.

You can find a simple example in `fib.c`, which can calculate the Fibonacci number.

Then you can compile your code by the following command:

``` bash
risv32-unknown-elf-gcc -S fib.c
```
Check the generated `fib.s` file, which contains the RISC-V assembly code that could directly run in RARS. Wow!

## How it works

The toolchain is based on the `riscv32-unknown-elf-gcc`. It will compile the C code into RISC-V assembly code. The generated assembly code couldn't run in RARS directly. So some modifications need to be done to make it run in RARS.

Since RARS is not supporting the std library, so I replace the function in the std library with the function in `syscall.h` by inline assembly of `ecall`.

RARS won't call the `main` function by default. So I add a `start` function to call the `main` function in the C code.