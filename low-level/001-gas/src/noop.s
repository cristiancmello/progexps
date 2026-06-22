.intel_syntax noprefix

.global _start

.section .text
_start:
    mov rax, 0x3c   # syscall: exit
    mov rdi, 0x0    # status: 0
    syscall
