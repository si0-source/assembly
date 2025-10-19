INCLUDE Irvine32.inc

.data
w WORD 1000h, 2000h, 3000h
count = 3
d DWORD count DUP(?)

.code
main PROC
    mov ecx, count
    mov esi, OFFSET w
    mov edi, OFFSET d

L1:
    movzx eax, WORD PTR [esi]
    mov [edi], eax
    add esi, 2
    add edi, 4
    loop L1

    invoke ExitProcess, 0
main ENDP
END main