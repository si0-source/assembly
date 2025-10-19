INCLUDE Irvine32.inc

.data
array DWORD 10, 20, 30, 40, 50, 60
count = LENGTHOF array

.code
main PROC
    mov ecx, count / 2
    mov esi, 0

L1:
    mov eax, array[esi*8]
    mov ebx, array[esi*8+4]
    mov array[esi*8], ebx
    mov array[esi*8+4], eax

    inc esi
    loop L1

    invoke ExitProcess, 0
main ENDP
END main