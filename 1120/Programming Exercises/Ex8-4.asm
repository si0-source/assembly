include Irvine32.inc

.data
arr1 DWORD 3, 3, 3
arr2 DWORD 3, 3, 2, 3
arr3 DWORD 0, 1, 2, 3, 3, 3
arr4 DWORD 1, 2, 3, 4, 5

.code

FindThrees PROC arrPtr:DWORD, arrSize:DWORD
    push ebx
    push ecx
    push edx

    mov ebx, arrPtr
    mov ecx, arrSize
    cmp ecx, 3
    jl NotFound

    mov edx, 0

CheckLoop:
    mov eax, [ebx + edx*4]
    cmp eax, 3
    jne NextIndex

    mov esi, edx
    inc esi
    shl esi, 2
    mov eax, [ebx + esi]
    cmp eax, 3
    jne NextIndex

    mov esi, edx
    add esi, 2
    shl esi, 2
    mov eax, [ebx + esi]
    cmp eax, 3
    jne NextIndex

    mov eax, 1
    jmp Done

NextIndex:
    inc edx
    mov eax, ecx
    sub eax, 2
    cmp edx, eax
    jl CheckLoop

NotFound:
    mov eax, 0

Done:
    pop edx
    pop ecx
    pop ebx
    ret
FindThrees ENDP

main PROC
    INVOKE FindThrees, OFFSET arr1, LENGTHOF arr1
    call DumpRegs

    INVOKE FindThrees, OFFSET arr2, LENGTHOF arr2
    call DumpRegs

    INVOKE FindThrees, OFFSET arr3, LENGTHOF arr3
    call DumpRegs

    INVOKE FindThrees, OFFSET arr4, LENGTHOF arr4
    call DumpRegs

    INVOKE ExitProcess, 0
main ENDP

END main
