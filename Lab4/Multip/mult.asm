section .text
   global _start    ; entry point for the linker to start execution from
	
_start:

   ; Load the value 3 into AL register and subtract the ASCII value of '0' to convert it into decimal number
   mov	al, '3'
   sub     al, '0'
	
   ; Load the value 3 into BL register and subtract the ASCII value of '0' to convert it into decimal number
   mov 	bl, '3'
   sub     bl, '0'
   
   ; Multiply contents of AL and BL and store the result in AX register
   mul 	bl

   ; Add the ASCII value of '0' to the contents of AL register to convert it into an ASCII value
   add	al, '0'
	
   ; Store the value in AL register into the memory location 'res'
   mov 	[res], al
   
   ; Prepare the parameters for the sys_write system call
   mov	ecx, msg	; message to write
   mov	edx, len	; message length
   mov	ebx, 1		; file descriptor (stdout)
   mov	eax, 4		; system call number (sys_write)
   int	0x80		; call kernel
	
   ; Prepare the parameters for the second sys_write system call to print the result stored in 'res'
   mov	ecx, res	; message to write
   mov	edx, 1		; message length
   mov	ebx, 1		; file descriptor (stdout)
   mov	eax, 4		; system call number (sys_write)
   int	0x80		; call kernel
	
   ; Prepare the parameters for the sys_exit system call to terminate the program
   mov	eax, 1		; system call number (sys_exit)
   int	0x80		; call kernel

section .data
msg db "The result is:", 0xA, 0xD	; message to write
len equ $- msg				; length of message

section .bss
res resb 1				; memory location to store result

