.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.code
main proc
	mov eax, 1
	mov ebx, 2
	mov ecx, 3
	mov edx, 4

	add eax, ebx
	add ecx, edx
	sub eax, ecx	

	invoke ExitProcess,0
main endp
end main