1. Write a sequence of statements that use only PUSH and POP instructions to exchange the
 values in the EAX and EBX registers (or RAX and RBX in 64-bit mode). **push EAX push EBX pop EAX pop EBX**
2. Suppose you wanted a subroutine to return to an address that was 3 bytes higher in memory
 than the return address currently on the stack. Write a sequence of instructions that would be
 inserted just before the subroutine’s RET instruction that accomplish this task.**add dword ptr [esp], 3**
 3. Functions in high-level languages often declare local variables just below the return address
 on the stack. Write an instruction that you could put at the beginning of an assembly language
 subroutine that would reserve space for two integer doubleword variables. Then, assign the
 values 1000h and 2000h to the two local variables.
**.data
n1 DWORD 1000h
n2 DWORD 2000h
.code
mov eax, n1
mov ebx, n2**
 4. Write a sequence of statements using indexed addressing that copies an element in a double
word array to the previous position in the same array.
**mov esi, offset array
mov eax, [esi]
sub esi, 4 
mov [esi], eax** 
 5. Write a sequence of statements that display a subroutine’s return address. Be sure that what
ever modifications you make to the stack do not prevent the subroutine from returning to its
 caller.
**mov eax, [esp]
ret**
