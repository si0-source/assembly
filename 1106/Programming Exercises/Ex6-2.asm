INCLUDE Irvine32.inc

.data
a BYTE "Â¦¼ö",0
a1  BYTE "È¦¼ö",0

.code
main PROC
    call ReadInt
    mov edx, OFFSET a
    test eax, 1
    jz  L1
    mov edx, OFFSET a1
L1:
    call WriteString
    invoke ExitProcess, 0
main ENDP
END main
