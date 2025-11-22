INCLUDE Irvine32.inc
FindLargest PROTO, Array:PTR SDWORD, leng:DWORD
.data
    array1 SDWORD 1, 0, -1
    array2 SDWORD -2,-1,0,1
    array3 SDWORD -10,20,50,80,110
.code
FindLargest PROC USES ebx ecx edx esi,
    Array:PTR SDWORD,
    leng:DWORD
    mov esi, Array
    mov ecx, leng
    mov eax, [esi]
    add esi, 4
    dec ecx
    L1:
    cmp ecx, 0
    je L2

    mov ebx, [esi]
    cmp ebx, eax
    jle skip
    mov eax, ebx

skip:
    add esi, 4
    dec ecx
    jmp L1

L2:
    ret
FindLargest ENDP
main PROC
    INVOKE FindLargest, ADDR array1, LENGTHOF array1
    call WriteInt
    call Crlf

    INVOKE FindLargest, ADDR array2, LENGTHOF array2
    call WriteInt
    call Crlf

    INVOKE FindLargest, ADDR array3, LENGTHOF array3
    call WriteInt
    call Crlf

    exit
main ENDP
END main