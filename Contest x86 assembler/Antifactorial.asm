        mov ebx, eax 
        mov eax, 1
        mov ecx, 1

        cmp ebx, 1
        je end

    anti_factorial:
        mul ecx          
        inc ecx
        
        cmp ebx, eax
        jne anti_factorial

        dec ecx 
end:
        mov ebx, ecx
