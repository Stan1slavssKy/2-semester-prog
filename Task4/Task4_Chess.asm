global _start
section .text

;==========================================================================
; This program creates chess_buf-table 8x8 and saves it in the file (out = "out.txt")
;==========================================================================
_start:
                call fill_chess_buf

                call file_open
                mov [file_descr], rax

                call file_write
                call file_close
                
                call end
;==========================================================================


;==========================================================================
; Writes file-descriptor in rax
; Input parameters: 
;     file_name, flag
; Output parameters:
;     rax - the desciptor of file
; Destroyed registers: 
;     rdi, rsi
;==========================================================================
file_open:
                mov rax, 2				
                mov rdi, file_name		
                mov rsi, flag		
                syscall

                ret
;==========================================================================


;==========================================================================
; Writes the buffer (<chess_buf>) in file
; Input parameters: 
;     file_descr, chess_buf, chess_buf_size
; Output parameters:
;     No parameters
; Destroyed registers: 
;     rax, rdi, rsi, rdx
;==========================================================================
file_write:	
                mov rax, 1					
                mov rdi, [file_descr]					
                mov rsi, chess_buf				
                mov rdx, chess_buf_size					
                syscall		

                ret
;==========================================================================


;==========================================================================
; Creates the chess-field in the buffer
; Input parameters: 
;     chess_buf_size, chess_buf
; Output parameters:
;     No parameters
; Destroyed registers: 
;     rax, rcx, rdi, rsi, rdx, rbx, rdx
;==========================================================================
fill_chess_buf:
                mov rcx, chess_buf_size

chess_buf_loop:
; Get number (rax)
		xor rdx, rdx
                mov rax, chess_buf_size
                sub rax, rcx        ; push number of symbol in chess_buf
                add rax, 1          

; Checking for the new line
                mov rbx, 9
                div rbx

                cmp rdx, 0
                je next_line

; Get number (rax)
                xor rdx, rdx
                mov rax, chess_buf_size
                sub rax, rcx        ;push number of symbol in chess_buf
                add rax, 1         

; Get the parity of the number
                xor rdx, rdx
                mov rbx, 2
                div rbx

; If the number is white_cell cell
                cmp rdx, 0
                je white_cell

; If the number is not white_cell cell (dark)  
dark_cell:             
                xor rbx, rbx
                mov rdx, chess_buf_size
                sub rdx, rcx

                mov bl, [white_cell_square]
                mov [chess_buf + rdx], bl

                dec rcx
                test rcx, rcx
                jnz chess_buf_loop

; If the number is white_cell cell
white_cell:
                xor rbx, rbx
                mov rdx, chess_buf_size
                sub rdx, rcx

                mov bl, [black_cell_square]
                mov [chess_buf + rdx], bl

                dec rcx
                test rcx, rcx
                jnz chess_buf_loop

; If the line is ended up, so the next line is started off
next_line:
                xor rbx, rbx
                mov rdx, chess_buf_size
                sub rdx, rcx

                mov bl, [new_str]
                mov [chess_buf + rdx], bl

                dec rcx
                test rcx, rcx
                jnz chess_buf_loop

end_chess_loop:
                ret
;==========================================================================


;==========================================================================
; Close the file with descriptor <file_descr>
; Input parameters: 
;     No parameters
; Output parameters:
;     No parameters
; Destroyed registers: 
;     rax, rdi
;==========================================================================

file_close:

	mov rax, 3		
	mov rdi, [file_descr]
	syscall

	ret 
;==========================================================================


;==========================================================================
; End of the program. Everything is crushed. 	 
;==========================================================================
end:

	mov rax, 60					
	xor rdi, rdi					
	syscall

	ret 
;==========================================================================


;==========================================================================
; ALL PARAMETERS

chess_buf_size      equ 72   	; 64 + 8 for '\n'
flag                equ 66	    ; rw + create new file
;==========================================================================


;==========================================================================
; DATA SECTION
section .data

black_cell_square:  db '1'		; '#'  - symbol
white_cell_square:  db '0' 	    ; ' '  - empty symbol
new_str:            db 0xA		; '\n' - new string

string:             dq 1
column:             dq 1

chess_buf:          times chess_buf_size db 0

file_name:          db "out.txt", 0
size_file_name:     dq $ - file_name

file_descr:         dq 0
;==========================================================================
