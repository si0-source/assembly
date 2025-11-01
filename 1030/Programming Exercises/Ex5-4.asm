INCLUDE Irvine32.inc
.code
main PROC
    call ClrScr
    mov ecx, 3
L1:
    
    call ReadInt
    mov ebx, eax
    call ReadInt
    add eax, ebx
    call WriteInt
    call Crlf
    loop L1

    invoke ExitProcess, 0
main ENDP
END main
