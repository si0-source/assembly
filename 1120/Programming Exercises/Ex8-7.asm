include Irvine32.inc

.data
pairs DWORD 5,20, 24,18, 11,7, 432,226, 26,13

.code
GCD PROC a:DWORD, b:DWORD
    cmp b, 0
    je Done
    mov eax, a
    cdq
    idiv b
    push edx
    push b
    call GCD
    add esp, 8
    ret
Done:
    mov eax, a
    ret
GCD ENDP

main PROC
    mov ecx, 0
TestLoop:
    cmp ecx, 10
    jge Done
    mov eax, pairs[ecx*4]
    mov ebx, pairs[ecx*4+4]
    push ebx
    push eax
    call GCD
    add esp, 8
    call WriteDec
    call Crlf
    add ecx, 2
    jmp TestLoop
Done:
    INVOKE ExitProcess, 0
main ENDP

END main
