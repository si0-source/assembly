1. Converting from Big Endian to Little Endian
Write a program that uses the variables below and MOV instructions to copy the value from
bigEndian to littleEndian, reversing the order of the bytes. The number’s 32-bit value is understood to be 12345678 hexadecimal.
.data
bigEndian BYTE 12h,34h,56h,78h
littleEndian DWORD?
2. Exchanging Pairs of Array Values
Write a program with a loop and indexed addressing that exchanges every pair of values in an
array with an even number of elements. Therefore, item i will exchange with item i+1, and item
i+2 will exchange with item i+3, and so on.
3. Summing the Gaps between Array Values
Write a program with a loop and indexed addressing that calculates the sum of all the gaps
between successive array elements. The array elements are doublewords, sequenced in nondecreasing order. So, for example, the array {0, 2, 5, 9, 10} has gaps of 2, 3, 4, and 1, whose sum
equals 10.
4. Copying a Word Array to a DoubleWord array
Write a program that uses a loop to copy all the elements from an unsigned Word (16-bit) array
into an unsigned doubleword (32-bit) array.
5. Fibonacci Numbers
Write a program that uses a loop to calculate the first seven values of the Fibonacci number sequence,
described by the following formula: Fib(1) = 1, Fib(2) = 1, Fib(n) = Fib(n – 1) + Fib(n – 2).
6. Reverse an Array
Use a loop with indirect or indexed addressing to reverse the elements of an integer array in
place. Do not copy the elements to any other array. Use the SIZEOF, TYPE, and LENGTHOF
operators to make the program as flexible as possible if the array size and type should be
changed in the future.
7. Copy a String in Reverse Order
Write a program with a loop and indirect addressing that copies a string from source to target,
reversing the character order in the process. Use the following variables:
source BYTE "This is the source string",0
target BYTE SIZEOF source DUP('#')
8. Shifting the Elements in an Array
Using a loop and indexed addressing, write code that rotates the members of a 32-bit integer
array forward one position. The value at the end of the array must wrap around to the first position. For example, the array [10,20,30,40] would be transformed into [40,10,20,30].
