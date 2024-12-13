.MODEL SMALL
.STACK 100H
.DATA
    prompt1 DB "     Enter the first number:", 13, 10, "$"
    prompt2 DB "    Enter the second number:", 13, 10, "$"
    prompt3 DB "    Enter the third number:", 13, 10, "$"
    prompt4 DB "    Enter the fourth number:", 13, 10, "$"
    resultMsg DB "    The sum of the numbers is:", 13, 10, "$"
    num1 DW ?                 ; First number
    num2 DW ?                 ; Second number
    num3 DW ?                 ; Third number
    num4 DW ?                 ; Fourth number
    sum DW ?                  ; Result of the sum

.CODE
MAIN PROC
    ; Initialize Data Segment
    MOV AX, @DATA
    MOV DS, AX

    ; Get the first number
    LEA DX, prompt1
    MOV AH, 9
    INT 21H
    CALL GetNumber
    MOV num1, AX

    ; Get the second number
    LEA DX, prompt2
    MOV AH, 9
    INT 21H
    CALL GetNumber
    MOV num2, AX

    ; Get the third number
    LEA DX, prompt3
    MOV AH, 9
    INT 21H
    CALL GetNumber
    MOV num3, AX

    ; Get the fourth number
    LEA DX, prompt4
    MOV AH, 9
    INT 21H
    CALL GetNumber
    MOV num4, AX

    ; Calculate the sum
    MOV AX, num1
    ADD AX, num2
    ADD AX, num3
    ADD AX, num4
    MOV sum, AX

    ; Display the result message
    LEA DX, resultMsg
    MOV AH, 9
    INT 21H

    ; Display the sum
    MOV AX, sum
    CALL PrintNumber

    ; Exit program
    MOV AH, 4CH
    INT 21H
MAIN ENDP

; Reads a single-digit number from the user
GetNumber PROC
    MOV AH, 1              ; Read character
    INT 21H
    SUB AL, '0'            ; Convert ASCII to digit
    MOV AH, 0              ; Clear AH
    RET
GetNumber ENDP

; Prints a multi-digit number
PrintNumber PROC
    MOV BX, 10             ; Base 10 divisor
    XOR CX, CX             ; Clear digit count

PrintLoop:
    XOR DX, DX             ; Clear DX for division
    DIV BX                 ; Divide AX by BX
    PUSH DX                ; Push remainder (digit) onto stack
    INC CX                 ; Increment digit count
    OR AX, AX              ; Check if quotient is zero
    JNZ PrintLoop          ; Repeat until AX is zero

PrintDigits:
    POP DX                 ; Get digit from stack
    ADD DL, '0'            ; Convert to ASCII
    MOV AH, 2              ; Print character
    INT 21H
    LOOP PrintDigits       ; Loop until all digits are printed
    RET
PrintNumber ENDP

END MAIN
