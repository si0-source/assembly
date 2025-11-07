INCLUDE Irvine32.inc

.data
arr DWORD 10 DUP(?)

.code
Fill PROC
    push eax
    push ebx
    push ecx
    push edx
    push esi
    mov eax, edx
    sub eax, ebx
    inc eax
L1:
    mov edx, eax
    call RandomRange
    add eax, ebx
    mov [esi], eax
    add esi, 4
    loop L1
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
Fill ENDP


main PROC
    mov esi, OFFSET arr
    mov ecx, 10
    mov ebx, 5
    mov edx, 15
    call Fill
    mov esi, OFFSET arr
    mov ecx, 10
L2:
    mov eax, [esi]
    call WriteInt
    call Crlf
    add esi, 4
    loop L2

    exit
main ENDP
END main
