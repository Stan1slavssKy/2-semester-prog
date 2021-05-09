;==========================================================================

section .text
global  _start

;==========================================================================

_start:
        call calc
        call exit

;==========================================================================

calc:  
        mov rdx, 1
        mov rbx, 1
        mov rcx, number - 1

calculation:

        add rdx, rbx    ; f(n) = f(n - 1) + 2f(n - 2)
        add rdx, rbx

        mov rax, rdx    ; swap(rbx, rdx)
        mov rdx, rbx
        mov rbx, rax

        loop calculation
        
        mov rdx, rbx
        ret
        
;==========================================================================

exit:
        mov rax, 60
        xor rdi, rdi
        syscall

        ret

;==========================================================================

section .data

number     equ 8
code_zero  equ 48 

;==========================================================================
