INCLUDE Irvine32.inc

.data
option1  BYTE "1.xANDy",0
option2  BYTE "2.xORy",0
option3  BYTE "3.NOTx",0
option4  BYTE "4.xXORy",0
option5  BYTE "5.Exit",0
prompt1  BYTE "Enter1:",0
prompt2  BYTE "Enter2:",0
result   BYTE "Result:",0
newline  BYTE 13,10,0

opNames  BYTE "xANDy",0,"xORy",0,"NOTx",0,"xXORy",0

.code
main PROC
loopStart:
    mov edx, OFFSET option1
    call WriteString
    call Crlf
    mov edx, OFFSET option2
    call WriteString
    call Crlf
    mov edx, OFFSET option3
    call WriteString
    call Crlf
    mov edx, OFFSET option4
    call WriteString
    call Crlf
    mov edx, OFFSET option5
    call WriteString
    call Crlf

    call ReadInt
    mov esi, eax
    cmp esi,5
    je exitProgram

    push esi
    call ShowOperation
    pop esi

    cmp esi,3
    je NotOp

    mov edx, OFFSET prompt1
    call WriteString
    call ReadInt
    mov ebx, eax

    mov edx, OFFSET prompt2
    call WriteString
    call ReadInt
    mov ecx, eax

    cmp esi,1
    je AndOp
    cmp esi,2
    je OrOp
    cmp esi,4
    je XorOp
    jmp loopStart

AndOp:
    mov eax, ebx
    and eax, ecx
    jmp PrintResult

OrOp:
    mov eax, ebx
    or eax, ecx
    jmp PrintResult

XorOp:
    mov eax, ebx
    xor eax, ecx
    jmp PrintResult

NotOp:
    mov edx, OFFSET prompt1
    call WriteString
    call ReadInt
    mov eax, eax
    not eax
    jmp PrintResult

PrintResult:
    mov edx, OFFSET result
    call WriteString
    call WriteInt
    call Crlf
    jmp loopStart

exitProgram:
    invoke ExitProcess,0

ShowOperation PROC
    push ebx
    push ecx
    push edx

    mov ecx, eax
    dec ecx
    mov edi, OFFSET opNames
nextOp:
    cmp ecx,0
    je found
skip:
    mov al,[edi]
    cmp al,0
    je nextStr
    inc edi
    jmp skip
nextStr:
    inc edi
    dec ecx
    jmp nextOp
found:
    mov edx, edi
printLoop:
    mov al,[edx]
    cmp al,0
    je donePrint
    mov ah,0
    call WriteChar
    inc edx
    jmp printLoop
donePrint:
    call Crlf

    pop edx
    pop ecx
    pop ebx
    ret
ShowOperation ENDP

main ENDP
END main
