INCLUDE Irvine32.inc

.data
decimal1 BYTE "100123456789765",0
decimal2 BYTE "123456789",0
decimal3 BYTE "9876543210",0

len1 = ($-decimal1-1)
len2 = ($-decimal2-1)
len3 = ($-decimal3-1)

.code
main PROC
    mov edx, OFFSET decimal1
    mov ecx, len1
    mov ebx, 5
    call WriteScale
    mov edx, OFFSET decimal2
    mov ecx, len2
    mov ebx, 4
    call WriteScale
    mov edx, OFFSET decimal3
    mov ecx, len3
    mov ebx, 3
    call WriteScale
    invoke ExitProcess, 0
main ENDP
WriteScale PROC
    push esi
    mov esi, edx
    mov eax, 0
    mov edx, ebx
    mov ecx, ecx
    xor edi, edi

L1:
    cmp edi, ecx
    je L3
    mov eax, ecx
    sub eax, edi
    cmp eax, edx
    jne L2
    mov al, '.'
    call WriteChar
L2:
    mov al, [esi+edi]
    call WriteChar
    inc edi
    jmp L1

L3:
    call Crlf
    pop esi
    ret
WriteScale ENDP

END main
