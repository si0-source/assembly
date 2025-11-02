INCLUDE Irvine32.inc

.data
N = 50
arr BYTE N DUP(0)
.code
main PROC
    mov esi, OFFSET arr
    mov ebx, 2
    call twothree
    mov esi, OFFSET arr
    mov ebx, 3
    call twothree
    mov esi, OFFSET arr
    mov ecx, N
L1:
    movzx eax, BYTE PTR [esi]
    call WriteDec
    mov al, ' '
    call WriteChar
    inc esi
    loop L1
    invoke ExitProcess, 0
main ENDP
twothree PROC
    push edx
    mov edx, ebx
    mov ecx, N
L2:
    mov eax, edx
    cmp eax, ecx
    setb al
    test al, al
    jz L3
    mov BYTE PTR [esi+edx], 1
    add edx, ebx
    loop L2
L3:
    pop edx
    ret
twothree ENDP
END main
