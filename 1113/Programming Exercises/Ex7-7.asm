INCLUDE Irvine32.inc

.data
num1 DWORD 13
num2 DWORD 11
result DWORD 0

.code
main PROC
    mov eax, num1
    mov ebx, num2
    call ShiftAdd
    mov result, eax
    mov eax, result
    call WriteDec
    call Crlf

    exit
main ENDP

ShiftAdd PROC
    push ecx
    push edx

    mov ecx, 32
    xor edx, edx

MLoop:
    test ebx, 1
    jz SkipAdd
    add edx, eax
SkipAdd:
    shl eax, 1
    shr ebx, 1
    loop MLoop

    mov eax, edx

    pop edx
    pop ecx
    ret
ShiftAdd ENDP

END main
