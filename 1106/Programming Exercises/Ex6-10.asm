INCLUDE Irvine32.inc

.data
a1 BYTE 10 DUP(170)
a2 BYTE 9 DUP(171)
m1 BYTE "Â¦¼ö: ",0
m2 BYTE "È¦¼ö: ",0

.code

p PROC
    push ebx
    push ecx
    push edx
    push esi
    xor eax,eax
L1:
    mov bl,[esi]
    xor eax,ebx
    inc esi
    dec edx
    jnz L1
    test eax,1
    jz EvenLabel
OddLabel:
    mov eax,0
    jmp DoneLabel
EvenLabel:
    mov eax,1
DoneLabel:
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
p ENDP

main PROC
    call ClrScr

    mov esi,OFFSET a1
    mov edx,LENGTHOF a1
    call p
    mov ebx,eax
    mov edx,OFFSET m1
    call WriteString
    mov eax,ebx
    call WriteInt
    call Crlf

    mov esi,OFFSET a2
    mov edx,LENGTHOF a2
    call p
    mov ebx,eax
    mov edx,OFFSET m2
    call WriteString
    mov eax,ebx
    call WriteInt
    call Crlf

    invoke ExitProcess,0
main ENDP

END main
