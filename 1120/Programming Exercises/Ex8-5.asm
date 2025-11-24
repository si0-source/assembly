include Irvine32.inc

.data
test1 DWORD 1,2,3
test2 DWORD 3,3,4
test3 DWORD 5,5,5
test4 DWORD 6,7,8
test5 DWORD 9,9,10

.code
DifferentInputs PROC a:DWORD, b:DWORD, cc:DWORD
    mov eax, a
    mov ebx, b
    mov ecx, cc

    mov edx, 1
    cmp eax, ebx
    je NotDifferent
    cmp eax, ecx
    je NotDifferent
    cmp ebx, ecx
    je NotDifferent
    mov eax, edx
    jmp Done

NotDifferent:
    xor eax, eax

Done:
    ret
DifferentInputs ENDP



main PROC
    INVOKE DifferentInputs, test1[0], test1[4], test1[8]
    call DumpRegs

    INVOKE DifferentInputs, test2[0], test2[4], test2[8]
    call DumpRegs

    INVOKE DifferentInputs, test3[0], test3[4], test3[8]
    call DumpRegs

    INVOKE DifferentInputs, test4[0], test4[4], test4[8]
    call DumpRegs

    INVOKE DifferentInputs, test5[0], test5[4], test5[8]
    call DumpRegs

    INVOKE ExitProcess, 0
main ENDP

END main
