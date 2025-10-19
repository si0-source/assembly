INCLUDE Irvine32.inc

.data
f DWORD 7 DUP(?)
count =5
.code
main PROC
    mov eax, 1
    mov ebx, 1
    mov esi, OFFSET f

    mov [esi], eax
    add esi, 4
    mov [esi], ebx
    add esi, 4
    mov ecx, count

L1:
    mov edx, eax
    add eax, ebx
    mov [esi], eax
    add esi, 4
    mov eax, ebx
    mov ebx, edx
    loop L1

    invoke ExitProcess, 0
main ENDP

END main
