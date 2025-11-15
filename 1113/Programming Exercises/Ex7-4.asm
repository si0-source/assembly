INCLUDE Irvine32.inc

.data
key BYTE -2,4,1,0,-3,5,2,-4,-4,6

msg1 BYTE "HELLOWORLD123",0
msg2 BYTE "ASSEMBLYCODE",0

.code
main PROC
    mov edx, OFFSET msg1
    call Encrypt
    mov edx, OFFSET msg1
    call WriteString
    call Crlf

    mov edx, OFFSET msg2
    call Encrypt
    mov edx, OFFSET msg2
    call WriteString
    call Crlf

    invoke Exitprocess, 0
main ENDP

Encrypt PROC
    push esi
    push ecx
    push ebx
    push edx

    mov esi, edx
    xor ecx, ecx

L1:
    mov al, [esi]
    cmp al,0
    je LDone

    mov bl, [key + ecx]

    cmp bl,0
    je SkipRotate
    cmp bl,0
    jl RotateLeft

RotateRight:
    mov bh, bl
RLoop:
    cmp bh,0
    je Store
    ror al,1
    dec bh
    jmp RLoop
    jmp Store

RotateLeft:
    neg bl
    mov bh, bl
LLoop:
    cmp bh,0
    je Store
    rol al,1
    dec bh
    jmp LLoop

Store:
    mov [esi], al

SkipRotate:
    inc esi
    inc ecx
    cmp ecx,10
    jne L1
    xor ecx, ecx
    jmp L1

LDone:
    pop edx
    pop ebx
    pop ecx
    pop esi
    ret
Encrypt ENDP

END main
