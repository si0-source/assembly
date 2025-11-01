 1. Which instruction pushes all of the 32-bit general-purpose registers on the stack?**PUSHAD**
 2. Which instruction pushes the 32-bit EFLAGS register on the stack?**PUSHFD**
 3. Which instruction pops the stack into the EFLAGS register?**POPFD**
 4. Challenge: Another assembler (called NASM) permits the PUSH instruction to list multiple
 specific registers. Why might this approach be better than the PUSHAD instruction in
 MASM? Here is a NASM example:
 PUSH EAX EBX ECX**PUSHAD는 전부 저장이라 쓸 필요가 없는 레지스터까지 저장해야하지만 여러개를 선택할 수 있으면 더 효율적이다**
 5. Challenge: Suppose there were no PUSH instruction. Write a sequence of two other instruc
tions that would accomplish the same as push eax.**sub esp, 4  
mov [esp], eax**
 6. (True/False): The RET instruction pops the top of the stack into the instruction pointer.**True**
 7. (True/False): Nested procedure calls are not permitted by the Microsoft assembler unless
 the NESTED operator is used in the procedure definition.**False**
 8. (True/False): In protected mode, each procedure call uses a minimum of 4 bytes of stack
 space.**True**
 9. (True/False): The ESI and EDI registers cannot be used when passing 32-bit parameters to
 procedures.**False**
 10. (True/False): The ArraySum procedure (Section 5.2.5) receives a pointer to any array of
 doublewords.**True**
 11. (True/False): The USES operator lets you name all registers that are modified within a pro
cedure.**True**
 12. (True/False): The USES operator only generates PUSH instructions, so you must code POP
 instructions yourself.**False**
 13. (True/False): The register list in the USES directive must use commas to separate the regis
ter names.**False**
 14. Which statement(s) in the ArraySum procedure (Section 5.2.5) would have to be modified so
 it could accumulate an array of 16-bit words? Create such a version of ArraySum and test it.
 **.**  
 ArraySum PROC  
  push esi  
  push ecx  
  mov eax, 0  
 L1:  
  add ax, [esi]  
  add esi, TYPE WORD  
  loop L1  
  pop ecx  
  pop esi  
  ret  
ArraySum ENDP
**.**  
 15. What will be the final value in EAX after these instructions execute?
 push 5
 push 6
 pop  eax
 pop  eax
 16. Which statement is true about what will happen when the example code runs?
 1: main PROC
 2: 
push 10
 3:
 4:
 5:
 6:
 push 20
 call Ex2Sub
 pop  eax
 INVOKE ExitProcess,0
 7: main ENDP
 8:
 9: Ex2Sub PROC
 10:
 pop eax
 11:
 ret
 12: Ex2Sub ENDP
 a. EAX will equal 10 on line 6
 b. The program will halt with a runtime error on Line 10
 c. EAX will equal 20 on line 6
 d. The program will halt with a runtime error on Line 11 
17. Which statement is true about what will happen when the example code runs?
 1: main PROC
 2:
 mov  eax,30
 3:
 4:
 5:
 6:
 push eax
 push 40
 call Ex3Sub
 INVOKE ExitProcess,0
 7: main ENDP
 8:
 9: Ex3Sub PROC
 10:
 pusha
 11:
 12: 13:
 ret
 14: Ex3Sub ENDP
 a. EAX will equal 40 on line 6
 b. The program will halt with a runtime error on Line 6
 c. EAX will equal 30 on line 6 
d. The program will halt with a runtime error on Line 13
 18. Which statement is true about what will happen when the example code runs?
 1: main PROC
 2:
 mov eax,40
 3:
 4:
 push offset Here
 jmp  Ex4Sub
 5:    Here:
 6:
 mov eax,30
 7:
 INVOKE ExitProcess,0
 8: main ENDP
 9:
 10: Ex4Sub PROC
 11:
 ret
 12: Ex4Sub ENDP
 a. EAX will equal 30 on line 7
 b. The program will halt with a runtime error on Line 4
 c. EAX will equal 30 on line 6 
d. The program will halt with a runtime error on Line 11
 19. Which statement is true about what will happen when the example code runs?
 1: main PROC
 2:
 mov edx,0
 3:
 4:
 5:
 6:
 mov eax,40
 push eax
 call Ex5Sub
 INVOKE ExitProcess,0
 7: main ENDP
 8:
 9: Ex5Sub PROC
 10:
 pop  eax
 11:
 12:
 13:
 pop  edx
 push eax
 ret
 14: Ex5Sub ENDP
 a. EDX will equal 40 on line 6 
 b. The program will halt with a runtime error on Line 13
 c. EDX will equal 0 on line 6 
 d. The program will halt with a runtime error on Line 11
 20. What values will be written to the array when the following code executes?
 .data
 array DWORD 4 DUP(0)
 .code
 main PROC
 mov eax,10
 mov  esi,0
 call proc_1
 add  esi,4
 add  eax,10
 mov  array[esi],eax
 INVOKE ExitProcess,0
 main ENDP
 proc_1 PROC
 call proc_2
 add  esi,4
 add  eax,10
 mov  array[esi],eax
 ret
 proc_1 ENDP
 proc_2 PROC
 call proc_3
 add  esi,4
 add  eax,10
 mov  array[esi],eax
 ret
 proc_2 ENDP
 proc_3 PROC
 mov  array[esi],eax
 ret
 proc_3 ENDP

 mov eax,80
 popa
