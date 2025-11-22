1. Which statements belong in a procedure’s epilogue when the procedure has stack parameters and local variables?**mov esp, ebp  pop ebp  ret**
2. When a C function returns a 32-bit integer, where is the return value stored?**eax**
3. How does a program using the STDCALL calling convention clean up the stack after a procedure call?**ret 4**
4. How is the LEA instruction more powerful than the OFFSET operator?**offset은 그냥 주소기능, lea는 연산도 넣을 수 있는 기능**
5. In the C++ example shown in Section 8.2.3, how much stack space is used by a variable of
type int?**4**
6. What advantages might the C calling convention have over the STDCALL calling
convention?**stdcall보다 유연하게 호출**
7. (True/False): When using the PROC directive, all parameters must be listed on the same
line.**False**
8. (True/False): If you pass a variable containing the offset of an array of bytes to a procedure
that expects a pointer to an array of words, the assembler will flag this as an error.**False**
9. (True/False): If you pass an immediate value to a procedure that expects a reference parameter, you can generate a general-protection fault.**True**

1. Here is a calling sequence for a procedure named AddThree that adds three doublewords
(assume that the STDCALL calling convention is used):
push 10h
push 20h
push 30h
call AddThree
Draw a picture of the procedure’s stack frame immediately after EBP has been pushed on
the runtime stack.
**10h ebp+16
20h ebp+12
30h ebp+8
return adress ebp esp**

2. Create a procedure named AddThree that receives three integer parameters and calculates
and returns their sum in the EAX register.
**AddThree PROC STDCALL first:DWORD, second:DWORD, third:DWORD
    mov eax, first  
    add eax, second  
    add eax, third  
    ret 12  
AddThree ENDP**
3. Declare a local variable named pArray that is a pointer to an array of doublewords.
**LOCAL pArray:DWORD**
4. Declare a local variable named buffer that is an array of 20 bytes
**LOCAL buffer[20]:BYTE**
5. Declare a local variable named pwArray that points to a 16-bit unsigned integer.
**LOCAL pwArray:WORD**
6. Declare a local variable named myByte that holds an 8-bit signed integer.
**LOCAL myByte:SBYTE**
7. Declare a local variable named myArray that is an array of 20 doublewords.
**LOCAL myArray[20]:DWORD**
8. Create a procedure named SetColor that receives two stack parameters: forecolor and backcolor, and calls the SetTextColor procedure from the Irvine32 library.
**SetColor PROC STDCALL forecolor:DWORD, backcolor:DWORD  
    mov eax, forecolor  
    mov ebx, backcolor  
    call SetTextColor  
    ret 8  
SetColor ENDP**
9. Create a procedure named WriteColorChar that receives three stack parameters: char,
forecolor, and backcolor. It displays a single character, using the color attributes specified in
forecolor and backcolor.
**WriteColorChar PROC STDCALL char:BYTE, forecolor:DWORD, backcolor:DWORD  
    mov eax, forecolor  
    mov ebx, backcolor  
    call SetTextColor  
    mov al, char  
    call WriteChar  
    ret 12  
WriteColorChar ENDP**
10. Write a procedure named DumpMemory that encapsulates the DumpMem procedure in the
Irvine32 library. Use declared parameters and the USES directive. The following is an
example of how it should be called: INVOKE DumpMemory, OFFSET array, LENGTHOF
array, TYPE array.
**DumpMemory PROC USES esi edi, offset:PTR BYTE, leng:DWORD, type:DWORD  
INVOKE DumpMem, offset, leng, type  
ret 12  
DumpMemory ENDP**
11. Declare a procedure named MultArray that receives two pointers to arrays of doublewords,
and a third parameter indicating the number of array elements. Also, create a PROTO declaration for this procedure.
**MultArray PROTO, adress1:PTR DWORD, adress2:PTR DWORD, type:DWORD  
MultArray PROC, adress1:PTR DWORD, adress2:PTR DWORD, type:DWORD  
ret  
MultArray ENDP**
