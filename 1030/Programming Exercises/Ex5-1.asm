INCLUDE Irvine32.inc
.data
msg BYTE "Hello, world!",0
colors BYTE 4,2,6,1
.code
main PROC
    mov ecx, 4
    mov esi, 0
L1:
    mov al, colors[esi]
    call SetTextColor
    mov edx, OFFSET msg
    call WriteString
    call Crlf
    inc esi
    loop L1
    invoke ExitProcess, 0
main ENDP
END main