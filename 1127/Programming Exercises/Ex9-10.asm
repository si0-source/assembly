INCLUDE Irvine32.inc

.data
vowels BYTE "AEIOU"
consonants BYTE "BCDFGHJKLMNPQRSTVWXYZ"
matrix BYTE 16 DUP(?)

.code

CreateMatrix PROC
    push edi
    xor edi,edi
GenLoop:
    mov eax,2
    call RandomRange
    cmp eax,0
    jne MakeConsonant
MakeVowel:
    mov eax,5
    call RandomRange
    mov al, vowels[eax]
    jmp StoreLetter
MakeConsonant:
    mov eax,21
    call RandomRange
    mov al, consonants[eax]
StoreLetter:
    mov matrix[edi], al
    inc edi
    cmp edi,16
    jne GenLoop
    pop edi
    ret
CreateMatrix ENDP

PrintMatrix PROC
    push esi
    push ebx
    push edi
    lea esi, matrix
    mov edi,4
RowLoop:
    xor ebx, ebx
ColLoop:
    mov al, [esi + ebx]
    call WriteChar
    mov al, ' '
    call WriteChar
    inc ebx
    cmp ebx,4
    jne ColLoop
    call Crlf
    add esi,4
    dec edi
    jne RowLoop
    call Crlf
    pop edi
    pop ebx
    pop esi
    ret
PrintMatrix ENDP

main PROC
    call Randomize
    push edi
    mov edi,5
PrintLoop:
    call CreateMatrix
    call PrintMatrix
    dec edi
    jnz PrintLoop
    pop edi
    exit
main ENDP

END main
