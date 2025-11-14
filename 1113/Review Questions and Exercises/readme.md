1. In the following code sequence, show the value of AL after each shift or rotate instruction
has executed:
mov al,0D4h
shr al,1 ; a.**6Ah**
mov al,0D4h
sar al,1 ; b.**EAh**
mov al,0D4h
sar al,4 ; c.**FDh**
mov al,0D4h
rol al,1 ; d.**A9h**
2. In the following code sequence, show the value of AL after each shift or rotate instruction
has executed:
mov al,0D4h
ror al,3 ; a.**9Ah**
mov al,0D4h
rol al,7 ; b.**6Ah**
stc
mov al,0D4h
rcl al,1 ; c.**A9h**
stc
mov al,0D4h
rcr al,3 ; d.**3Ah**
3. What will be the contents of AX and DX after the following operation?**DX: 0002h, AX: 2200h**
mov dx,0
mov ax,222h
mov cx,100h
mul cx
4. What will be the contents of AX after the following operation?**AX: 0306h**
mov ax,63h
mov bl,10h
div bl
5. What will be the contents of EAX and EDX after the following operation?**EAX: 00123400h, EDX: 00000000h**
mov eax,123400h
mov edx,0
6. What will be the contents of AX and DX after the following operation?**AX: 0500h DX: 000h**
mov ax,4000h
mov dx,500h
mov bx,10h
div bx
7. What will be the contents of BX after the following instructions execute?**0066h**
mov bx,5
stc
mov ax,60h
adc bx,ax
8. Describe the output when the following code executes in 64-bit mode:**RAX: 1080000000333000h, RDX: 20h**
.data
dividend_hi QWORD 00000108h
dividend_lo QWORD 33300020h
divisor QWORD 00000100h
.code
mov rdx,dividend_hi
mov rax,dividend_lo
div divisor
9. The following program is supposed to subtract val2 from val1. Find and correct all logic
errors (CLC clears the Carry flag):
.data
val1 QWORD 20403004362047A1h
val2 QWORD 055210304A2630B2h
result QWORD 0
.code
mov cx,8 ; loop counter
mov esi, OFFSET val1 ; set index to start
mov edi, OFFSET val2
mov ebx, OFFSET result
clc ; clear Carry flag
top:
mov al,BYTE PTR[esi] ; get first number
sbb al,BYTE PTR[edi] ; subtract second
mov BYTE PTR[ebx],al ; store the result
dec esi
dec edi
dec ebx
loop top
10. What will be the hexadecimal contents of RAX after the following instructions execute in
64-bit mode?**RAX: 0004080C10140000h**
.data
multiplicand QWORD 0001020304050000h
.code
imul rax,multiplicand, 4
1. Write a sequence of shift instructions that cause AX to be sign-extended into EAX. In other words,
the sign bit of AX is copied into the upper 16 bits of EAX. Do not use the CWD instruction.**movzx eax, ax shl eax, 16 sar eax, 16**
2. Suppose the instruction set contained no rotate instructions. Show how you would use
SHR and a conditional jump instruction to rotate the contents of the AL register 1 bit to
the right.**shr al,1 jnc nowrap or al, 80h nowrap:**
3. Write a logical shift instruction that multiplies the contents of EAX by 16.**shl eax, 4**
4. Write a logical shift instruction that divides EBX by 4.**shr ebx, 2**
5. Write a single rotate instruction that exchanges the high and low halves of the DL register.**rol dl, 4**
6. Write a single SHLD instruction that shifts the highest bit of the AX register into the lowest
bit position of DX and shifts DX one bit to the left.**shld dx, ax, 1**
7. Write a sequence of instructions that shift three memory bytes to the right by 1 bit position.
Use the following test data:**clc rcr BYTE PTR [byteArray+2], 1 rcr BYTE PTR [byteArray+1], 1 rcr BYTE PTR [byteArray], 1**
byteArray BYTE 81h,20h,33h
8. Write a sequence of instructions that shift three memory words to the left by 1 bit position.
Use the following test data:**clc rcl WORD PTR [wordArray], 1 rcl WORD PTR [wordArray+2], 1 rcl WORD PTR [wordArray+4], 1**
wordArray WORD 810Dh, 0C064h,93ABh
9. Write instructions that multiply 5 by 3 and store the result in a 16-bit variable val1.**mov ax, 5 imul ax, 3 mov [val1], ax**
10. Write instructions that divide 276 by 10 and store the result in a 16-bit variable val1.**mov ax, 276  mov bl, 10 div bl movzx ax, al mov [val1], ax**
11. Implement the following C++ expression in assembly language, using 32-bit unsigned
operands:**mov eax, DWORD PTR [val2]  
mul DWORD PTR [val3]  
mov ecx, DWORD PTR [val4]  
sub ecx, 3  
div ecx  
mov DWORD PTR [val1], eax**
val1 = (val2 * val3) / (val4 - 3)
12. Implement the following C++ expression in assembly language, using 32-bit signed
operands:
val1 = (val2 / val3) * (val1 + val2)
**mov eax, DWORD PTR [val2]  
 cdq  
idiv DWORD PTR [val3]   
mov ebx, DWORD PTR [val1]   
add ebx, DWORD PTR [val2]   
imul eax, ebx mov DWORD PTR [val1], eax**


13. Write a procedure that displays an unsigned 8-bit binary value in decimal format. Pass the
binary value in AL. The input range is limited to 0 to 99, decimal. The only procedure you
can call from the book’s link library is WriteChar. The procedure should contain approximately eight instructions. Here is a sample call:
mov al,65 ; range limit: 0 to 99
call showDecimal8
**xor ah, ah
mov bl, 10
div bl
add al, '0'
call WriteChar
mov al, ah
add al, '0'
call WriteChar**
14. Challenge: Suppose AX contains 0072h and the Auxiliary Carry flag is set as a result of
adding two unknown ASCII decimal digits. Use the Intel 64 and IA-32 Instruction Set Reference to determine what output the AAA instruction would produce. Explain your answer.**AF가 참이어서 al에 06h ah에 더한 후 각각 and 0Fh한다 그러면 0178이 되고 and해서 0108h가 된다. 답: 0108h**
15. Challenge: Using only SUB, MOV, and AND instructions, show how to calculate x = n mod y,
assuming that you are given the values of n and y. You can assume that n is any 32-bit
unsigned integer, and y is a power of 2.**mov eax, [n] mov ecx, [y] sub ecx, 1 and eax, ecx mov [x], eax**
16. Challenge: Using only SAR, ADD, and XOR instructions (but no conditional jumps), write
code that calculates the absolute value of the signed integer in the EAX register. Hints: A
number can be negated by adding 1 to it and then forming its one’s complement. Also, if
you XOR an integer with all 1s, its 1s are reversed. On the other hand, if you XOR an integer with all zeros, the integer is unchanged.
mov ebx,10h
div ebx
**mov edx, eax  
sar edx, 31  
add eax, edx  
xor eax, edx**
