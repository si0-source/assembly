INCLUDE Irvine32.inc

.data
num4a  BYTE 12h,34h,56h,78h
num4b  BYTE 09h,08h,07h,06h
sum4   BYTE 4 DUP(0)

num8a  BYTE 11h,22h,33h,44h,55h,66h,77h,88h
num8b  BYTE 01h,01h,01h,01h,01h,01h,01h,01h
sum8   BYTE 8 DUP(0)

num16a BYTE 16 DUP(11h)
num16b BYTE 16 DUP(22h)
sum16  BYTE 16 DUP(0)

msg BYTE "Sum = ",0

.code
AddPacked PROC
    add esi, ecx
    add edi, ecx
    add edx, ecx
    clc
L1:
    dec esi
    dec edi
    dec edx
    mov al, [esi]
    add al, [edi]
    adc al, 0
    daa
    mov [edx], al
    loop L1
    ret
AddPacked ENDP

DumpPacked PROC
    push eax
    push ecx
    push esi
    mov ebx, ecx
L2:
    mov al, [esi]
    shr al, 4
    add al, '0'
    call WriteChar
    mov al, [esi]
    and al, 0Fh
    add al, '0'
    call WriteChar
    inc esi
    dec ebx
    jnz L2
    pop esi
    pop ecx
    pop eax
    ret
DumpPacked ENDP

main PROC
    mov esi, OFFSET num4a
    mov edi, OFFSET num4b
    mov edx, OFFSET sum4
    mov ecx, 4
    call AddPacked
    mov edx, OFFSET msg
    call WriteString
    mov esi, OFFSET sum4
    mov ecx, 4
    call DumpPacked
    call CrLf

    mov esi, OFFSET num8a
    mov edi, OFFSET num8b
    mov edx, OFFSET sum8
    mov ecx, 8
    call AddPacked
    mov edx, OFFSET msg
    call WriteString
    mov esi, OFFSET sum8
    mov ecx, 8
    call DumpPacked
    call CrLf

    mov esi, OFFSET num16a
    mov edi, OFFSET num16b
    mov edx, OFFSET sum16
    mov ecx, 16
    call AddPacked
    mov edx, OFFSET msg
    call WriteString
    mov esi, OFFSET sum16
    mov ecx, 16
    call DumpPacked
    call CrLf

    exit
main ENDP
END main
