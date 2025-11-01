INCLUDE Irvine32.inc

.data
count DWORD 0
.code
L1 PROC
    inc count          ; 호출 횟수 증가
    loop L1         ; ECX-- 후 0이 아니면 다시 호출
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
