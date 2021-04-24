;==========================================================================
; 
; This program changes the case of the letters to the opposite and does not affect any other characters.
; Input parameters: 
;     There is no any parameters
; Output parameters:
;     There is no any parameters
; Destroyed registers: 
;     rax, rsi, rcx    	 
;
;==========================================================================

section .text
global _start

;==========================================================================
_start:                
		call read                

		mov dl, 'a'
		sub dl, 'A'					; Found the difference between upper and lower case

		xor rcx, rcx				; Reset registrations to zero
		call replace

		call write                   
		call end                     

;==========================================================================
;Reading the buffer to the command line
read:
		mov rax, 0           		      
		mov rdi, 0                 	
		mov rsi, buff              	
		mov rdx, num_of_buf        	
		syscall  

		ret                        

;==========================================================================
;Changes the case of letters in the buffer
replace:
		mov al, byte [buff + rcx]  
	
		cmp al, 'a'
		jae toupper

		cmp al, 'A'
		jae tolower

		jmp next

tolower:
		cmp al, 'Z'
		ja next
		add al, dl 
		jmp next

toupper:
		cmp al, 'z'
		ja next
   		sub al, dl	
		jmp next

next:
        mov byte [buff + rcx], al  
        inc rcx                    

		cmp byte [buff + rcx + 1], 0
        jne replace                

        ret

;==========================================================================
;Printing the buffer to the command line
write:
		mov rax, 1                 
		mov rdi, 1                 
		mov rsi, buff              
		mov rdx, num_of_buf        
		syscall                    
		
		ret

;==========================================================================
; The end of the program
end:                           
		mov rax, 60                          
		xor rdi, rdi           
		syscall                    
		ret

;==========================================================================

section .data

num_of_buf equ 100

buff:  times num_of_buf db 0x0

;==========================================================================
