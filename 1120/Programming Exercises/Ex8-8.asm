INCLUDE Irvine32.inc

.data
arrA1 DWORD 1, 2, 3, 4, 5
arrB1 DWORD 1, 0, 3, 2, 5

arrA2 DWORD 7, 8, 9, 10
arrB2 DWORD 7, 8, 0, 10

.code

CountMatches PROTO :PTR DWORD, :PTR DWORD, :DWORD

CountMatches PROC pArr1:PTR DWORD, pArr2:PTR DWORD, len:DWORD
    push ebx
    push esi
    push edi

    mov edi, pArr1        ; 배열 1 시작 주소
    mov esi, pArr2        ; 배열 2 시작 주소
    xor ecx, ecx          ; 인덱스 0

LoopStart:
    cmp ecx, len
    jge LoopDone

    mov eax, [edi + ecx*4] ; arr1[ecx]
    cmp eax, [esi + ecx*4] ; arr2[ecx]
    jne Next
    inc ebx                 ; 일치 카운트

Next:
    inc ecx
    jmp LoopStart

LoopDone:
    pop edi
    pop esi
    pop ebx
    ret
CountMatches ENDP

main PROC
    INVOKE CountMatches, ADDR arrA1, ADDR arrB1, LENGTHOF arrA1
    call WriteDec
    call Crlf

    INVOKE CountMatches, ADDR arrA2, ADDR arrB2, LENGTHOF arrA2
    call WriteDec
    call Crlf

    INVOKE ExitProcess, 0
main ENDP

END main
