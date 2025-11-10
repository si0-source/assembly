INCLUDE Irvine32.inc
.data
m BYTE "1.AND 2.OR 3.NOT 4.XOR 5.Exit: ",0
x BYTE "x=",0
y BYTE "y=",0
r BYTE "R=",0
.code
main PROC
mov edx,OFFSET m
call WriteString
call ReadInt
mov ecx,eax
mov edx,OFFSET x
call WriteString
call ReadHex
mov ebx,eax
mov edx,OFFSET y
call WriteString
call ReadHex
mov edx,OFFSET r
call WriteString
mov eax,ebx
mov edx,OFFSET r
cmp ecx,1
sete cl
and eax,ebx
cmovnz eax,eax
cmp ecx,2
sete cl
or eax,ebx
cmovnz eax,eax
cmp ecx,3
sete cl
not eax
cmovnz eax,eax
cmp ecx,4
sete cl
xor eax,ebx
cmovnz eax,eax
call WriteHex
invoke ExitProcess,0
main ENDP
END main
