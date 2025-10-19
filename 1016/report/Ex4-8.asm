INCLUDE Irvine32.inc

.data
array DWORD 10, 20, 30, 40
count = LENGTHOF array
.code

main PROC
    mov ecx, count
    dec ecx
    
    mov esi, OFFSET array
    mov edi, OFFSET array
    add esi, (count-1)*TYPE array
    mov eax, [esi]
    
    mov esi, OFFSET array
    mov ebx, count
    dec ebx
    
L1:
    mov edx, [esi]            ; ÇöÀç °ª
    mov [esi+TYPE array], edx 
    add esi, TYPE array
    dec ebx
    jnz L1
    mov [array], eax
    
    invoke ExitProcess, 0
main ENDP
END main
