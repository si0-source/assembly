INCLUDE Irvine32.inc

.data
arrByte    BYTE  1,2,3,4, 5,6,7,8, 9,10,11,12
arrWord    WORD  100,200,300,400, 500,600,700,800, 900,1000,1100,1200
arrDword   DWORD 1000,2000,3000,4000, 5000,6000,7000,8000, 9000,10000,11000,12000

rowPrompt  BYTE "Enter row index (0~2): ",0
resultMsg  BYTE "Row sum = ",0
rowIndex   DWORD ?

.code
;---------------------------------------
; calc_row_sum(array offset, row size, type size, row index)
; [ebp+8] = array offset
; [ebp+12] = row size
; [ebp+16] = type size
; [ebp+20] = row index
;---------------------------------------
calc_row_sum PROC
    push ebp
    mov ebp, esp
    push esi
    push edx
    push ecx

    mov esi, [ebp+8]    ; array offset
    mov ecx, [ebp+12]   ; row size
    mov edx, [ebp+16]   ; type size
    mov eax, [ebp+20]   ; row index

    imul eax, ecx
    imul eax, edx
    add esi, eax        ; esi points to start of the row

    xor eax, eax        ; sum = 0

sum_loop:
    cmp ecx,0
    je done
    cmp edx,1
    je sum_byte
    cmp edx,2
    je sum_word
    cmp edx,4
    je sum_dword

sum_byte:
    movzx ebx, byte ptr [esi]
    add eax, ebx
    add esi,1
    dec ecx
    jmp sum_loop

sum_word:
    movzx ebx, word ptr [esi]
    add eax, ebx
    add esi,2
    dec ecx
    jmp sum_loop

sum_dword:
    mov ebx, dword ptr [esi]
    add eax, ebx
    add esi,4
    dec ecx
    jmp sum_loop

done:
    pop ecx
    pop edx
    pop esi
    mov esp, ebp
    pop ebp
    ret
calc_row_sum ENDP

;---------------------------------------
main PROC
    ; BYTE array
    mov edx, OFFSET rowPrompt
    call WriteString
    call ReadInt
    mov [rowIndex], eax

    push [rowIndex]    ; row index
    push 1             ; type size
    push 4             ; row size
    push OFFSET arrByte ; array offset
    call calc_row_sum
    mov edx, OFFSET resultMsg
    call WriteString
    call WriteInt
    call Crlf

    ; WORD array
    mov edx, OFFSET rowPrompt
    call WriteString
    call ReadInt
    mov [rowIndex], eax

    push [rowIndex]
    push 2             ; type size
    push 4             ; row size
    push OFFSET arrWord
    call calc_row_sum
    mov edx, OFFSET resultMsg
    call WriteString
    call WriteInt
    call Crlf

    ; DWORD array
    mov edx, OFFSET rowPrompt
    call WriteString
    call ReadInt
    mov [rowIndex], eax

    push [rowIndex]
    push 4             ; type size
    push 4             ; row size
    push OFFSET arrDword
    call calc_row_sum
    mov edx, OFFSET resultMsg
    call WriteString
    call WriteInt
    call Crlf

    exit
main ENDP
END main
