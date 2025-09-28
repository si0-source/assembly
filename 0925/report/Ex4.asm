.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.code
main proc
	HELLO EQU "Hello"
	WORLD EQU "World"

	str1 BYTE HELLO, 0
	str2 BYTE WORLD, 0

	invoke ExitProcess,0
main endp
end main