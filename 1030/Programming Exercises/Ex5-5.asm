INCLUDE Irvine32.inc
.data
.code

goodrandom PROC
    push ebx
    sub eax, ebx
    call RandomRange
    add eax, ebx
    pop ebx
    ret
goodrandom ENDP
main PROC
    mov ecx, 50
L1:
    mov ebx, -300
    mov eax, 100
    call goodrandom
    call WriteInt
    call Crlf
    loop L1
    invoke ExitProcess, 0
main ENDP
END main
