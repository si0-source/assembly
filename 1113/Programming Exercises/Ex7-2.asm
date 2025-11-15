INCLUDE Irvine32.inc

.data
num1 DWORD 11111111h,22222222h,33333333h,44444444h
num2 DWORD 01010101h,02020202h,03030303h,04040404h
res  DWORD 4 DUP(0)

.code
main PROC
    mov esi, OFFSET num1
    mov edi, OFFSET num2
    mov edx, OFFSET res
    mov ecx, 16
    call Extended_Sub

    mov esi, OFFSET res
    mov ecx, 4
L1:
    cmp ecx,0
    je LDone
    mov eax, [esi]
    call WriteHex
    call Crlf
    add esi,4
    dec ecx
    jmp L1
LDone:
    call Crlf
    invoke Exitprocess, 0
main ENDP

Extended_Sub PROC
    push esi
    push edi
    push ebx
    push ecx

    mov ecx, 16
    shr ecx,2
    xor ebx,ebx
L2:
    mov eax, [esi]
    sub eax, [edi]
    sbb ebx,0
    mov [edx], eax
    add esi,4
    add edi,4
    add edx,4
    loop L2

    pop ecx
    pop ebx
    pop edi
    pop esi
    ret
Extended_Sub ENDP

END main
