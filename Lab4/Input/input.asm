section .data
    text1 db "What is your name? "  ; define a string that will be printed to ask for the name
    text2 db "Hello, "              ; define a string that will be printed to greet the user
 
section .bss
    name resb 16                    ; reserve 16 bytes of memory for the name entered by the user
 
section .text
    global _start                  ; the entry point of the program
_start:
 
    call _printText1               ; call the function to print "What is your name? "
    call _getName                  ; call the function to get the name entered by the user
    call _printText2               ; call the function to print "Hello, "
    call _printName                ; call the function to print the name entered by the user
 
    mov rax, 60                    ; set the system call number for exit
    mov rdi, 0                     ; set the exit code to 0
    syscall                        ; call the exit system call
 
_getName:
    mov rax, 0                     ; set the system call number for read
    mov rdi, 0                     ; set the file descriptor to read from (stdin)
    mov rsi, name                  ; set the address where the input will be stored
    mov rdx, 16                    ; set the maximum number of bytes to read
    syscall                        ; call the read system call
    ret                            ; return from the function
 
_printText1:
    mov rax, 1                     ; set the system call number for write
    mov rdi, 1                     ; set the file descriptor to write to (stdout)
    mov rsi, text1                 ; set the address of the string to be printed
    mov rdx, 19                    ; set the number of bytes to print
    syscall                        ; call the write system call
    ret                            ; return from the function
 
_printText2:
    mov rax, 1                     ; set the system call number for write
    mov rdi, 1                     ; set the file descriptor to write to (stdout)
    mov rsi, text2                 ; set the address of the string to be printed
    mov rdx, 7                     ; set the number of bytes to print
    syscall                        ; call the write system call
    ret                            ; return from the function
 
_printName:
    mov rax, 1                     ; set the system call number for write
    mov rdi, 1                     ; set the file descriptor to write to (stdout)
    mov rsi, name                  ; set the address of the name entered by the user
    mov rdx, 16                    ; set the number of bytes to print
    syscall                        ; call the write system call
    ret                            ; return from the function

