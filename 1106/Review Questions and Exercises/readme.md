1. What will be the value of BX after the following instructions execute?**006Bh**
mov bx,0FFFFh
and bx,6Bh
2. What will be the value of BX after the following instructions execute?**0092h**
mov bx,91BAh
and bx,92h
3. What will be the value of BX after the following instructions execute?**64BBh**
mov bx,0649Bh
or bx,3Ah
4. What will be the value of BX after the following instructions execute?**A857h**
mov bx,029D6h
xor bx,8181h
5. What will be the value of EBX after the following instructions execute?**BFAFF69Fh**
mov ebx,0AFAF649Bh
or ebx,3A219604h
6. What will be the value of RBX after the following instructions execute?**FFFFFFFF50509B64h**
mov rbx,0AFAF649Bh
xor rbx,0FFFFFFFFh
7. In the following instruction sequence, show the resulting value of AL where indicated, in binary:
mov al,01101111b
and al,00101101b ; a.**00101101b**
mov al,6Dh
and al,4Ah ; b.**01001000b**
mov al,00001111b
or al,61h ; c.**01101111b**
mov al,94h
xor al,37h ; d.**10100011b**
8. In the following instruction sequence, show the resulting value of AL where indicated, in
hexadecimal:
mov al,7Ah
not al ; a.
mov al,3Dh
and al,74h ; b.
mov al,9Bh
or al,35h ; c.
mov al,72h
xor al,0DCh ; d.
9. In the following instruction sequence, show the values of the Carry, Zero, and Sign flags
where indicated:
mov al,00001111b
test al,00000010b ; a. CF= ZF= SF=
mov al,00000110b
cmp al,00000101b ; b. CF= ZF= SF=
mov al,00000101b
cmp al,00000111b ; c. CF= ZF= SF=
10. Which conditional jump instruction executes a branch based on the contents of ECX?
11. How are JA and JNBE affected by the Zero and Carry flags?
12. What will be the final value in EDX after this code executes?
 mov edx,1
 mov eax,7FFFh
 cmp eax,8000h
 jl L1
 mov edx,0

L1:13. What will be the final value in EDX after this code executes?
 mov edx,1
 mov eax,7FFFh
 cmp eax,8000h
 jb L1
 mov edx,0
L1:
14. What will be the final value in EDX after this code executes?
 mov edx,1
 mov eax,7FFFh
 cmp eax,0FFFF8000h
 jl L2
 mov edx,0
L2:
15. (True/False): The following code will jump to the label named Target.
mov eax,-30
cmp eax,-50
jg Target
16. (True/False): The following code will jump to the label named Target.
mov eax,-42
cmp eax,26
ja Target
17. What will be the value of RBX after the following instructions execute?
mov rbx,0FFFFFFFFFFFFFFFFh
and rbx,80h
18. What will be the value of RBX after the following instructions execute?
mov rbx,0FFFFFFFFFFFFFFFFh
and rbx,808080h
19. What will be the value of RBX after the following instructions execute?
mov rbx,0FFFFFFFFFFFFFFFFh
and rbx,80808080h
1. Write a single instruction that converts an ASCII digit in AL to its corresponding binary
value. If AL already contains a binary value (00h to 09h), leave it unchanged.
2. Write instructions that calculate the parity of a 32-bit memory operand. Hint: Use the formula presented earlier in this section: B0 XOR B1 XOR B2 XOR B3.
3. Given two bit-mapped sets named SetX and SetY, write a sequence of instructions that generate a bit string in EAX that represents members in SetX that are not members of SetY.
4. Write instructions that jump to label L1 when the unsigned integer in DX is less than or
equal to the integer in CX.
5. Write instructions that jump to label L2 when the signed integer in AX is greater than the
integer in CX.
6. Write instructions that first clear bits 0 and 1 in AL. Then, if the destination operand is equal
to zero, the code should jump to label L3. Otherwise, it should jump to label L4.
7. Implement the following pseudocode in assembly language. Use short-circuit evaluation
and assume that val1 and X are 32-bit variables.
if( val1 > ecx ) AND ( ecx > edx )
 X = 1
else
 X = 2;
8. Implement the following pseudocode in assembly language. Use short-circuit evaluation
and assume that X is a 32-bit variable.
if( ebx > ecx ) OR ( ebx > val1 )
 X = 1
else
 X = 2
9. Implement the following pseudocode in assembly language. Use short-circuit evaluation
and assume that X is a 32-bit variable.
if( ebx > ecx AND ebx > edx) OR ( edx > eax )
 X = 1
else
 X = 2
10. Implement the following pseudocode in assembly language. Use short-circuit evaluation
and assume that A, B, and N are 32-bit signed integers.
while N > 0
 if N != 3 AND (N < A OR N > B)
 N = N – 2
 else
 N = N – 1
end whle
