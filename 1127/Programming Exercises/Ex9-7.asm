INCLUDE Irvine32.inc

.data?
sieve BYTE 65000 DUP(?)

.code
main PROC

    mov edi, OFFSET sieve
    mov ecx, 65000
    xor eax, eax
    rep stosb

    mov ebx, 2

SieveLoop:
    cmp ebx, 255
    jg PrintPrimes

    movzx eax, BYTE PTR [sieve + ebx]
    cmp eax, 0
    jne Next_i

    mov edx, ebx
    add edx, ebx

MarkMultiples:
    cmp edx, 65000
    jge Next_i

    mov BYTE PTR [sieve + edx], 1
    add edx, ebx
    jmp MarkMultiples

Next_i:
    inc ebx
    jmp SieveLoop

PrintPrimes:
    mov ecx, 2

PrintLoop:
    cmp ecx, 65000
    jge ExitProgram

    movzx eax, BYTE PTR [sieve + ecx]
    cmp eax, 0
    jne NotPrime

    mov eax, ecx
    call WriteDec
    call Crlf

NotPrime:
    inc ecx
    jmp PrintLoop

ExitProgram:
    exit

main ENDP
END main
