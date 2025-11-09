INCLUDE Irvine32.inc

.data
Grade   BYTE "점수(0~100): ",0
Credit  BYTE "학점(1~30): ",0
Can     BYTE "The student can register",0
Cannot  BYTE "The student cannot register",0
Error   BYTE "Error: Invalid credits (1~30)",0
.code
main PROC
    call ClrScr
    mov edx, OFFSET Grade
    call WriteString
    call ReadInt
    mov ebx, eax
    mov edx, OFFSET Credit
    call WriteString
    call ReadInt
    mov ecx, eax
    cmp ecx, 1
    jl showError
    cmp ecx, 30
    jg showError
    cmp ebx, 70
    jl showCannot
    mov edx, OFFSET Can
    call WriteString
    jmp Done
showCannot:
    mov edx, OFFSET Cannot
    call WriteString
    jmp Done
showError:
    mov edx, OFFSET Error
    call WriteString
Done:
    call Crlf
    exit
main ENDP

END main
