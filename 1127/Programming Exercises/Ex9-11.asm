INCLUDE Irvine32.inc

.data
vowels      BYTE "AEIOU"
consonants  BYTE "BCDFGHJKLMNPQRSTVWXYZ"

matrix      BYTE 16 DUP(?)
tempStr     BYTE 5 DUP(0)

msgMatrix   BYTE "Generated 4x4 matrix:",0dh,0ah,0
msgSet      BYTE "4-letter sets (all sets, no vowel check):",0dh,0ah,0

.code

CreateMatrix PROC
    push edi
    xor edi, edi
GenLoop:
    mov eax, 2
    call RandomRange
    cmp eax,0
    jne MakeConsonant
MakeVowel:
    mov eax,5
    call RandomRange
    dec eax
    mov al,vowels[eax]
    jmp Store
MakeConsonant:
    mov eax,21
    call RandomRange
    dec eax
    mov al,consonants[eax]
Store:
    mov matrix[edi], al
    inc edi
    cmp edi,16
    jl GenLoop
    pop edi
    ret
CreateMatrix ENDP

PrintMatrix PROC
    push esi
    push ebx
    lea esi,matrix
    mov ecx,4
RowLoop:
    xor ebx, ebx
ColLoop:
    mov al,[esi+ebx]
    call WriteChar
    mov al,' '
    call WriteChar
    inc ebx
    cmp ebx,4
    jl ColLoop
    call Crlf
    add esi,4
    dec ecx
    jne RowLoop
    call Crlf
    pop ebx
    pop esi
    ret
PrintMatrix ENDP

ExtractSet PROC
    push esi
    xor esi,esi
LoopSet:
    mov ebx,esi
    imul ebx,edx
    add ebx,eax
    mov al,matrix[ebx]
    mov tempStr[esi],al
    inc esi
    cmp esi,4
    jl LoopSet
    mov byte ptr tempStr[4],0
    mov edx,OFFSET tempStr
    call WriteString
    call Crlf
    pop esi
    ret
ExtractSet ENDP

main PROC
    call Randomize
    call CreateMatrix

    mov edx,OFFSET msgMatrix
    call WriteString
    call PrintMatrix

    mov edx,OFFSET msgSet
    call WriteString

    ; 행
    mov ecx,0
RowLoop:
    mov eax,ecx
    shl eax,2        ; row*4
    mov edx,1
    call ExtractSet
    inc ecx
    cmp ecx,4
    jl RowLoop

    ; 열
    mov ecx,0
ColLoop:
    mov eax,ecx
    mov edx,4
    call ExtractSet
    inc ecx
    cmp ecx,4
    jl ColLoop

    ; 왼위→오아래
    mov eax,0
    mov edx,5
    call ExtractSet

    ; 오른위→왼아래
    mov eax,3
    mov edx,3
    call ExtractSet

    exit
main ENDP
END main
