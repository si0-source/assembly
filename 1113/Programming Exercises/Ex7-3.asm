INCLUDE Irvine32.inc

.data
pd1 DWORD 1111h
pd2 DWORD 222h
pd3 DWORD 333h
pd4 DWORD 4444h
pd5 DWORD 555h

buf1 BYTE 9 DUP(0)
buf2 BYTE 9 DUP(0)
buf3 BYTE 9 DUP(0)
buf4 BYTE 9 DUP(0)
buf5 BYTE 9 DUP(0)

.code
main PROC
    mov eax, pd1
    mov edx, OFFSET buf1
    call PackedToAsc
    mov edx, OFFSET buf1
    call WriteString
    call Crlf

    mov eax, pd2
    mov edx, OFFSET buf2
    call PackedToAsc
    mov edx, OFFSET buf2
    call WriteString
    call Crlf

    mov eax, pd3
    mov edx, OFFSET buf3
    call PackedToAsc
    mov edx, OFFSET buf3
    call WriteString
    call Crlf

    mov eax, pd4
    mov edx, OFFSET buf4
    call PackedToAsc
    mov edx, OFFSET buf4
    call WriteString
    call Crlf

    mov eax, pd5
    mov edx, OFFSET buf5
    call PackedToAsc
    mov edx, OFFSET buf5
    call WriteString
    call Crlf

    invoke Exitprocess, 0
main ENDP

PackedToAsc PROC
    push ebx
    push ecx
    push edx

    mov ecx, 8
    mov ebx, edx
L1:
    mov edx,0
    mov dl, al
    and dl,0Fh
    add dl,'0'
    mov [ebx+ecx-1], dl
    shr al,4
    dec ecx
    cmp ecx,0
    jne L1

    mov byte ptr [ebx+8],0
    pop edx
    pop ecx
    pop ebx
    ret
PackedToAsc ENDP

END main
