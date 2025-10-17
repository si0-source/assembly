1. What will be the value in EDX after each of the lines marked (a) and (b) execute?
.data
one WORD 8002h
two WORD 4321h
.code
mov edx,21348041h
movsx edx,one ; (a)
movsx edx,two ; (b)
2. What will be the value in EAX after the following lines execute?
mov eax,1002FFFFh
inc ax
3. What will be the value in EAX after the following lines execute?
mov eax,30020000h
dec ax
4. What will be the value in EAX after the following lines execute?
mov eax,1002FFFFh
neg ax
5. What will be the value of the Parity flag after the following lines execute?
mov al,1
add al,3
6. What will be the value of EAX and the Sign flag after the following lines execute?
mov eax,5
sub eax,6
7. In the following code, the value in AL is intended to be a signed byte. Explain how the
Overflow flag helps, or does not help you, to determine whether the final value in AL falls
within a valid signed range.
mov al,-1
add al,130
8. What value will RAX contain after the following instruction executes?
mov rax,44445555h
9. What value will RAX contain after the following instructions execute?
.data
dwordVal DWORD 84326732h
.code
mov rax,0FFFFFFFF00000000h
mov rax,dwordVal
10. What value will EAX contain after the following instructions execute?
.data
dVal DWORD 12345678h
.code
mov ax,3
mov WORD PTR dVal+2,ax
mov eax,dVal
11. What will EAX contain after the following instructions execute?
.data
.dVal DWORD ?
.code
mov dVal,12345678h
mov ax,WORD PTR dVal+2
add ax,3
mov WORD PTR dVal,ax
mov eax,dVal
12. (Yes/No): Is it possible to set the Overflow flag if you add a positive integer to a negative
integer?
13. (Yes/No): Will the Overflow flag be set if you add a negative integer to a negative integer
and produce a positive result?
14. (Yes/No): Is it possible for the NEG instruction to set the Overflow flag?
15. (Yes/No): Is it possible for both the Sign and Zero flags to be set at the same time?
Use the following variable definitions for Questions 16–19:
.data
var1 SBYTE -4,-2,3,1
var2 WORD 1000h,2000h,3000h,4000h
var3 SWORD -16,-42
var4 DWORD 1,2,3,4,5
16. For each of the following statements, state whether or not the instruction is valid:
a. mov ax,var1?
b. mov ax,var2
c. mov eax,var3
d. mov var2,var3
e. movzx ax,var2
f. movzx var2,al
g. mov ds,ax
h. mov ds,1000h
17. What will be the hexadecimal value of the destination operand after each of the following
instructions execute in sequence?
mov al,var1 ; a.
mov ah,[var1+3] ; b.
18. What will be the value of the destination operand after each of the following instructions
execute in sequence?
mov ax,var2 ; a.
mov ax,[var2+4] ; b.
mov ax,var3 ; c.
mov ax,[var3-2] ; d.
19. What will be the value of the destination operand after each of the following instructions
execute in sequence?
mov edx,var4 ; a.
movzx edx,var2 ; b.
mov edx,[var4+4] ; c.
movsx edx,var1 ; d.
1. Write a sequence of MOV instructions that will exchange the upper and lower words in a
doubleword variable named three.
2. Using the XCHG instruction no more than three times, reorder the values in four 8-bit registers from the order A,B,C,D to B,C,D,A.
3. Transmitted messages often include a parity bit whose value is combined with a data byte to
produce an even number of 1 bits. Suppose a message byte in the AL register contains
01110101. Show how you could use the Parity flag combined with an arithmetic instruction
to determine if this message byte has even or odd parity.
4. Write code using byte operands that adds two negative integers and causes the Overflow
flag to be set.
5. Write a sequence of two instructions that use addition to set the Zero and Carry flags at the
same time.
6. Write a sequence of two instructions that set the Carry flag using subtraction.
7. Implement the following arithmetic expression in assembly language: EAX = –val2 + 7 –
val3 + val1. Assume that val1, val2, and val3 are 32-bit integer variables.
8. Write a loop that iterates through a doubleword array and calculates the sum of its elements
using a scale factor with indexed addressing.
9. Implement the following expression in assembly language: AX = (val2 + BX) –val4.
Assume that val2 and val4 are 16-bit integer variables.
10. Write a sequence of two instructions that set both the Carry and Overflow flags at the same time.
11. Write a sequence of instructions showing how the Zero flag could be used to indicate
unsigned overflow after executing INC and DEC instructions.
Use the following data definitions for Questions 12–18:
.data
myBytes BYTE 10h,20h,30h,40h
myWords WORD 3 DUP(?),2000h
myString BYTE "ABCDE"
12. Insert a directive in the given data that aligns myBytes to an even-numbered address.
13. What will be the value of EAX after each of the following instructions execute?
mov eax,TYPE myBytes ; a.
mov eax,LENGTHOF myBytes ; b.
mov eax,SIZEOF myBytes ; c.
mov eax,TYPE myWords ; d.
mov eax,LENGTHOF myWords ; e.
mov eax,SIZEOF myWords ; f.
mov eax,SIZEOF myString ; g.
14. Write a single instruction that moves the first two bytes in myBytes to the DX register. The
resulting value will be 2010h.
15. Write an instruction that moves the second byte in myWords to the AL register.
16. Write an instruction that moves all four bytes in myBytes to the EAX register.
17. Insert a LABEL directive in the given data that permits myWords to be moved directly to a
32-bit register.
18. Insert a LABEL directive in the given data that permits myBytes to be moved directly to a
16-bit register
