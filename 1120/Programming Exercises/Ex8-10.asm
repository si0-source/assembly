.386
.model flat, stdcall
.stack 4096
include \Irvine\Irvine32.inc

.data
    msgAddr BYTE "Address ", 0
    msgEq   BYTE " = ", 0

.code

MySample PROC first:DWORD, second:DWORD, third:DWORD
    push ebp
    mov ebp, esp

    mov edx, OFFSET msgAddr
    call WriteString
    lea eax, [ebp + 12]
    call WriteHex
    mov edx, OFFSET msgEq
    call WriteString
    mov eax, [ebp + 12]
    call WriteHex
    call CrLf

    mov edx, OFFSET msgAddr
    call WriteString
    lea eax, [ebp + 16]
    call WriteHex
    mov edx, OFFSET msgEq
    call WriteString
    mov eax, [ebp + 16]
    call WriteHex
    call CrLf

    mov edx, OFFSET msgAddr
    call WriteString
    lea eax, [ebp + 20]
    call WriteHex
    mov edx, OFFSET msgEq
    call WriteString
    mov eax, [ebp + 20]
    call WriteHex
    call CrLf

    pop ebp
    ret
MySample ENDP

main PROC
    INVOKE MySample, 1234h, 5000h, 6543h
    exit
main ENDP

END main
