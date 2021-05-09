;==========================================================================

section .text
global _start

;==========================================================================
_start:                
		call read                

		mov dl, '0'
		sub dl, '9'				

		xor rcx, rcx				
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
	
		cmp al, '0'
		jae L1

L1:
		cmp al, '9'
		jbe L2

next:
		mov byte [out_buff + rcx], al                                 

L2:
		inc rcx 
		cmp byte [buff + rcx + 1], 0
		jne replace    
		
		ret

;==========================================================================
;Printing the buffer to the command line
write:
		mov rax, 1                 
		mov rdi, 1                 
		mov rsi, out_buff              
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

buff:     times num_of_buf db 0x0
out_buff: times num_of_buf db 0x0

;==========================================================================
