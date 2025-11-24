include Irvine32.inc

LIGHT_COLOR EQU 0F0h
DARK_BASE   EQU 080h

DrawSquare PROTO X:DWORD, Y:DWORD, Color:DWORD
DrawBoard  PROTO StartX:DWORD, StartY:DWORD, VarColor:DWORD

.data
    SQUARE_CHAR BYTE ' '

.code

DrawSquare PROC USES EAX EDX, X:DWORD, Y:DWORD, Color:DWORD
    mov     EAX, X
    mov     DL, AL
    mov     EAX, Y
    mov     DH, AL
    call    Gotoxy

    mov     eax, Color
    call    SetTextColor

    mov     AL, SQUARE_CHAR
    call    WriteChar
    mov     AL, SQUARE_CHAR
    call    WriteChar
    ret
DrawSquare ENDP

DrawBoard PROC USES ESI EDI EBX EDX EAX, StartX:DWORD, StartY:DWORD, VarColor:DWORD
    mov     ESI, StartX
    mov     EDI, StartY
    mov     EBX, 0
RowLoop:
    cmp     EBX, 8
    jge     BoardDone
    mov     EDX, 0
ColLoop:
    cmp     EDX, 8
    jge     NextRow

    mov     EAX, EBX
    add     EAX, EDX
    and     AL, 1
    cmp     AL, 0
    je      WhiteSquare
    mov     ECX, VarColor
    jmp     ColorReady
WhiteSquare:
    mov     ECX, LIGHT_COLOR
ColorReady:
    mov     EAX, EDI
    add     EAX, EBX
    mov     ESI, EDX
    shl     ESI, 1
    add     ESI, StartX
    INVOKE  DrawSquare, ESI, EAX, ECX

    inc     EDX
    jmp ColLoop
NextRow:
    inc     EBX
    jmp RowLoop
BoardDone:
    ret
DrawBoard ENDP

main PROC
    mov ecx, 16
    xor edx, edx
LoopColors:
    mov     eax, DARK_BASE
    add     eax, edx
    mov     ebx, eax
    INVOKE  DrawBoard, 1, 1, ebx
    
    inc     edx
    loop LoopColors
    INVOKE  ExitProcess, 0
main ENDP

END main
