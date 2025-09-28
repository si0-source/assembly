.data<br>
firstval QWORD 20002000h<br>
secondval QWORD 11111111h<br>
thirdval QWORD 22222222h<br>
sum QWORD 0<br>
.code<br>
main PROC<br>
mov eax,firstval <br>
add eax,secondval<br>
add eax,thirdval<br>
mov sum,eax<br>
로 수정했지만 해당 메세지가 나오고 instruction operands must be the same size<br>
오류가 나서 수정해볼려 했지만 rax같은 방식으로 수정할려했지만 여러가지 바뀌어야하는게 너무 많은 거 같아서 포기<br>
; AddVariables.asm - Chapter 3 example<br>
<br>
.386<br>
.model flat,stdcall<br>
.stack 4096<br>
ExitProcess PROTO, dwExitCode:DWORD<br>
<br>
.data<br>
firstval QWORD 20002000h<br>
secondval QWORD 11111111h<br>
thirdval QWORD 22222222h<br>
sum QWORD 0<br>
<br>
.code<br>
main PROC<br>
mov eax, DWORD PTR firstval<br>
add eax, DWORD PTR secondval<br>
add eax, DWORD PTR thirdval<br>
mov DWORD PTR sum, eax<br>
<br>
mov eax, DWORD PTR firstval+4<br>
add eax, DWORD PTR secondval+4<br>
add eax, DWORD PTR thirdval+4<br>
mov DWORD PTR sum+4, eax<br>
<br>
INVOKE ExitProcess,0<br>
main ENDP<br>
END main<br>
