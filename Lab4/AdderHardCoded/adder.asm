section	.text          ; start of the text section
   global _start        ; declaration of the program entry point

_start:                 ; program entry point
   mov	eax,'3'        ; move '3' to the eax register
   sub     eax, '0'     ; subtract the ascii value of '0' to convert the character '3' to its decimal value
	
   mov 	ebx, '4'     ; move '4' to the ebx register
   sub     ebx, '0'     ; subtract the ascii value of '0' to convert the character '4' to its decimal value
   add 	eax, ebx     ; add the values in eax and ebx
   add	eax, '0'     ; add the ascii value of '0' to convert the sum back to its ascii representation
	
   mov 	[sum], eax   ; store the sum in the memory location 'sum'
   mov	ecx,msg	      ; move the address of the message to ecx register	
   mov	edx, len      ; move the length of the message to edx register
   mov	ebx,1	        ; move 1 to ebx register to represent stdout
   mov	eax,4	        ; move 4 to eax register to represent write syscall
   int	0x80	        ; execute the system call to write the message to stdout
	
   mov	ecx,sum       ; move the address of the sum to ecx register
   mov	edx, 1	      ; move 1 to edx register to represent the length of the sum
   mov	ebx,1	        ; move 1 to ebx register to represent stdout
   mov	eax,4	        ; move 4 to eax register to represent write syscall
   int	0x80	        ; execute the system call to write the sum to stdout
	
   mov	eax,1	        ; move 1 to eax register to represent exit syscall
   int	0x80	        ; execute the system call to exit
	
section .data          ; start of the data section
   msg db "The sum is:", 0xA,0xD  ; initialize the message string with a newline and a carriage return
   len equ $ - msg     ; calculate the length of the message
   segment .bss        ; start of the bss section
   sum resb 1          ; reserve 1 byte of memory for the sum variable

