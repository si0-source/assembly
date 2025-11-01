INCLUDE Irvine32.inc

.data
char BYTE '#'
.code
main PROC
    mov ecx, 16
    mov bl, 0
L1:
    push ecx
    mov ecx, 16
    mov bh, 0
L2:
    mov al, bl
    shl al, 4
    add al, bh
    call SetTextColor
    mov al, char
    call WriteChar
    inc bh
    loop L2
    call Crlf
    inc bl
    pop ecx
    loop L1

    invoke ExitProcess, 0
main ENDP
END main
