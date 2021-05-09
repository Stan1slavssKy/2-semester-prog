section .text
global  _start

;====================================================

_start:
        
        call fibonachi
        call end

;====================================================

fibonachi:
        
        mov rdx, 1
        mov rcx, number
L1:
        mov rax, number
        mul rdx
        mov rdx, rax
        
        dec rcx

        loop L1
    
;====================================================

end:
      
        mov rax, 60
        xor rdi, rdi
        syscall

        ret

;====================================================

section .data

number     equ 7
code_zero  equ 48

;==========================================================================
