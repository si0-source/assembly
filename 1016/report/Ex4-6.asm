INCLUDE Irvine32.inc

.data
array DWORD 10, 20, 30, 40, 50
count = LENGTHOF array

.code
main PROC
    mov esi, OFFSET array
    mov edi, OFFSET array + (count-1)*TYPE array
    mov ecx, count
    shr ecx, 1

L1:
    mov eax, [esi]
    xchg eax, [edi]
    mov [esi], eax
    add esi, 4
    sub edi, 4
    loop L1

    invoke ExitProcess, 0
main ENDP
END main