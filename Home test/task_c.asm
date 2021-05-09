section .text
global _start

;==========================================================================

_start:

        call read
        call read_decimal
        call end

;==========================================================================

read:
        mov rax, 0
        mov rdi, 0
        mov rsi, buffer
        mov rdx, num_of_buf
        syscall

        ret

;==========================================================================

read_decimal:
        
        xor rax, rax
        
        mov rcx, num_of_buf
fill:
        mov ebx, 10
        mul ebx

        mov rdx, num_of_buf
        sub rdx, rcx
        xor rbx, rbx
        mov bl, [buffer + rdx]
        
        sub bl, code_zero
        add rax, rbx
        loop fill
    
        ret

;==========================================================================

end:
        mov rax, 60
        xor rdi, rdi
        syscall

        ret

;==========================================================================

section .data

num_of_buf equ 4
code_zero  equ 48

buffer:  times num_of_buf db 0x0

;==========================================================================
