global  main
section .data

message: db "Liberté, égalité, fraternité!", 0x0A

section .text

_main:

main:
        mov rax, 1
        mov rdi, 1
        mov rsi, message    
        mov rdx, 33
        syscall

end:
        mov rax, 60
        xor rdi, rdi
        syscall
