INCLUDE Irvine32.inc

.data
msg BYTE "This is a plain text message.",0
key BYTE "ABXmv#7",0
encrypted BYTE SIZEOF msg DUP(0)
decrypted BYTE SIZEOF msg DUP(0)
msg1 BYTE "plaintext:  ",0
msg2 BYTE "encrypt: ",0
msg3 BYTE "decrypt: ",0
.code
main PROC
    mov edx, OFFSET msg1
    call WriteString
    mov edx, OFFSET msg
    call WriteString
    call Crlf

    lea esi, msg
    lea edi, encrypted
    lea ebx, key
    mov ecx, LENGTHOF msg - 1
    xor edx, edx

EncryptLoop:
    mov al, [esi]
    cmp al, 0
    je showEncrypt
    mov dl, [ebx]
    xor al, dl
    mov [edi], al
    inc esi
    inc edi
    inc ebx
    cmp BYTE PTR [ebx], 0
    jne skipReset
    lea ebx, key
skipReset:
    loop EncryptLoop

showEncrypt:
    mov edx, OFFSET msg2
    call WriteString
    mov edx, OFFSET encrypted
    call WriteString
    call Crlf

    lea esi, encrypted
    lea edi, decrypted
    lea ebx, key
    mov ecx, LENGTHOF msg - 1
    xor edx, edx

DecryptLoop:
    mov al, [esi]
    cmp al, 0
    je showDecrypt
    mov dl, [ebx]
    xor al, dl
    mov [edi], al
    inc esi
    inc edi
    inc ebx
    cmp BYTE PTR [ebx], 0
    jne skipReset2
    lea ebx, key
skipReset2:
    loop DecryptLoop

showDecrypt:
    mov edx, OFFSET msg3
    call WriteString
    mov edx, OFFSET decrypted
    call WriteString
    call Crlf

    invoke ExitProcess, 0
main ENDP
END main
