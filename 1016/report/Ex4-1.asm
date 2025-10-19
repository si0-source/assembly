INCLUDE Irvine32.inc

.data
bigEndian  BYTE 12h, 34h, 56h, 78h
littleEndian DWORD ?

.code
main PROC
    mov al, [bigEndian]
    mov ah, [bigEndian+1]
    mov bl, [bigEndian+2]
    mov bh, [bigEndian+3]

    mov BYTE PTR [littleEndian], bh
    mov BYTE PTR [littleEndian+1], bl
    mov BYTE PTR [littleEndian+2], ah
    mov BYTE PTR [littleEndian+3], al

    mov eax, littleEndian

    invoke ExitProcess, 0
main ENDP
END main