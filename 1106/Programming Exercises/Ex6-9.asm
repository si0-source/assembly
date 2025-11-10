INCLUDE Irvine32.inc

.data
v BYTE "Valid",0
i BYTE "Invalid pos ",0

p1 BYTE 5,2,4,1,3
p2 BYTE 4,3,5,3,4
p3 BYTE 5,2,4,1,9
p4 BYTE 9,5,8,4,6

mn BYTE 5,2,4,1,3
mx BYTE 9,5,8,4,6

.code
chk PROC USES ebx ecx edx esi, x:PTR BYTE
mov esi,x
mov eax,1
L:
mov bl,[esi]
mov cl,[mn+eax-1]
cmp bl,cl
jb bad
mov cl,[mx+eax-1]
cmp bl,cl
ja bad
inc eax
inc esi
cmp eax,6
jl L
xor eax,eax
ret
bad:
ret
chk ENDP

main PROC
INVOKE chk, OFFSET p1
test eax,eax
jnz e1
mov edx,OFFSET v
call WriteString
call Crlf
jmp n1
e1:
mov edx,OFFSET i
call WriteString
mov eax,eax
call WriteDec
call Crlf
n1:

INVOKE chk, OFFSET p2
test eax,eax
jnz e2
mov edx,OFFSET v
call WriteString
call Crlf
jmp n2
e2:
mov edx,OFFSET i
call WriteString
mov eax,eax
call WriteDec
call Crlf
n2:

INVOKE chk, OFFSET p3
test eax,eax
jnz e3
mov edx,OFFSET v
call WriteString
call Crlf
jmp n3
e3:
mov edx,OFFSET i
call WriteString
mov eax,eax
call WriteDec
call Crlf
n3:

INVOKE chk, OFFSET p4
test eax,eax
jnz e4
mov edx,OFFSET v
call WriteString
call Crlf
jmp done
e4:
mov edx,OFFSET i
call WriteString
mov eax,eax
call WriteDec
call Crlf

done:
invoke ExitProcess,0
main ENDP
END main
