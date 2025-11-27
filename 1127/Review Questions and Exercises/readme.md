1. Which Direction flag setting causes index registers to move backward through memory
when executing string primitives?**df=1**
2. When a repeat prefix is used with STOSW, what value is added to or subtracted from the
index register?**2**
3. In what way is the CMPS instruction ambiguous?**뭔가의 결과를 주지는 않아서**
4. When the Direction flag is clear and SCASB has found a matching character, where does
EDI point?**스캔성공한 바로 다음**
5. When scanning an array for the first occurrence of a particular character, which repeat prefix would be best?**repne scasb**
6. What Direction flag setting is used in the Str_trim procedure from Section 9.3?**df=0**
7. Why does the Str_trim procedure from Section 9.3 use the JNE instruction?**같지 않으면 반복하기 위해서**
8. What happens in the Str_ucase procedure from Section 9.3 if the target string contains a
digit?**변화없음**
9. If the Str_length procedure from Section 9.3 used SCASB, which repeat prefix would be
most appropriate?**repne**
10. If the Str_length procedure from Section 9.3 used SCASB, how would it calculate and
return the string length?**다음이null이 될때까지 반복해서 나온 수치**
11. What is the maximum number of comparisons needed by the binary search algorithm when
an array contains 1,024 elements?**10**
12. In the FillArray procedure from the Binary Search example in Section 9.5, why must the
Direction flag be cleared by the CLD instruction?**DF=1이라면 메모리가 반대로 채워지기에 처음부터 0으로 맞추고 시작해야 착오가 없다**
13. In the BinarySearch procedure from Section 9.5, why could the statement at label L2 be
removed without affecting the outcome?**L1에 있는 cmp eax, last이 코드가 비교를 이미하고 있어서 굳이 L2는 없어도 작동한다**
14. In the BinarySearch procedure from Section 9.5, how might the statement at label L4 be
eliminated?**L4는 카운트 줄이는 용도라 L4가 있는 자리에 그냥 L1으로 점프하는 코드만 남겨도 된다**
9.9.2 Algorithm Workbench
1. Show an example of a base-index operand in 32-bit mode.**mov eax, [ebx + esi]**
2. Show an example of a base-index-displacement operand in 32-bit mode.**mov eax, [ebx + esi + 8]**
3. Suppose a two-dimensional array of doublewords has three logical rows and four logical
columns. Write an expression using ESI and EDI that addresses the third column in the second row. (Numbering for rows and columns starts at zero.)  
**lea edi, [esi + 24]**
4. Write instructions using CMPSW that compare two arrays of 16-bit values named sourcew
and targetw.  
**cld
lea esi, sourcew
lea edi, targetw
repe cmpsw**
5. Write instructions that use SCASW to scan for the 16-bit value 0100h in an array named
wordArray, and copy the offset of the matching member into the EAX register.
6. Write a sequence of instructions that use the Str_compare procedure to determine the larger
of two input strings and write it to the console window.
7. Show how to call the Str_trim procedure and remove all trailing "@" characters from a
string.
8. Show how to modify the Str_ucase procedure from the Irvine32 library so it changes all
characters to lower case.
9. Create a 64-bit version of the Str_trim procedure.
10. Show an example of a base-index operand in 64-bit mode.
11. Assuming that EBX contains a row index into a two-dimensional array of 32-bit integers
named myArray and EDI contains the index of a column, write a single statement that
moves the content of the given array element into the EAX register.
12. Assuming that RBX contains a row index into a two-dimensional array of 64-bit integers
named myArray and RDI contains the index of a column, write a single statement that
moves the content of the given array element into the RAX register.
