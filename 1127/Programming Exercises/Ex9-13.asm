INCLUDE Irvine32.inc

.data
a      BYTE '#'        ; 제거할 문자
str1    BYTE "###ABC",0

.code
main PROC
    lea edx, str1
    mov al, a
    push eax
    push edx
    call Str_trimLeading
    add esp, 8

    mov edx, OFFSET str1
    call WriteString
    call Crlf
    exit
main ENDP

Str_trimLeading PROC
    push ebp
    mov ebp, esp
    push esi
    push edi

    mov esi, [ebp+8]    ; 문자열 포인터
    mov al,  [ebp+12]   ; 제거할 문자

SkipLoop:
    cmp byte ptr [esi], al
    jne Done
    inc esi
    cmp byte ptr [esi], 0
    je Done
    jmp SkipLoop

Done:
    mov edi, [ebp+8]    ; 원래 문자열 포인터
CopyLoop:
    mov bl, [esi]
    mov [edi], bl
    inc esi
    inc edi
    test bl, bl
    jnz CopyLoop

    pop edi
    pop esi
    mov esp, ebp
    pop ebp
    ret
Str_trimLeading ENDP

END main
