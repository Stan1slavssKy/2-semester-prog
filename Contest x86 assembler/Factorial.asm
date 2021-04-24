    mov ecx, 0
    mov cl, al
    mov eax, 1

    cmp ecx, 0
    je end

factorial:
    mul ecx
    dec ecx

    cmp ecx, 0
    jne factorial

end:
    mov edx, eax
