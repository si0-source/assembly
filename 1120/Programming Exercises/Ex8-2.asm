.model flat, stdcall

include Irvine32.inc

LIGHT_COLOR EQU 0F0h
DARK_COLOR EQU 080h

DrawSquare PROTO X:DWORD, Y:DWORD, Color:DWORD
DrawBoard PROTO StartX:DWORD, StartY:DWORD

.data
    SQUARE_CHAR BYTE ' '

.code

DrawSquare PROC USES EAX EDX, X:DWORD, Y:DWORD, Color:DWORD
    MOV EAX, X
    MOV DL, AL
    MOV EAX, Y
    MOV DH, AL
    CALL Gotoxy

    MOV EAX, Color
    MOV AL, BYTE PTR Color
    CALL SetTextColor

    MOV AL, SQUARE_CHAR
    MOV ECX, 2
    CALL WriteChar
    
    RET
DrawSquare ENDP


DrawBoard PROC USES ESI EDI EBX EDX EAX, StartX:DWORD, StartY:DWORD
    MOV ESI, StartX
    MOV EDI, StartY

    MOV EBX, 0
RowLoop:
    CMP EBX, 8
    JGE BoardDone

    MOV EDX, 0
ColLoop:
    CMP EDX, 8
    JGE NextRow

    MOV EAX, EBX
    ADD EAX, EDX
    AND AL, 1
    
    MOV ECX, DARK_COLOR
    CMP AL, 0
    JNE ColorSelected
    MOV ECX, LIGHT_COLOR

ColorSelected:
    MOV EAX, EDI
    ADD EAX, EBX

    MOV ESI, EDX
    SHL ESI, 1
    ADD ESI, StartX
    
    INVOKE DrawSquare, ESI, EAX, ECX

    INC EDX
    JMP ColLoop

NextRow:
    INC EBX
    JMP RowLoop

BoardDone:
    RET
DrawBoard ENDP


main PROC
    INVOKE DrawBoard, 1, 1
    
    CALL ReadChar

    INVOKE ExitProcess, 0
main ENDP

END main