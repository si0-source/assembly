INCLUDE Irvine32.inc

.code
Cal PROC
    push ebx
    push ecx
    push edx
    mov ebx, eax
    cmp ebx, 90
    jae A
    cmp ebx, 80
    jae B
    cmp ebx, 70
    jae C1
    cmp ebx, 60
    jae D1
    jmp F1
A:
    mov al, 'A'
    jmp Done
B:
    mov al, 'B'
    jmp Done
C1:
    mov al, 'C'
    jmp Done
D1:
    mov al, 'D'
    jmp Done
F1:
    mov al, 'F'

Done:
    pop edx
    pop ecx
    pop ebx
    ret
Cal ENDP
main PROC
    call ReadInt
    call Cal
    movzx eax, al
    call WriteChar
    call Crlf
    invoke ExitProcess, 0
main ENDP
END main
