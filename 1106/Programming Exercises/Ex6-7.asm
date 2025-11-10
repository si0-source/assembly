INCLUDE Irvine32.inc

.data
msgWhite BYTE "white",0
msgBlue  BYTE "blue",0
msgGreen BYTE "green",0

.code
main PROC
    call Randomize
    mov ecx, 20

nextLine:
    mov eax, 10
    call RandomRange
    cmp eax, 3
    je doBlue
    jl doWhite
    jmp doGreen

doWhite:
    mov eax, white + (black * 16)
    call SetTextColor
    mov edx, OFFSET msgWhite
    call WriteString
    call Crlf
    loop nextLine
    jmp done

doBlue:
    mov eax, blue + (black * 16)
    call SetTextColor
    mov edx, OFFSET msgBlue
    call WriteString
    call Crlf
    loop nextLine
    jmp done

doGreen:
    mov eax, green + (black * 16)
    call SetTextColor
    mov edx, OFFSET msgGreen
    call WriteString
    call Crlf
    loop nextLine

done:
    mov eax, lightGray + (black * 16)
    call SetTextColor
    invoke ExitProcess, 0
main ENDP
END main
