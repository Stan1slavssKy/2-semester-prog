section .text
global _start

;==========================================================================

_start:
    mov dl, 'a'
    sub dl, 'A'                  
   
    call read                    
    call reg_xor                 
    call replace                  
    call write                   
    call end                     

;==========================================================================

; reads from the command line to the buffer
read:
    mov rax, 0                 
    mov rdi, 0                 
    mov rsi, buff              
    mov rdx, num_of_buf        
    syscall                    
    ret                        

;==========================================================================

; resets registers for future use
reg_xor:
    xor rcx, rcx               ; reset the counter
    xor rax, rax 
    ret

;==========================================================================

replace:
    mov al, byte [buff + rcx]  ; положили i ый элемет буфера

    cmp al, 141
    je  tolower
    jge toupper 

    next:
        mov byte [buff + rcx], al  
        inc rcx                    ; rcx++

        cmp rcx, num_of_buf        ; сравниваем rcx с 100
        jne replace                ; если не равно 100 то идем на метку Replace если равно то идем дальше по коду
        ret

;==========================================================================

;
tolower:
    add al, dl 
    jmp next

toupper:
    sub al, dl
    jmp next

;==========================================================================

write:
    mov rax, 1                 ; вывод
    mov rdi, 1                 ; stdout
    mov rsi, buff              ; указатель на буффер
    mov rdx, num_of_buf        ; количество символов
    syscall                    ; обращение к ядру
    ret

;==========================================================================

end:                           ; The end of the program
    mov rax, 60                ; выход           
    xor rdi, rdi           
    syscall                    ; обращение к ядру
    ret

;==========================================================================

section .data

num_of_buf equ 100

buff:  times num_of_buf db 0

;==========================================================================
