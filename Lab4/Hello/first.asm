; Define a section of memory to store data
section .data
; Define a message to be displayed
message db "Hello World", 10

; Define a section of memory to store executable instructions 
section .text

; Mark this label as the starting point for the program 
global _start

_start:

; Set the value of register rax to 1, which corresponds to the write system call
mov rax, 1

; Set the value of register rdi to 1, which is the file descriptor for stdout
mov rdi, 1

; Set the value of register rsi to the memory address of the message
mov rsi, message

; Set the value of register rdx to the length of the message
mov rdx, 12

; Call the kernel with the values set in the registers
syscall
