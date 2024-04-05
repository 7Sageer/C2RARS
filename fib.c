#include "riscv_io.h"

int f(int n) {
    if(n == 1)
    {
        return 1;
    }
    else
    {
        return n * f(n - 1);
    }
}

int main() {
    int a, b;
    
    a = read_int();
    b = f(a);
    print_int(b);
    exit_program();
}