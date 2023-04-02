SYS_EXIT  equ 1             ; define a constant for exit system call
SYS_READ  equ 3             ; define a constant for read system call
SYS_WRITE equ 4             ; define a constant for write system call
STDIN     equ 0             ; define a constant for standard input file descriptor
STDOUT    equ 1             ; define a constant for standard output file descriptor
; this adder works only for number in sum > 9
segment .data 

   msg1 db "Enter a digit ", 0xA,0xD   ; initialize message 1 to prompt user to enter a digit
   len1 equ $- msg1                   ; determine the length of message 1

   msg2 db "Please enter a second digit", 0xA,0xD  ; initialize message 2 to prompt user to enter a second digit
   len2 equ $- msg2                              ; determine the length of message 2

   msg3 db "The sum is: "            ; initialize message 3 to display the sum
   len3 equ $- msg3                 ; determine the length of message 3

segment .bss

   num1 resb 2                      ; reserve 2 bytes in memory to store the first number entered by user
   num2 resb 2                      ; reserve 2 bytes in memory to store the second number entered by user
   res resb 1                       ; reserve 1 byte in memory to store the result

section	.text
   global _start                   ; define the entry point of the program as "_start" so that the linker knows where to start the program
	
_start:                            ; start of the program
   mov eax, SYS_WRITE              ; set the value of eax to SYS_WRITE (4) for writing to output
   mov ebx, STDOUT                 ; set the value of ebx to STDOUT (1) for standard output
   mov ecx, msg1                   ; set the value of ecx to the address of msg1 to write the message
   mov edx, len1                   ; set the value of edx to the length of msg1 to write the correct number of bytes
   int 0x80                        ; call the kernel to perform the system call

   mov eax, SYS_READ               ; set the value of eax to SYS_READ (3) for reading input
   mov ebx, STDIN                  ; set the value of ebx to STDIN (0) for standard input
   mov ecx, num1                   ; set the value of ecx to the address of num1 to read the input into
   mov edx, 2                      ; set the value of edx to 2, to read 2 bytes
   int 0x80                        ; call the kernel to perform the system call

   mov eax, SYS_WRITE              ; set the value of eax to SYS_WRITE (4) for writing to output
   mov ebx, STDOUT                 ; set the value of ebx to STDOUT (1) for standard output
   mov ecx, msg2                   ; set the value of ecx to the address of msg2 to write the message
   mov edx, len2                   ; set the value of edx to the length of msg2 to write the correct number of bytes
   int 0x80                        ; call the kernel to perform the system call

   mov eax, SYS_READ               ; set the value of eax to SYS_READ (3) for reading input
   mov ebx, STDIN                  ; set the value of ebx to STDIN (0) for standard input
   mov ecx, num2                   ; set the value of ecx to the address of num2 to read the input 
   mov edx, 2        ; Move the value 2 into the edx register
   int 0x80          ; Call kernel interrupt

   mov eax, SYS_WRITE ; Move the value of the SYS_WRITE constant into the eax register
   mov ebx, STDOUT    ; Move the value of the STDOUT constant into the ebx register
   mov ecx, msg3      ; Move the address of msg3 into the ecx register
   mov edx, len3      ; Move the value of len3 into the edx register
   int 0x80           ; Call kernel interrupt to print msg3

   mov eax, [num1]    ; Move the value at the memory address of num1 into the eax register
   sub eax, '0'       ; Subtract the value of the '0' character from eax to convert it from ASCII to decimal

   mov ebx, [num2]    ; Move the value at the memory address of num2 into the ebx register
   sub ebx, '0'       ; Subtract the value of the '0' character from ebx to convert it from ASCII to decimal

   add eax, ebx       ; Add the values in eax and ebx together
   add eax, '0'       ; Add the value of the '0' character to eax to convert it from decimal to ASCII

   mov [res], eax     ; Move the value in eax into the memory address of res

   mov eax, SYS_WRITE ; Move the value of the SYS_WRITE constant into the eax register
   mov ebx, STDOUT    ; Move the value of the STDOUT constant into the ebx register
   mov ecx, res       ; Move the address of res into the ecx register
   mov edx, 1         ; Move the value 1 into the edx register
   int 0x80           ; Call kernel interrupt to print the value of res

   mov eax, SYS_EXIT  ; Move the value of the SYS_EXIT constant into the eax register
   xor ebx, ebx       ; XOR the value of ebx with itself to set it to 0
   int 0x80           ; Call kernel interrupt to exit the program.

