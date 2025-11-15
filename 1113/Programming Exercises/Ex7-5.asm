INCLUDE Irvine32.inc

.data
sieve BYTE 1001 DUP(1)

.code
main PROC
    mov ecx, 2
L1:
    cmp ecx, 32
    ja LDone
    mov al, [sieve + ecx]
    cmp al, 0
    je Skip
    mov ebx, ecx
L2:
    add ebx, ecx
    cmp ebx, 1000
    ja L3
    mov byte ptr [sieve + ebx], 0
    jmp L2
L3:
Skip:
    inc ecx
    jmp L1
LDone:

    mov ecx, 2
PrintLoop:
    cmp ecx, 1001
    ja PrintDone
    cmp byte ptr [sieve + ecx],0
    je Next
    mov eax, ecx
    call WriteDec
    call Crlf
Next:
    inc ecx
    jmp PrintLoop
PrintDone:
    invoke ExitProcess, 0
main ENDP

END main
