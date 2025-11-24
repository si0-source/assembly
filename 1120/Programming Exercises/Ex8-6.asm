INCLUDE Irvine32.inc

.data
Array DWORD 10, 20, 30, 40, 50, 60
ArraySize DWORD LENGTHOF Array

.code
Swap PROC USES eax esi edi, pValX:PTR DWORD, pValY:PTR DWORD
    mov esi, pValX
    mov edi, pValY
    mov eax, [esi]
    xchg eax, [edi]
    mov [esi], eax
    ret
Swap ENDP

main PROC
    mov ecx, 0

SwapLoop:
    mov eax, ArraySize
    sub eax, 1
    cmp ecx, eax
    jge Done

    lea esi, Array[ecx*TYPE Array]
    mov eax, ecx
    inc eax
    imul eax, TYPE Array
    lea edi, Array[eax]
    push edi
    push esi
    call Swap

    add ecx, 2
    jmp SwapLoop

Done:
    INVOKE ExitProcess, 0
main ENDP

END main
