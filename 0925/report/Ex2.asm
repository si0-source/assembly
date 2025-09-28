.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.code
main proc
	mon EQU 1	
	tue EQU 2
	wed EQU 3
	thu EQU 4
	fri EQU 5
	sat EQU 6
	sun EQU 7

	day WORD mon, tue, wed, thu, fri, sat, sun

	invoke ExitProcess,0
main endp
end main