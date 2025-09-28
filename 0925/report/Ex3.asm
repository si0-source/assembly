.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
	B BYTE 255
	SB SBYTE -128
	W WORD 65535
	SW SWORD -32768
	DW DWORD 4294967295
	SDW SDWORD -2147483647
	FW FWORD 12345678
	QW QWORD 12345678
	TB TBYTE 12345678
	R4 REAL4 3.14
	R8 REAL8 3.141
	R10 REAL10 3.1415
.code
main proc
	

	invoke ExitProcess,0
main endp
end main