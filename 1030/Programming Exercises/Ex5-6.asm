INCLUDE Irvine32.inc

.data
buffer BYTE 21 DUP(0)
.code
E PROC
    push ecx
    push ebx
    mov ecx, 20
L1:
    mov eax, 26
    mov ebx, 0
    call RandomRange
    add al, 'A'
    mov [edi], al
    inc edi
    loop L1
    mov byte ptr [edi], 0
    pop ebx
    pop ecx
    ret
E ENDP
main PROC
    mov edi, OFFSET buffer
    call E
    mov edx, OFFSET buffer
    call WriteString
    invoke ExitProcess, 0
main ENDP
END main