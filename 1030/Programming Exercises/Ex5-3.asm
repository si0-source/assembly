INCLUDE Irvine32.inc
.code
main PROC
    call ClrScr
    call ReadInt
    mov ebx, eax
    call ReadInt
    add eax, ebx
    call WriteInt
    call Crlf

    invoke ExitProcess, 0
main ENDP
END main
