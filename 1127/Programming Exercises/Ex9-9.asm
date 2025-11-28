;--------------------------------------------------------------
; BinarySearch
; Searches an array of signed integers for a single value.
; Receives: Pointer to array, array size, search value.
; Returns: If a match is found, EAX = the array position of the
; matching element; otherwise, EAX = -1.
;--------------------------------------------------------------
BinarySearch PROC USES ebx edx esi edi,
pArray:PTR DWORD,
Count:DWORD,
searchVal:DWORD
LOCAL first:DWORD,
last:DWORD,
mid:DWORD

mov first,0
mov eax,Count
dec eax
mov last,eax
mov edi,searchVal
mov ebx,pArray

L1:
mov eax,first
cmp eax,last
jg L5

mov eax,last
add eax,first
shr eax,1
mov mid,eax

mov esi,mid
shl esi,2
mov edx,[ebx+esi]

cmp edx,edi
jge L2

mov eax,mid
inc eax
mov first,eax
jmp L4

L2: cmp edx,edi
jle L3

mov eax,mid
dec eax
mov last,eax
jmp L4

L3: mov eax,mid
jmp L9

L4: jmp L1

L5: mov eax,-1

L9: ret

BinarySearch ENDP
