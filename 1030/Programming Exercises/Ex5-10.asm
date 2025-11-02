INCLUDE Irvine32.inc

.data
f DWORD 47 DUP(?)
.code
main PROC
    mov esi, OFFSET f
    mov ecx, 47
    push ecx
    push esi
    call f1
    mov ecx, 47
    mov esi, OFFSET f
L1:
    mov eax, [esi]
    call WriteDec
    call Crlf
    add esi, 4
    loop L1
    invoke ExitProcess, 0
main ENDP
f1 PROC
    push ebx
    push edi
    mov edi, esi
    mov eax, 1
    mov [edi], eax
    add edi, 4
    mov [edi], eax
    sub ecx, 2
L2:
    mov eax, [edi]
    mov ebx, [edi-4]
    add eax, ebx
    add edi, 4
    mov [edi], eax
    loop L2
    pop edi
    pop ebx
    ret
f1 ENDP
END main
