#ifndef RISCV_IO_H
#define RISCV_IO_H

void __attribute__((used)) start(){
    asm volatile (
        "call main\n"
    );
}

void print_char(char ch) {
    asm volatile (
        "li a7, 11\n"
        "mv a0, %0\n"
        "ecall"
        : : "r" (ch)
    );
}

void print_str(const char *str) {
    asm volatile (
        "li a7, 4\n"
        "mv a0, %0\n"
        "ecall"
        : : "r" (str)
    );
}

void read_str(char *buf, int len) {
    asm volatile (
        "li a7, 8\n"
        "mv a0, %0\n"
        "mv a1, %1\n"
        "ecall"
        : : "r" (buf), "r" (len)
    );
}

void print_int(int value) {
    asm volatile (
        "li a7, 1\n"
        "mv a0, %0\n"
        "ecall"
        : : "r" (value)
    );
}

int read_int() {
    int value;
    asm volatile (
        "li a7, 5\n"
        "ecall\n"
        "mv %0, a0"
        : "=r" (value)
    );
    return value;
}


double read_double() {
    double value;
    asm volatile (
        "li a7, 7\n"
        "ecall\n"
        "fmv.d %0, fa0"
        : "=f" (value)
    );
    return value;
}

void print_double(double value) {
    asm volatile (
        "li a7, 3\n"
        "fmv.d fa0, %0\n"
        "ecall"
        : : "f" (value)
    );
}

void exit_program() {
    asm volatile (
        "li a7, 10\n"
        "ecall"
    );
}

#endif