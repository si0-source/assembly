INCLUDE Irvine32.inc

.data
start DWORD 1
chars BYTE 'H','A','C','E','B','D','F','G',0
links DWORD 0,4,5,6,2,3,7,0
result BYTE 8 DUP(0)
.code
main PROC
    mov esi, start
    mov edi, 0
    mov ecx, 8
L1:
    cmp esi, 0
    mov al, chars[esi]
    mov result[edi], al
    inc edi
    mov eax, links[esi*4]
    mov esi, eax
    loop L1
    invoke ExitProcess, 0
main ENDP
END main