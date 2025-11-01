INCLUDE Irvine32.inc

.data
char BYTE '*'
.code
main PROC
    mov ecx, 100
L1:
    call GetMaxXY
    movzx eax, AL
    call RandomRange
    mov bl, al
    movzx eax, DL
    call RandomRange
    mov bh, al
    mov dl, bl
    mov dh, bh
    call Gotoxy
    mov al, char
    call WriteChar
    mov eax, 100
    call Delay
    loop L1
main ENDP
END main
