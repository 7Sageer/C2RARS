	.file	"fib.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	start
	.type	start, @function
start:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
 #APP
# 5 "riscv_io.h" 1
	call main

# 0 "" 2
 #NO_APP
	nop
	lw	s0,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	start, .-start
	.align	1
	.globl	print_char
	.type	print_char, @function
print_char:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	mv	a5,a0
	sb	a5,-17(s0)
	lbu	a5,-17(s0)
 #APP
# 11 "riscv_io.h" 1
	li a7, 11
mv a0, a5
ecall
# 0 "" 2
 #NO_APP
	nop
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	print_char, .-print_char
	.align	1
	.globl	print_str
	.type	print_str, @function
print_str:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	lw	a5,-20(s0)
 #APP
# 20 "riscv_io.h" 1
	li a7, 4
mv a0, a5
ecall
# 0 "" 2
 #NO_APP
	nop
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	print_str, .-print_str
	.align	1
	.globl	read_str
	.type	read_str, @function
read_str:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lw	a5,-20(s0)
	lw	a4,-24(s0)
 #APP
# 29 "riscv_io.h" 1
	li a7, 8
mv a0, a5
mv a1, a4
ecall
# 0 "" 2
 #NO_APP
	nop
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	read_str, .-read_str
	.align	1
	.globl	print_int
	.type	print_int, @function
print_int:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	lw	a5,-20(s0)
 #APP
# 39 "riscv_io.h" 1
	li a7, 1
mv a0, a5
ecall
# 0 "" 2
 #NO_APP
	nop
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	print_int, .-print_int
	.align	1
	.globl	read_int
	.type	read_int, @function
read_int:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
 #APP
# 49 "riscv_io.h" 1
	li a7, 5
ecall
mv a5, a0
# 0 "" 2
 #NO_APP
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	read_int, .-read_int
	.align	1
	.globl	read_double
	.type	read_double, @function
read_double:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
 #APP
# 61 "riscv_io.h" 1
	li a7, 7
ecall
fmv.d fa5, fa0
# 0 "" 2
 #NO_APP
	fsd	fa5,-24(s0)
	fld	fa5,-24(s0)
	fmv.d	fa0,fa5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	read_double, .-read_double
	.align	1
	.globl	print_double
	.type	print_double, @function
print_double:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	fsd	fa0,-24(s0)
	fld	fa5,-24(s0)
 #APP
# 71 "riscv_io.h" 1
	li a7, 3
fmv.d fa0, fa5
ecall
# 0 "" 2
 #NO_APP
	nop
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	print_double, .-print_double
	.align	1
	.globl	exit_program
	.type	exit_program, @function
exit_program:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
 #APP
# 80 "riscv_io.h" 1
	li a7, 10
ecall
# 0 "" 2
 #NO_APP
	nop
	lw	s0,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	exit_program, .-exit_program
	.align	1
	.globl	f
	.type	f, @function
f:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	lw	a4,-20(s0)
	li	a5,1
	bne	a4,a5,.L13
	li	a5,1
	j	.L14
.L13:
	lw	a5,-20(s0)
	addi	a5,a5,-1
	mv	a0,a5
	call	f
	mv	a4,a0
	lw	a5,-20(s0)
	mul	a5,a4,a5
.L14:
	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	f, .-f
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	call	read_int
	sw	a0,-20(s0)
	lw	a0,-20(s0)
	call	f
	sw	a0,-24(s0)
	lw	a0,-24(s0)
	call	print_int
	call	exit_program
	li	a5,0
	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.ident	"GCC: (gc891d8dc23e) 13.2.0"
