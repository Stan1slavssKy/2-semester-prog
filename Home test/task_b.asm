section .text
global _start

;==========================================================================

_start:
        call read
        call place_letter
        call write
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

place_letter:

        xor rax, rax
        xor rbx, rbx
        mov bl, [buffer]
        sub bl, code_zero
        add rax, rbx

        ret

;==========================================================================

end:
        mov rax, 60
        xor rdi, rdi
        syscall
        ret

;==========================================================================

section .data

num_of_buf equ 1
code_zero  equ 48

buffer:  times num_of_buf db 0x0

;==========================================================================
