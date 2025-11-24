include Irvine32.inc

.data
arr1 DWORD 5, 10, 15, 20, 25
arr2 DWORD 6, 9, 15, 18, 30
arr3 DWORD 1, 2, 3, 4, 5
arr4 DWORD 1, 2, 3, 5, 6
len   DWORD 5
diff1 DWORD 2
diff2 DWORD 1

.code
CountNearMatches PROTO :DWORD, :DWORD, :DWORD, :DWORD

CountNearMatches PROC pArr1:DWORD, pArr2:DWORD, arrLen:DWORD, diff:DWORD
    push ebx
    push esi
    push edi

    mov esi, pArr1
    mov edi, pArr2
    mov ecx, arrLen
    xor eax, eax

NextElement:
    cmp ecx, 0
    je Done
    mov ebx, [esi]
    mov edx, [edi]
    sub ebx, edx
    cmp ebx, 0
    jge PosDiff
    neg ebx
PosDiff:
    cmp ebx, diff
    jg Skip
    inc eax
Skip:
    add esi, 4
    add edi, 4
    dec ecx
    jmp NextElement

Done:
    pop edi
    pop esi
    pop ebx
    ret
CountNearMatches ENDP

main PROC
    INVOKE CountNearMatches, OFFSET arr1, OFFSET arr2, len, diff1
    call WriteDec
    call Crlf

    INVOKE CountNearMatches, OFFSET arr3, OFFSET arr4, len, diff2
    call WriteDec
    call Crlf

    INVOKE ExitProcess, 0
main ENDP

END main
