INCLUDE Irvine32.inc

.data
val1 DWORD 48
val2 DWORD 18
val3 DWORD 16
val4 DWORD 4

.code
main PROC
    mov eax, val1
    mov ebx, val2
    call GCD
    call WriteDec
    call Crlf

    mov eax, val3
    mov ebx, val4
    call GCD
    call WriteDec
    call Crlf

    exit
main ENDP

GCD PROC
    push edx

    cmp eax,0
    jge SkipAbsX
    neg eax
SkipAbsX:
    cmp ebx,0
    jge SkipAbsY
    neg ebx
SkipAbsY:

GCD_Loop:
    cmp ebx,0
    je Done
    mov edx,0
    div ebx       ; eax / ebx -> ¸ò:eax, ³ª¸ÓÁö:edx
    mov eax, ebx  ; x = y
    mov ebx, edx  ; y = n
    jmp GCD_Loop

Done:
    pop edx
    ret
GCD ENDP

END main
