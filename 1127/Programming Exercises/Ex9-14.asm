INCLUDE Irvine32.inc

.data
str1    BYTE "ABC#$&",0
trimSet BYTE "%#!;$&*",0
msg     BYTE "Trimmed string: ",0

.code
main PROC
    lea edx, str1
    lea ecx, trimSet
    push ecx
    push edx
    call Str_trimSetEnd
    add esp, 8

    mov edx, OFFSET msg
    call WriteString
    mov edx, OFFSET str1
    call WriteString
    call Crlf
    exit
main ENDP

Str_trimSetEnd PROC
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx

    mov esi, [ebp+8]
    mov edi, [ebp+12]

    mov ecx, 0
    mov edx, esi
StrLenLoop:
    cmp byte ptr [edx], 0
    je StrLenDone
    inc edx
    inc ecx
    jmp StrLenLoop
StrLenDone:
    test ecx, ecx
    jz DoneTrim
    dec edx

TrimLoop:
    mov bl, [edx]
    mov esi, [ebp+12]
CheckSet:
    cmp byte ptr [esi], 0
    je NextChar
    cmp bl, [esi]
    je RemoveChar
    inc esi
    jmp CheckSet
NextChar:
    jmp DoneTrim

RemoveChar:
    mov byte ptr [edx], 0
    dec edx
    jmp TrimLoop

DoneTrim:
    pop ebx
    pop edi
    pop esi
    mov esp, ebp
    pop ebp
    ret
Str_trimSetEnd ENDP

END main
