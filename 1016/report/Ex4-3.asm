INCLUDE Irvine32.inc

.data
array DWORD 10, 20, 30, 40, 50, 60
count = LENGTHOF array

.code
main PROC
    mov ecx, count - 1
    mov esi, OFFSET array
    mov eax, 0

L1:
    mov ebx, [esi+4]
    sub ebx, [esi]
    add eax, ebx
    add esi, 4
    loop L1
    invoke ExitProcess, 0
main ENDP
END main