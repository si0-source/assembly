INCLUDE Irvine32.inc

.data
source BYTE "This is the source string",0
target BYTE SIZEOF source DUP('#')

.code
main PROC
    mov esi, OFFSET source
    mov edi, OFFSET target
    mov ecx, LENGTHOF source
    dec ecx
    add esi, ecx

L1:
    mov al, [esi-1]
    mov [edi], al
    inc edi
    dec esi
    loop L1

    mov BYTE PTR [edi], 0

    mov edx, OFFSET target
    call WriteString
    call Crlf

    invoke ExitProcess, 0
main ENDP
END main