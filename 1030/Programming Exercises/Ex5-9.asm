INCLUDE Irvine32.inc

.data
count DWORD 0
.code
L1 PROC
    inc count
    loop L1
    ret
L1 ENDP

main PROC
    mov ecx, 5
    call L1
    mov eax, count
    call WriteDec
    invoke ExitProcess, 0
main ENDP
END main

